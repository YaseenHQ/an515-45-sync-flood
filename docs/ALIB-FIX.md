# AN515-45 reset: the AMD ALIB SMU mailbox, and the test that decides it

## What the firmware actually contains (verified against the live machine)

The table the firmware loads at `0x00000000CDFF5000`, 29,360 bytes,
`SSDT/ACRSYS/ACRPRDCT` rev 2, is AMD's ALIB. It is byte-identical to the copy
extracted from the BIOS 1.14 image (`ALIB_114.aml`), so what runs is what was
analysed. It contributes exactly one thing to the namespace:
`Scope (\_SB) { Method (ALIB, 2) ... }`. The live DSDT calls it twice:
`\_SB.ALIB (0x0C, XX11)` and `ALIB (One, XX00)`.

Inside it, `Method (A011, 2, Serialized)` is AMD's SMU mailbox transaction:

```asl
A117 = 0x00                 // clear response register   SMN 0x03B10564
While ((A117 != 0x00)){}    // dead as written
A118 = A111 ... A123 = A116 // argument registers        SMN 0x03B10998+
A124 = Arg0                 // message register          SMN 0x03B10528  (doorbell)
While ((A117 == 0x00)){}    // wait for the response, NO timeout
```

`A117`–`A124` are `BankField`s over `OperationRegion (A126, SystemMemory, AGRB,
0x1000)`, i.e. the NBIO SMN index/data aperture. They are referenced **only**
inside `A011`, which is called from 41 sites in the table. So `A011` is the
single chokepoint for every SMU access this firmware makes from AML.

Those are the MP1 mailbox registers that the kernel also drives: `amdgpu`'s
Cezanne SMU code and `k10temp` reach the same SMN aperture, with no lock shared
with AML. Two independent writers on one mailbox explains the observed failure
better than a plain spin does: the logged reset reason is a **data fabric sync
flood (0x08000800)**, which is a failed fabric transaction, not a hung core. The
untimed `While` is what makes a lost response unrecoverable.

This also explains the rest of the record: `acpi=off` is the only configuration
that has ever survived, because it is the only one where AML never runs; Windows
is fine because the vendor driver cooperates with this AML path; nothing appears
in any kernel log because the fabric, not the CPU, detects the error, and the
firmware resets before anything can be written.

## Why a software fix is possible now

`AGENT-HANDOFF.md` concluded only a BIOS patch could work, because Secure Boot
was ON and kernel lockdown blocks initrd ACPI overrides. Today's boot logs show
`Secure boot disabled`, and Pond's kernel has `CONFIG_ACPI_TABLE_UPGRADE=y`. The
override route is open, with no BIOS flashing.

The override matches a table by signature + OEM id + OEM table id, and all 16 of
this board's SSDTs are `ACRSYS/ACRPRDCT`, so matching is positional. ALIB is the
**first** SSDT in XSDT order, so one override table lands on it exactly.

## The patched table

`alib-fix/ssdt-alib-noop.aml`, 29,360 bytes (length unchanged), built by binary
patch, not recompilation: iasl's own recompile of the vendor disassembly differs
from the vendor table by 1,154 bytes of encoding optimisation, which would make
any claim of "only this changed" unprovable. Instead the 86 bytes of mailbox
statements at `0x1AAF`-`0x1B04` are overwritten with `0xA3` (AML `Noop`), the
checksum is recomputed, and the OEM revision is bumped 2 -> 3 so the boot log
shows which copy loaded.

- bytes differing from the firmware's table: 88 (the 86-byte span, the checksum
  byte, and the 4 revision bytes); none elsewhere
- disassembling the patched table reproduces the vendor ASL with the ten mailbox
  statements replaced by 86 `Noop`s, and nothing else
- packed as an uncompressed newc cpio, `kernel/firmware/acpi/ssdt-alib.aml`,
  29,632 bytes, sha256 `dcecf71c...c902c9df`, parsed back to confirm the payload

`ALIB` still runs, still returns, and no longer touches the SMU mailbox.

## Installed on the machine

- `/boot/an515-acpi-alib.cpio` on Pond, loaded as the first initrd
- ESP `EFI/pond/an515.cfg`: one entry, stock Pond cmdline plus `panic=10`,
  `softlockup_panic=1`, `nmi_watchdog=panic`, `rd.emergency=reboot`
- ESP `EFI/pond/an515.env`: `an515_test=alib`, `an515_next=stop`. GRUB consumes
  the pointer before booting, so a reset lands in Windows, never in a loop
- `emergency.service.d` and `rescue.service.d` drop-ins replace sulogin with
  `/etc/an515/emergency-dump.sh`, which saves the failed units, mountinfo and
  journal tail to `/var/log/an515/emergency.txt` and reboots. Root is locked on
  this install, so the sulogin prompt could never be answered; that is the trap
  that stranded the machine earlier, and it is now closed
- `trace.sh` logs once a second with fsync, and records whether the override
  loaded (`Table Upgrade: override`, and ALIB at revision 3 instead of 2)

## Reading the result

- survives, with touchpad, dGPU and HDMI working: the ALIB SMU mailbox is the
  cause, and the fix is a file, not a BIOS mod
- resets anyway, with the log showing ALIB at revision 3: the mailbox is
  eliminated outright, which removes the main suspect carried by this
  investigation since the first handoff
