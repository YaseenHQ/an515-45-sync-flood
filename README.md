# Acer Nitro 5 AN515-45: Linux hard resets (AMD data fabric sync flood)

Every Linux boot on this laptop hard-resets within seconds to minutes. Windows on the same hardware is stable. This repo holds the logs, ACPI tables and write-ups from the investigation. The cause is **not found**.

## Machine

- Acer Nitro 5 AN515-45, board `Scala_CAS`, Insyde BIOS V1.14
- AMD Ryzen 9 5900HX (Cezanne), NVIDIA RTX 3070 Laptop GPU
- Samsung 980 NVMe (Windows), WD SN530 NVMe, Samsung 870 QVO SATA

## Symptom

The machine resets with no panic, no oops and no machine-check log. The journal stops mid-line. The next boot of a 6.16+ kernel reports:

```
x86/amd: Previous system reset reason [0x08000800]: an uncorrected error caused a data fabric sync flood event
```

Windows logs zero WHEA hardware errors, and no BERT table is present after a reset, so the firmware leaves no error record.

## Seen in the logs

| Boot | Setup | Survived |
|---|---|---|
| Debian 13 installer | `processor.max_cstate=1`, idle at a prompt, no GPU driver and no Wi-Fi firmware loaded | 359 s |
| Debian 13 installer | normal, unpacking packages, 61 °C | 496 s |
| Pond, 5 boots | PCIe ASPM off, PCIe port PM off, NVMe APST off, IOMMU off, dGPU and Wi-Fi D3cold off, in various combinations | reset every time, all within about 100 s |
| Pond | ALIB SSDT replaced by an initrd override with the whole SMU mailbox transaction `Noop`'d (confirmed loaded: `Table Upgrade: override`, OEM revision 3) | 30.5 s, idle, 51 °C |
| Debian 13 installer | `idle=poll` (no cpuidle states offered) | 70 s |
| Debian 13 installer | `idle=poll` | 25 s |

## Ruled out

- PCIe ASPM and PCIe port power management
- NVMe APST
- IOMMU
- heat and sustained load (most resets happen idle, at 48 to 66 °C)
- dGPU and Wi-Fi runtime D3cold
- the GPU drivers and Wi-Fi firmware (the first installer crash had neither loaded)
- ACPI C-states deeper than C1, and CPU idle entirely (`idle=poll` still resets)
- AMD ALIB's untimed SMU mailbox wait (`While (A117 == 0)` in `Method(A011)`): the table was patched out and the machine still reset

`acpi=off` was never stable. It only lasted somewhat longer.

## Open leads

- In both `idle=poll` boots, the last kernel line before the reset was `ACPI Warning: Time parameter 255 us > 100 us violating ACPI spec` (an AML `Stall(255)`). The same warning also appears earlier in a boot that ran to 496 s, so it may be unrelated.
- A WSL2 kernel (Linux under Windows' hypervisor) runs for hours on this machine without resetting. The fault needs Linux to drive the hardware directly.
- Firmware outside ACPI (SMM handlers, the AMD security processor) and a marginal APU or board remain possible. Neither is proven.
- A similar open report on a different AMD chip: <https://github.com/CachyOS/linux-cachyos/issues/1078>

## Layout

- `docs/`: write-ups. `AN515-45-Linux-BIOS-Investigation.md` and `AGENT-HANDOFF.md` are the earliest; `FINDINGS.md` and `ALIB-FIX.md` are the latest.
- `acpi/`: live ACPI tables from BIOS V1.14 (`.aml` binaries plus `iasl` disassembly). `acpi/ssdt/ACPI_SSDT_ACRSYS_ACRPRDCT_00000002.*` is AMD's ALIB. The Windows license table (MSDM) is not included.
- `alib-test/`: the patched ALIB table, the initrd cpio that loads it, its disassembly, and the script that builds it from the live table.
- `logs/usb-stick-debian-installer/`: per-second crash logger output from the Debian installer boots, including the two `idle=poll` boots (`boot-2`, `boot-3`), and reset-reason captures.
- `logs/pond/trace/`: per-second, fsync'd trace logs from the Pond boots. `boot-6.log` is the ALIB-override boot.
- `logs/pond/journal/`: journals read back from the Pond boots.
- `logs/debian-2026-10-14/`: the first Debian installer crash.

Serial numbers, MAC addresses, Wi-Fi network names, local IP addresses, usernames and the hostname have been replaced in the text logs.
