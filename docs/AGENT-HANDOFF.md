# AGENT HANDOFF — Acer AN515-45 Linux/BIOS Investigation
## Read this FIRST. Everything the previous agent learned, built, and got wrong.

---

## THE MACHINE

```
Model:    Acer Nitro 5 AN515-45 (NH.QBRSI.001)
Serial:   <serial removed>
CPU:      AMD Ryzen 9 5900HX (Cezanne, Zen 3)
GPU:      NVIDIA RTX 3070 Laptop (NOT 3080 — user corrected this)
Board:    Scala_CAS (LA-K851P), manufactured by Compal
BIOS:     Insyde H2O, currently V1.14 (latest, installed via WU 2026-08-14)
Storage:  C: Samsung 980 1TB (Windows, DON'T TOUCH)
          D: Samsung 870 QVO 1TB (data, DON'T TOUCH)
          E: WD SN530 238GB (empty, designated Linux target)
USB:      116GB "General USB Flash Disk" (flaky but user says it works)
          Linux disk-name: nvme-WDC_PC_SN530_SDBPNPZ-256G-1114_211140805407
          (the Windows serial E823_8FA6... appears only as nvme-eui.* name)
```

## THE PROBLEM

The machine hard-freezes or instantly restarts when running Linux — during install
or normal use, 30s-7min in. Only `acpi=off` historically let it run (at cost of
touchpad/GPU/HDMI). Windows runs flawlessly forever. 4 logged deaths all show:
WiFi radio power activity as the last thing alive, temps normal (44-66°C), zero
kernel errors, zero panics, armed NMI watchdog never fires — the failure is
below the OS, at the SoC/EC/SMU level.

## ROOT CAUSE (verified from firmware, ~70% confidence on causation)

AMD's `AmdNbioAlibRNDxe` driver embeds a 29,360-byte ACPI SSDT (OEM: AMD, TableID:
ALIB) containing a power-mailbox method with an **infinite busy-wait loop** polling
the SMU status register (bank 0x03B10564, variable A117):

```
AML: A2 08 93 41 31 31 37 0A 00    (While A117 != 0x00){})
```

The loop has NO timeout. When Linux enters it (triggered by EC power-budget events,
which WiFi radio shifts cause), the SMU never sends the completion signal, and the
machine wedges below the OS. Windows survives because Acer's Windows drivers service
the mailbox handshake.

**The loop exists in ALL 7 BIOS versions (1.03-1.14).** The 1.11 AGESA refresh
changed the surrounding table (25,479 bytes differ) but the wait-loop mechanism on
the same SMN register exists in every generation — just variable-named A111 in
1.03-1.10 and A117 in 1.11+.

**Exonerated by evidence:** thermal (temps were cold), kernel software bugs (zero
errors), kernel version (6.12 dies same as 6.17+), UCSI (no USBC000 device),
media (user tested multiple drives).

**Trigger correlation:** WiFi radio power transitions are the last activity before
every death (4/4 logged deaths). But this is correlation, not proven causation.

## WHAT WAS TRIED AND FAILED

| Attempt | Result | Why it failed |
|---------|--------|---------------|
| acpi.loop_timeout=1 | Inert | NOT a real mainline kernel parameter (was an acpiexec tool option) |
| acpi=off | Works but crippling | Kills touchpad, GPU, HDMI; the ONLY thing that historically ran |
| thermal.off=1 | Didn't help | Deaths occurred WITH it active — thermal not the (sole) cause |
| WiFi blacklist (modprobe.blacklist=iwlmvm,iwlwifi) | Untested in isolation | Never got a clean test with just this + no other variables |
| Fix ladder (5 entries: FIX-1 through FIX-5) | User tried, reported failures | Multiple attempts, multiple options — WiFi blacklist may not have been tested alone |
| DSDT initrd override (early cpio) | **Blocked by kernel lockdown** | Secure Boot → kernel lockdown → ACPI table override disabled |
| GRUB acpi command | **Blocked by GRUB lockdown** | User got: "error: acpi: the command is not allowed when lockdown is enforced" |
| Configfs supplementary SSDT | Allowed but useless | Loads AFTER broken table already in namespace; can only ADD, not REPLACE |

## SECURE BOOT CONSTRAINT (CRITICAL)

**User REQUIRES Secure Boot ON for Windows applications.** This eliminates ALL
software-level ACPI table modification:
- Kernel initrd override: blocked by kernel lockdown
- GRUB acpi command: blocked by GRUB's own lockdown (user confirmed by booting)
- Configfs SSDT: technically allowed but fires too late (broken table already loaded)

The only viable fix with SB permanently on: **patch the firmware itself** (custom
BIOS) or **prevent the trigger** (kernel parameters like WiFi blacklist).

## REMAINING OPTIONS (ranked)

1. **Custom BIOS patch** — one byte change at known offset, flash modified firmware
2. **WiFi blacklist alone** (kernel param, SB-compatible) — never cleanly tested
3. **Coreboot port** — weeks/months of work, no existing port for this board
4. **WSL** — user's current workaround, works fine for their needs

## ALL DISK LOCATIONS (D:\Acer\ — 13GB total)

### Reports & Documentation
```
D:\Acer\AN515-45-Linux-BIOS-Investigation.md     — FULL REPORT, sections 1-14
D:\Acer\BIOS-MOD-STUDY-GUIDE.md                   — study guide + patch spec for the user
D:\Acer\INSTALL-CARD.md                            — install instructions (outdated, fix ladder era)
D:\Acer\RUNBOOK-Linux-Test.md                      — old test runbook (outdated)
```

### Firmware Images (the BIOS binaries)
```
D:\Acer\extracted\103\abobios.bin                 — BIOS 1.03 (Jan 2021, launch)
D:\Acer\extracted\106\abobios.bin                 — BIOS 1.06
D:\Acer\extracted\108\abobios.bin                 — BIOS 1.08
D:\Acer\extracted\110\abobios.bin                 — BIOS 1.10
D:\Acer\extracted\111\abobios.bin                 — BIOS 1.11
D:\Acer\extracted\113\abobios.bin                 — BIOS 1.13
D:\Acer\analysis\cap114\BIOS_1.14.FD              — BIOS 1.14 (from WU capsule)
D:\Acer\analysis\cap113w\BIOS_1.13.FD              — BIOS 1.13 (WU cert-refresh variant)
D:\Acer\analysis\capsule_114.cab                   — WU capsule for 1.14 (SHA256: 5aaf8f03...)
D:\Acer\analysis\capsule_113.cab                   — WU capsule for 1.13 refresh
D:\Acer\BIOS-all\                                   — original download packages (9 files)
```

### Firmware Analysis (the deep work)
```
D:\Acer\analysis\
├── ALIB_103.aml through ALIB_114.aml            — broken table extracted from every version
├── ALIB_emb.dsl / SSDT_RT.dsl                    — decompiled ALIB table (readable)
├── DSDT_1103.dsl through DSDT_113.dsl            — decompiled DSDTs, every version
├── DSDT_patched.aml / DSDT_patched.dsl           — the FIXED DSDT (with ALIB stub)
├── OLD.dsl                                        — old-gen table (1.03-1.10)
├── change_matrix.txt                              — complete 7-version module diff table
├── runtime_acpi\                                  — 21 ACPI tables pulled from live Windows
├── dump_1103\ through dump_114\                   — fully decompressed firmware volumes
│                                                    (1,800+ files each, all 7 versions)
├── dump_w113\                                     — WU-refreshed 1.13 variant dump
├── initrd-x\                                      — Debian installer internals (busybox, preseed)
│   └── udeb\                                      — extracted partman/preseed udebs
├── iasl\iasl.exe                                  — ACPI compiler/decompiler
├── acpi_override.cpio                             — initrd override container (SB-off method)
├── acpi-pkg\                                      — Debian's official acpi-override hook package
├── grubpristine\                                  — stock grub.cfg templates
└── grub137\                                        — patched grub.cfg with acpi fix (didn't work)
```

### Installer Files
```
D:\Acer\install\
├── debian-13.6.0-amd64-DVD-1.iso                  — Debian 13.6 DVD (SHA256 verified)
├── debian-13.6.0-amd64-netinst.iso                 — Debian 13.6 netinst
├── debian-13.7.0-amd64-DVD-1.iso                   — Debian 13.7 DVD (latest, SHA256 verified)
├── early.cpio                                      — initrd override container (SB-off method)
├── preseed.cfg                                     — minimal preseed (late_command only)
├── an515\dsdt.aml                                  — the fixed DSDT (oemrev=3)
├── an515\acpi-override-hook                        — Debian's official hook script
├── an515\di-logger.sh                              — installer-phase crash logger
├── an515\an515-logger.sh                           — installed-system crash logger
├── an515\an515-logger.service                      — systemd unit for above
├── an515\install.sh                                — portable kit (any distro)
├── an515\MANIFEST                                   — build manifest
├── grub137\grub-acpi-fix.cfg                       — grub.cfg with acpi command (blocked by SB)
├── build-137-stick.ps1                              — full stick builder script
├── deploy-grub-acpi.ps1                             — GRUB acpi deploy script
├── patch-grub.py                                    — grub.cfg patcher (various versions)
└── platform.ini copies                              — Insyde flasher configs (in extracted\)
```

### Tools
```
D:\Acer\tools\ghidra_12.1.4_PUBLIC\                — Ghidra installation (for REA)
```

### Recipe (reproducible)
```
D:\Linux Debug Stick Recipe\
├── RECIPE.md                                       — complete build guide
└── files\                                          — all scripts + configs
```

### USB Stick (when plugged in, F:)
```
Currently: Debian 13.7.0 DVD (stock) + dsdt.aml + preseed.cfg + patched grub.cfg
The GRUB acpi approach DOES NOT WORK with Secure Boot on (confirmed by user).
```

## KEY HARDWARE/SOFTWARE IDs

```
Firmware hardware ID: uefi\RES_{77bcf6d6-1902-42e6-8e65-cf1eb9c79974}
WU Update ID (1.14): c0df064d-d1f4-47a7-9d6c-1b81acfab71b
WU Update ID (1.13): 7e404df2-6235-439a-a5b7-450b6029f792
Capsule SHA256 (1.14): 5aaf8f034cff310ce9479ba583a0ffb0fdb56bd31972c932405f80aadd7ef7cc
Platform string: GH51Z
ALIB driver GUID: fecca19a-d1d3-4cdd-b477-56573f58b1a3
ALIB table location: PE offset 0x23E0 in AmdNbioAlibRNDxe
Killer loop location: embedded table offset 0x1B05 (PE offset 0x3EE5)
Killer loop bytes: A2 08 93 41 31 31 37 0A 00
Patch: change 0x93 → 0x95 at PE offset 0x3EE7
```

## INSYDE FLASHER CONFIG (platform.ini, key flags)
```
[Bios_Version_Check]          Flag=2       (same/older rejected; bump version to pass)
[Platform_Check]              Flag=3       PlatformName1=GH51Z (keep this string)
[FlashSecureBIOSOverride]     EnableFlashSecureBIOSOverride=0  (the escape hatch, set to 1)
[ForceFlash]                  ALL=1
```

## USER CONTEXT & COMMUNICATION RULES

- **User is a ROM hacker** (built custom Android ROMs for Solana Saga). Capable of
  firmware modification, SPI flashing, and recovery. Not a beginner.
- **User is EXHAUSTED from troubleshooting.** A previous 2-day session ended in a
  full Windows reinstall and DATA LOSS. Every interaction cycle costs them 15-30
  minutes of rebooting. Minimize their effort.
- **User REQUIRES Secure Boot ON** for Windows applications (anti-cheat, etc.)
- **User wants a NORMAL installer** — no invented credentials, no custom partitioning,
  no automated decisions. They answer every installer question themselves.
- **DO NOT** apply fixes without explicit user consent. The user has been burned by
  auto-applied "fixes" multiple times.
- **DO NOT** blame hardware without evidence (the stick was wrongly accused of dying;
  it installed Windows fine — the "dying" verdict was a Windows Storage CIM bug).
- **VERIFY before claiming.** The previous agent made multiple mistakes by relying on
  memory instead of checking primary sources. Every "fact" should cite its receipt.
- **Search before building.** The previous agent shipped an inert kernel parameter
  (acpi.loop_timeout) that wasn't a real mainline parameter. The user caught it.
- **Don't argue with the user.** They know their machine. When they say something
  works or doesn't, believe them first, verify second.
- **User reads visible thinking.** Any internally-noticed gap must be fixed immediately
  or not flagged as acceptable.

## CRITICAL LESSONS LOGGED

1. Constructed by-id disk names from Windows serials are WRONG — always read names
   from a live Linux boot (the logger writes them at install start)
2. `setsid` doesn't exist in d-i busybox — plain `/bin/sh &` is correct
3. `acpi.loop_timeout` is an acpiexec TOOL option, NOT a mainline kernel parameter
4. Kernel lockdown (triggered by Secure Boot) blocks ALL ACPI table modification
5. GRUB's own lockdown also blocks the `acpi` command (user confirmed by booting)
6. OEM Revision must be strictly NEWER for an override to apply (not just equal)
7. FAT32 stick copies must use `cmd /c copy`, not Git Bash `cp` (permission errors)
8. PowerShell Get-Volume can go blind while file I/O still works — use cmd, not cmdlets
9. 7z cpio extraction can silently fail — use Python's newc parser instead
10. Every fix must be logged as applied/not-applied, measured from the running system
11. The user's USB stick works fine — the "dying stick" verdict was wrong

## CURRENT STATE (as of 2026-10-12)

- Machine on BIOS V1.14 (latest, no update available)
- Windows works perfectly, user uses WSL for Linux development
- Debian 13.7.0 installer stick built with GRUB acpi fix — **DOES NOT WORK** (SB blocks it)
- All firmware analysis complete (7 versions, all tables, all drivers)
- The patch target is known (one byte at one offset)
- The user is studying BIOS modification to do the patch themselves
- Custom BIOS is the only remaining fix path with Secure Boot permanently on

## WHAT TO DO NEXT (if the user asks)

1. **If user wants the BIOS patch:** guide them through the one-byte change (spec in
   BIOS-MOD-STUDY-GUIDE.md section 9), help with the rebuild, verify before flash
2. **If user wants to test WiFi-blacklist alone:** rebuild stick with ONLY
   `modprobe.blacklist=iwlmvm,iwlwifi` as kernel param, no other changes
3. **If user wants Coreboot:** point them to src/soc/amd/cezanne in the Coreboot
   tree, help them extract GPIO/memory config from the existing firmware dumps
4. **If user gives up on native Linux:** confirm WSL is adequate, close the project
