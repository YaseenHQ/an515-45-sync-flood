
import os, struct, subprocess, sys

src = r"D:\Acer\analysis\droid_rt\ssdt\ACPI_SSDT_ACRSYS_ACRPRDCT_00000002.aml"
out_dir = r"D:\Acer\analysis\droid_rt\alib-fix"
os.makedirs(out_dir, exist_ok=True)
dst = os.path.join(out_dir, "ssdt-alib-fixed.aml")

b = bytearray(open(src, "rb").read())
LOOP = 0x1afc
want = bytes([0xA2,0x08,0x93,0x41,0x31,0x31,0x37,0x0A,0x00])
got = bytes(b[LOOP:LOOP+9])
print("loop bytes at 0x%x: %s" % (LOOP, got.hex(" ")))
assert got == want, "loop bytes not where expected"

# A2=While 08=len 93=LEqual "A117" 0x00  ->  While (A117 == 0) {}   (empty body, no timeout)
# 0x95 = LLess  ->  While (A117 < 0) {}  : never true for unsigned, loop body never entered.
b[LOOP+2] = 0x95
old_rev = struct.unpack_from("<I", b, 24)[0]
struct.pack_into("<I", b, 24, old_rev + 1)          # override needs a strictly newer OEM revision
b[9] = 0
b[9] = (-sum(b)) & 0xFF                             # ACPI checksum: whole table must sum to 0 mod 256
print("oem_revision %d -> %d, checksum 0x%02x, table sums to %d mod 256" % (old_rev, old_rev+1, b[9], sum(b) % 256))
assert sum(b) % 256 == 0
assert len(b) == os.path.getsize(src)
open(dst, "wb").write(bytes(b))
print("wrote %s (%d bytes)" % (dst, len(b)))

# decompile both and show every differing line
iasl = r"D:\Acer\analysis\iasl\iasl.exe"
for tag, path in (("orig", src), ("fixed", dst)):
    work = os.path.join(out_dir, tag + ".aml")
    open(work, "wb").write(open(path, "rb").read())
    r = subprocess.run([iasl, "-d", work], capture_output=True, text=True, cwd=out_dir)
    print("iasl -d %s: rc=%d %s" % (tag, r.returncode, (r.stdout.strip().splitlines() or [""])[-1][:120]))

a = open(os.path.join(out_dir, "orig.dsl"), errors="replace").read().splitlines()
c = open(os.path.join(out_dir, "fixed.dsl"), errors="replace").read().splitlines()
print("decompiled lines: %d vs %d" % (len(a), len(c)))
diffs = [(i, x, y) for i, (x, y) in enumerate(zip(a, c), 1) if x != y]
print("differing lines: %d" % len(diffs))
for i, x, y in diffs[:20]:
    if "Compilation" in x or "AML Disassembler" in x or ".aml" in x or "Checksum" in x or "Revision" in x:
        print("  (header) %d: %s  ->  %s" % (i, x.strip()[:70], y.strip()[:70]))
    else:
        print("  AML %d:\n    - %s\n    + %s" % (i, x.strip()[:100], y.strip()[:100]))
