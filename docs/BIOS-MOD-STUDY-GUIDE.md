# BIOS Modification Study Guide
## For the Acer AN515-45 (AMD Cezanne, Insyde H2O)

Built around YOUR firmware images — you already have 7 BIOS versions, all extracted
and analyzed, sitting in D:\Acer\. Every exercise uses your own files.

---

## 1. UEFI Firmware Structure (the foundation)

**What to read:**
- [UEFI Forum Specification](https://uefi.org/specifications) — the official spec (free PDF).
  Read: Section 2 (Overall boot flow), Section 3 (GPT/partitions), and the PI (Platform
  Initialization) spec volumes 1-5. Focus on Volume 3 (Firmware Volume format).
- [UEFI PI Specification Vol 3 — Firmware Volume](https://uefi.org/sites/default/files/resources/PI_Spec_1_8_1060_final.pdf)
  — The FFS (Firmware File System), how files are stored inside volumes, compression.

**What to understand:**
```
Flash Chip (SPI)
 └── BIOS Region (your abobios.bin, 18MB)
      ├── Firmware Volume (FV) — container with GUID + LZMA-compressed content
      │    ├── FFS File (GUID-identified, e.g. your AmdNbioAlibRNDxe = fecca19a-...)
      │    │    ├── Section 0 (raw data)
      │    │    ├── Section 1 (PE32 executable — the driver itself)
      │    │    └── Section 2 (UI name — "AmdNbioAlibRNDxe")
      │    ├── FFS File (another driver)
      │    └── ...
      ├── Firmware Volume (another FV)
      └── Boot Block / Recovery
```

**Exercise with your files:**
```bash
# Open your 1.14 firmware in UEFITool NE
# You already have it at D:\Acer\analysis\cap114\BIOS_1.14.FD
# Download UEFITool NE from https://github.com/LongSoft/UEFITool/releases
# Open the file, navigate the tree, find:
#   - The FV containing AmdNbioAlibRNDxe (search for it)
#   - The PE32 section (this is where the ALIB table lives at offset 0x23E0)
#   - Right-click → Extract the PE to see the raw driver binary
```

---

## 2. ACPI Tables & AML Bytecode (what we're patching)

**What to read:**
- [ACPI Specification 6.5](https://uefi.org/specifications) — Chapter 20 (ACPI Source Language)
  is the AML grammar. You don't need to memorize it — you need to read AML disassembly
  and understand method calls, while loops, and operation regions.
- [Intel iasl documentation](https://www.intel.com/content/www/us/en/developer/topic-technology/open/acpica/documentation.html)
  — how to use iasl to decompile/recompile ACPI tables. You already have iasl at
  `D:\Acer\analysis\iasl\iasl.exe`.

**Key AML opcodes for our patch:**
```
0xA0       While loop
0x92       LEqual (==)
0x93       LNotEqual (!=)  ← actually LNot + LEqual in AML
0x95       LLess (<)
0x0A 0x00  Integer constant 0
0x70       Store
0x14       Method definition
0x5B 0x82  Device definition
```

**Exercise with your files:**
```bash
# Decompile the broken table (you already have these)
cd D:\Acer\analysis
iasl\iasl.exe -d SSDT_RT.aml

# Find the killer loop in the readable output
# Line 1407: While ((A117 == 0x00)){}

# Look at the raw bytes around that area:
# Embedded offset 0x1B05 in the table:
#   A2 08 93 41 31 31 37 0A 00
#   │  │  │  └─ A117 namestring
#   │  │  └─ LNotEqual condition
#   │  └─ PkgLength (8 bytes)
#   └─ While opcode

# The fix: change byte at offset 0x1B07 from 0x93 to 0x95
# This makes the condition "A117 < 0" which is always false
# The loop body (empty) never executes. The method returns immediately.

# Verify: recompile the table and decompile again
iasl\iasl.exe -d patched_table.aml   # confirm the loop is gone
```

**Real examples of ACPI patches:**
- Search "DSDT patch Linux" on the Arch Wiki
- [Arch Wiki: DSDT overwrite](https://wiki.archlinux.org/title/DSDT_overwrite)
- [Lenovo ThinkPad DSDT patches](https://www.thinkwiki.org/wiki/How_to_patch_DSDT)
  — real-world examples of fixing broken ACPI in firmware

---

## 3. Insyde H2O Firmware (your BIOS vendor)

**What to read:**
- [Insyde H2OFFT documentation](https://www.insyde.com/h2offt) — the flash tool
- The `platform.ini` file in your extracted BIOS — you already have this at
  `D:\Acer\extracted\113\platform.ini`. Read it to understand the flasher's
  configuration and security flags.

**Key things you already discovered:**
```
[Bios_Version_Check]    Flag=2         ← enforces same-or-newer version
[Platform_Check]         Flag=3         ← checks "GH51Z" platform string
[FlashSecureBIOSOverride] EnableFlashSecureBIOSOverride=0  ← the escape hatch
[ForceFlash]            ALL=1           ← force flash all regions
```

**Exercise:**
```bash
# Compare platform.ini across all versions:
for v in 103 106 108 110 111 113; do
    echo "=== $v ==="; grep -E "SecureFlash|Version_Check|ForceFlash" extracted/$v/platform.ini
done
# Note what changed and what didn't
```

---

## 4. Firmware Modification Tools

**Download and install:**

| Tool | What it does | Link |
|------|-------------|------|
| UEFITool NE | Visual firmware explorer/editor | [GitHub](https://github.com/LongSoft/UEFITool/releases) |
| iasl | ACPI compile/decompile | Already have it |
| Python + uefi_firmware | Scripted firmware parsing | Already installed |
| python-pefile | PE32 analysis | Already installed |
| HxD (hex editor) | Manual byte editing | [mh-nexus.de/hxd](https://mh-nexus.de/hxd/) |
| flashrom | SPI flashing (Linux) | [flashrom.org](https://flashrom.org) |
| CH341A programmer | Hardware SPI flasher | ~$10 on Amazon |

**Exercise: UEFITool NE walkthrough**
```
1. Open BIOS_1.14.FD in UEFITool NE
2. Ctrl+F → search for "ALIB" (as text)
3. Navigate to the hit inside AmdNbioAlibRNDxe's PE32 section
4. Right-click the PE32 section → "Extract body" → save the raw PE
5. Open the PE in HxD → go to offset 0x23E0 → see the "SSDT" signature
6. This is the ALIB table we've been analyzing

Now you know how to navigate ANY Insyde BIOS with UEFITool.
```

---

## 5. LZMA Compression & FV Rebuilding (the hard part)

**What to read:**
- [LZMA SDK](https://www.7-zip.org/sdk.html) — the compression algorithm
- [EDK2 Firmware Volume format](https://github.com/tianocore/edk2/blob/master/MdePkg/Include/Pi/PiFirmwareVolume.h)
  — the C header that defines FV/FFS structures

**The challenge:**
When you modify a driver inside an FV, you need to:
1. Recompress the modified content with the SAME LZMA parameters the original used
2. Fix the FFS file size (it changes if the compressed size differs)
3. Fix the FFS file header checksum
4. Fix the FV volume checksum
5. Ensure the total image size is unchanged (pad if needed)

**Tools for this:**
- UEFITool NE has a "Replace body" feature that handles recompression
- python-lzma can recompress with matching parameters
- The [uefi-firmware-parser](https://github.com/Linaro/uefi-firmware-parser) Python library

**Exercise (safe — no flashing):**
```
1. Extract a small driver from your 1.14 firmware using UEFITool
2. Modify one non-critical byte (e.g. in the UI name string)
3. Use UEFITool's "Replace body" to put it back
4. Verify the rebuilt image still parses correctly
5. Compare the original vs rebuilt image byte-by-byte
   (only the modified region + headers should differ)
```

---

## 6. SPI Flashing & Recovery

**Hardware needed:**
- CH341A programmer (~$10)
- SOIC8 test clip (for in-circuit programming)
- Female-female jumper wires

**What to read:**
- [flashrom documentation](https://flashrom.org/Flashrom)
- [SOIC8 clipping guide](https://www.flashrom.org/supported_hw/supported_prog/serprog/serprog-unknown)
- BadCaps forum: [BIOS chip replacement/programming](https://www.badcaps.net/forum/forumdisplay.php?f=77)

**Your specific chip:**
```bash
# From Windows, identify the SPI chip:
# It's likely a Winbond W25Q128 (16MB) or similar
# The chip is usually near the BIOS battery, SOIC8 package (8 pins)

# Reading with flashrom (from a Linux live USB):
sudo flashrom -p ch341a_spi -r backup.bin

# Writing:
sudo flashrom -p ch341a_spi -w patched.bin

# Always keep a backup of the ORIGINAL before any write
```

**You already have 7 backup images** (all versions in D:\Acer\extracted\).

---

## 7. AMD AGESA & PSP (the blobs inside)

**What to read:**
- [AMD AGESA documentation](https://developer.amd.com/resources/developer-guides-manuals/)
  — look for the "AGESA for Cezanne" documentation
- [Coreboot AMD Cezanne SoC code](https://review.coreboot.org/plugins/gitiles/coreboot/+/refs/heads/main/src/soc/amd/cezanne/)
  — real C code showing how AGESA is used

**What you already have:**
- All AGESA modules identified in the change matrix (D:\Acer\analysis\change_matrix.txt)
- The AmdNbioAlibRNDxe driver analyzed with Ghidra
- All binary blobs extractable from the firmware dumps

---

## 8. Real-World BIOS Mod Examples

**Search these communities:**
- [Win-RAID Forum](https://winraid.level1techs.com/) — the most active BIOS modding community. Search "Insyde H2OFFT modify" for examples.
- [BadCaps BIOS Repository](https://www.badcaps.net/forum/forumdisplay.php?f=77) — chip-level repair, dumping, and reflashing
- [BIOS-Mods.com](https://www.bios-mods.com/forum/) — older but has good Insyde-specific threads
- [Reddit r/BiosMods](https://www.reddit.com/r/BiosMods/) — smaller but active
- [Coreboot mailing list](https://mail.coreboot.org/hyperkitty/list/coreboot@coreboot.org/) — for the Coreboot path

**Specific example threads worth reading:**
1. "Unlock hidden BIOS menu Insyde H2O" — teaches you about Setup variable IFRs
2. "SLIC activation mod for Windows OEM" — shows byte-level ACPI table patching
3. "Add NVMe support to legacy BIOS" — shows how to insert new modules
4. "Fix broken ACPI table in firmware" — exactly what we're doing

---

## 9. Your Specific Patch — Full Specification

```
TARGET:    D:\Acer\analysis\cap114\BIOS_1.14.FD
DRIVER:    AmdNbioAlibRNDxe (file GUID fecca19a-d1d3-4cdd-b477-56573f58b1a3)
LOCATION:  PE32 section, file offset 0x23E0 (ALIB SSDT table)
PATCH:     Table offset 0x1B05 = PE offset 0x3EE5

BEFORE:    A2 08 93 41 31 31 37 0A 00   (While A117 != 0x00)
AFTER:     A2 08 95 41 31 31 37 0A 00   (While A117 < 0x00 — always false)

CHANGE:    One byte: offset 0x3EE7 in the PE32 section: 0x93 → 0x95

EFFECT:    The killer loop never executes. ALIB method returns immediately.
           The broken infinite wait on the SMU register is neutralized.
           Windows continues to work (Acer's driver services the mailbox).
           Linux stops freezing (the loop it enters never spins).

VERIFICATION (before flashing):
  1. Extract the modified table → decompile with iasl → confirm loop is gone
  2. Verify the table checksum (must be recalculated after byte change)
  3. Parse the full firmware image with uefi_firmware → no parse errors
  4. Verify image size unchanged (same-length patch)
  5. Run the independent audit agent on the rebuilt image

RECOVERY:
  - Stock 1.14 image: D:\Acer\analysis\cap114\BIOS_1.14.FD (SHA256 verified)
  - Stock 1.13 image: D:\Acer\extracted\113\abobios.bin
  - All other versions: D:\Acer\extracted\{103,106,108,110,111}\abobios.bin
  - Hardware: CH341A + SOIC8 clip to reflash if bricked
```

---

## 10. Recommended Learning Path

### Week 1: Understanding
- Read the UEFI PI spec Vol 3 (Firmware Volumes)
- Open your BIOS images in UEFITool NE, explore the tree
- Decompile DSDTs with iasl, read the AML, understand the structure

### Week 2: Practice (safe)
- Extract and re-insert a driver using UEFITool NE
- Modify a UI string (harmless change), rebuild, verify parsing
- Practice LZMA recompression of a small section
- Read the platform.ini thoroughly, understand every flag

### Week 3: The Patch
- Apply the one-byte patch to the extracted ALIB table
- Verify the patched table with iasl (decompile → check loop gone)
- Rebuild the firmware image
- Run ALL verification checks
- Set up the CH341A programmer and practice reading the SPI chip

### Week 4 (optional): Coreboot exploration
- Build Coreboot for a Cezanne reference board (QEMU emulated)
- Study the Cezanne SoC code structure
- Understand what a board port would require for your specific hardware
