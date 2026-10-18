# Acer Nitro 5 AN515-45 — BIOS / Linux Investigation

**Date:** 2026-09-06
**Machine:** Acer Nitro 5 AN515-45 (board `Scala_CAS`), S/N <serial removed>
**Verified hardware (queried from Windows):**
- CPU: AMD Ryzen 9 5900HX with Radeon Graphics (Cezanne, Zen 3)
- iGPU: AMD Radeon Graphics (amdgpu `gc_10_3_6` / Cezanne)
- dGPU: **NVIDIA GeForce RTX 3070 Laptop GPU** (user-confirmed; NOT the 3080 SKU)
- Hybrid graphics: internal panel driven by the AMD iGPU; dGPU hybrid/optimus

---

## 1. Executive verdict

1. **This laptop is already on BIOS V1.14** — the "unobtainable" Windows-Update-only version.
   `Win32_BIOS`: Insyde Corp. `V1.14`, release 2026-06-23. Installed 2026-08-14 via Windows Update
   as "Insyde Software Firmware Driver Update (5.42.1.14)". Whatever Linux problem exists,
   it exists **on top of 1.14**.
2. **BIOS 1.14 contains ZERO ACPI changes.** All 59 static ACPI tables (including DSDT and every
   SSDT) are **byte-identical between 1.13 and 1.14** (verified by MD5 of every extracted table).
   1.14 is Acer's **Secure Boot certificate rollout update** — the firmware diff consists of
   appended Microsoft X.509 certificates ("Microsoft Windows Third Party Component CA 2012",
   "Microsoft Windows Hardware Compatibility Publisher", validity 2025-11-13 → 2026-11-10,
   matching the June-2026 UEFI CA expiry wave) plus one Insyde flasher-config string change
   (`DCDEN RESSEN` → `DCDIS RESSDIS` in the flash INI image).
3. **The "incomplete ACPI tables for the 5900HX" theory is not supported by the firmware.**
   The static ACPI suite is a complete, modern AMD Cezanne set (full `CPM*` power-management
   family, dGPU/iGPU gating SSDTs, NVIDIA tables, TPM 2.0 tables). Additionally, many tables
   (IVRS, SRAT, etc.) are generated at runtime by AMD NBIO DXE drivers and never appear in the
   flash image at all — absence in the image ≠ missing at boot.
4. **The only ACPI-visible vendor change across the last three BIOS versions is Acer's own
   update-service device** (see §4): 1.11→1.13 moved device `AFUB` ("Acer FUB Virtual Driver",
   HID `10251517`) out of the DSDT into a new 70-byte SSDT (`ACRSYS`/`ACRPRDCT`) as `ADED`,
   always present. Nothing about CPU, power, thermal, or graphics.
5. **Conclusion: no Acer BIOS version hop (up or down) will fix a Linux boot problem on this
   machine.** The problem is in kernel/driver/boot-method territory, not in firmware tables.
   Known-good AN515-45-specific fixes are in §6.

---

## 2. BIOS inventory (D:\Acer)

| Version | File | Notes |
|---|---|---|
| 1.03 | `3 BIOS Firmware/BIOS_Acer_1.03_A_A.zip` → `GH51Z103.exe` | rel.note: "Update LCD setting and brightness table" |
| 1.06 | `3 BIOS Firmware/BIOS_Acer_1.06_A_A.zip` | |
| 1.08 | `3 BIOS Firmware/BIOS_Acer_1.08_A_A.zip` | |
| 1.10 | `3 BIOS Firmware/BIOS_Acer_1.10_A_A.zip` → `BIOS_110.exe` | |
| 1.11 | `3 BIOS Firmware/BIOS_Acer_1.11_A_A.zip` → `BIOS_111.exe` | Insyde V1.11, 2023-07-11 (Manjaro thread user had this) |
| 1.13 | `BIOS_Acer_1.13_A_A.zip` → `GH51Z113.exe` | latest site-flashable version |
| **1.14** | site stub = instructions-only PDF ("There is no executable BIOS file in this download… delivered automatically via Windows Update") | **already installed on this machine** |
| VBIOS 1.02a | `3 BIOS Firmware/Firmware_Acer_v102a_A_A.zip` | NVIDIA vBIOS updater (`Scala_CAS_Kamiq_CAS` — matches this board) |
| `Acer.pow` | root | Windows power plan export |

All flashers are Insyde H2OFFT packages; 7-Zip extracts them to `abobios.bin` (18,209,936 bytes)
+ H2OFFT flasher. Images: `D:\Acer\extracted\{113,111}\abobios.bin`.

---

## 3. The 1.14 capsule — where it came from (it IS obtainable offline)

- Windows Update history (this machine): 2026-08-14 "Insyde Software Firmware Driver Update (5.42.1.14)".
- Microsoft Update Catalog entry: **"Insyde Software Firmware Driver Update (5.42.1.14)"**,
  Driver Model "Acer Inc. System Firmware 1.14", targeting hardware ID
  `uefi\res_{77bcf6d6-1902-42e6-8e65-cf1eb9c79974}`, published 2026-06-24.
  - UpdateID `c0df064d-d1f4-47a7-9d6c-1b81acfab71b` (dupe: `7440815c-d1ab-43d0-b9b1-58887a90c4c2`)
  - CAB: https://catalog.s.download.windowsupdate.com/d/msdownload/update/driver/drvs/2026/08/7aca9c11-72a3-45bc-b0a1-dfc17ee1a1c8_acbe54aa11114938f8de80e9c60c8857d8641139.cab
- Saved locally: `D:\Acer\analysis\capsule_114.cab` → extracted to `D:\Acer\analysis\cap114\`
  (`BIOS_1.14.FD` 18,230,304 bytes, `BIOS_1.14.INF/.CAT`, `fim.dat`).
- Full firmware-volume dumps: `D:\Acer\analysis\dump_{111,113,114}\`.
- Decompiled DSDTs: `D:\Acer\analysis\DSDT_{111,113}.dsl` (+ `.aml`), `SSDT_ACRPRDCT_113.dsl`.
  1.14 DSDT is byte-identical to 1.13 → `DSDT_113.dsl` is also 1.14's DSDT.

**Note on Secure Boot:** 1.14 rolls the new Secure Boot certificates. If you later dual-boot
Linux with Secure Boot ON, current distro shims (signed with the 2011/2023 MS certs) still load;
the certs in db matter for Microsoft's 2026 rotation. Keeping Secure Boot **disabled** for Linux
testing sidesteps all of it.

---

## 4. ACPI table diff, version by version

Static tables found per image: 1.11 = 58, 1.13 = 59, 1.14 = 59.

### 1.11 → 1.13
- DSDT changed (29,655 → 29,561 bytes). Full decompiled diff:
  - removed field `AFU0` from the EC/CMOS field block;
  - removed `Device (AFUB)` — "Acer FUB Virtual Driver", `_HID "10251517"` — which was
    conditionally present (`_STA` returned 0x0F only when AFU0 ∈ {1,2});
  - new 70-byte SSDT `ACRSYS/ACRPRDCT` declares `Device (ADED)` under `\_SB.PCI0` with the
    **same `_HID "10251517"`**, unconditionally.
  → Pure Acer-firmware-update plumbing (this HID is the Acer/Insyde update-service device).
- All other 53 shared tables byte-identical.

### 1.13 → 1.14
- **All 59 tables byte-identical (every MD5 matches). No ACPI change whatsoever.**

### Full static ACPI inventory (1.13 = 1.14)
Static tables: APIC(MADT), ASF!, BOOT, DSDT, FACP, FACS, HPET, MCFG, SLIC, SPCR, and SSDTs:
ACDC, ACRPRDCT (1.13+), AOD, AhciTabl, CDFAADG1/G2 + CDFAAIG1/G2 (AMD Cezanne dGPU/iGPU
power-gating), CPMACPV1/V2, CPMCMN, CPMD3CLD, CPMDFDG1/G2, CPMDFIG1-5, CPMEC, CPMLPETH,
CPMMSLPI, CPMOTHPG, CPMSFAML, CPMUCSI, CPMWBH, CPMWLBTN, CPMWLRC, CPMXPRES, CPMZPODD×2,
DFDGCNEV, DFDGOVTP, DRTM, MSLPIDIS, NvdPegTb×2, NvdTable×3 (NVIDIA), PCIx, PcdTabl, SECBIO,
STD3, SataFrez, TPMACPI, TcgTable, Tpm2Tabl.
(IVRS/SRAT/NFIT etc. are runtime-generated by AMD NBIO drivers — normal.)

---

## 5. Community evidence for this model/silicon

| Thread | Hardware | Symptom | Outcome |
|---|---|---|---|
| CachyOS (the one you linked) | **ASUS** ROG Strix G533QS — same 5900HX+3080, NOT Acer | (1) won't boot with AC plugged in; (2) amdgpu freeze without `nomodeset=1` | **Unresolved.** acpi_osi tricks no effect; blacklisting amdgpu boots; asusctl+modprobe partial; kernel 7.0.3 didn't fix |
| Arch BBS 273540 | AN515-45 (GTX 1650 variant) | kernel panic **only on restart**; Fast Boot re-enabled itself in BIOS | Solved by kernel update; poweroff+button workaround |
| Manjaro forum 182813 | **AN515-45, 5900HX, RTX 3080, BIOS 1.11** | shutdown/reboot hang at power-off | removing `fbcon=map:01` / not using HDMI monitor avoided it |
| Garuda forum 43817 | AN515-45 | **black screen booting any live USB** (Rufus/dd media) | **Solved with Ventoy** + grub2 boot option |
| r/linuxhardware o6afm0 | AN515-45-R8V0 5900HX/3080 | Linux compat reports (2021) | (fetch blocked — low value, similar issues) |

Cross-model pattern: on this Cezanne+RTX hybrid platform the boot-blockers reported are
amdgpu (iGPU) initialization and boot-medium quirks — not missing firmware tables.

## 6. What to actually try (evidence-ordered)

1. **Make the USB with Ventoy** and boot the ISO via its *grub2* option — proven fix for this
   exact model's live-USB black screen.
2. BIOS settings: **Fast Boot disabled** (known to silently re-enable itself on this model —
   re-check after every shutdown), Secure Boot disabled for testing, boot mode UEFI.
3. At the ISO boot menu (press `e`), test in this order:
   - `nomodeset` — proves it's GPU-init (expect success);
   - then `modprobe.blacklist=amdgpu` (leave NVIDIA/nouveau) — isolates amdgpu like the CachyOS case;
   - if it boots with either: install, use latest kernel, then add NVIDIA drivers and re-enable amdgpu.
4. If boot fails only on AC power (CachyOS case #1): test on battery vs AC — cheap datapoint.
5. If shutdown/reboot hangs (Manjaro case): avoid `fbcon=map:01`; test without external monitor.
6. **Don't chase BIOS versions.** 1.14 is installed, and its firmware is ACPI-identical to 1.13.
   Downgrading to 1.13 via H2OFFT (`GH51Z113.exe`) is possible but pointless for Linux and risks
   anti-rollback/brick trouble.

## 7. Data that would let me pin the exact cause (next session)

- Which distro/ISO + how the USB was made, and **where exactly boot stops** (photo of last
  on-screen lines; hold power 5s to escape).
- From a live USB that reached a shell: `sudo dmesg > dmesg.txt` (or photo of the tail),
  `journalctl -b -1 --no-pager | tail -100`, `lspci -nn`, `cat /proc/cmdline`.
- If it black-screens: try Ctrl+Alt+F3 (TTY switch) before declaring dead.
- Optional deeper dive: `sudo cat /sys/firmware/acpi/tables/DSDT > dsdt.aml` from Linux to get
  the **runtime** 1.14 table set (I have the static set; runtime adds NVRAM-patched entries).

---

## Appendix: artifact paths
- `D:\Acer\analysis\cap114\BIOS_1.14.FD` — 1.14 firmware image (from WU capsule)
- `D:\Acer\analysis\capsule_114.cab` — original WU capsule
- `D:\Acer\analysis\dump_{111,113,114}\` — full extracted firmware volumes (thousands of files)
- `D:\Acer\analysis\DSDT_{111,113}.{aml,dsl}` — decompiled DSDTs, diffed
- `D:\Acer\analysis\SSDT_ACRPRDCT_113.dsl` — the one new SSDT in 1.13
- `D:\Acer\analysis\iasl\iasl.exe` — iasl 20260408 (Windows)
- Method: 7-Zip → H2OFFT exe → `abobios.bin`; FVs located by `_FVH` scan; parsed with
  `uefi_firmware` (pip); tables validated by signature+length; diffed by MD5; DSDT diffed via iasl.

---

## 8. Symptom analysis (added after receiving the Claude-session log)

### Reported failure signature
Hard freeze ~30–40 s into boot; reproduced on 9 distros (Ubuntu, Fedora, Kubuntu, Mint,
CachyOS, Bazzite, elementary, Debian, openSUSE), 2 verified-good USB sticks, clean Memtest86+.
`acpi=off` is the ONLY escape (at cost: I2C-HID touchpad dead, dGPU dead, HDMI dead).
Freeze intermittent without it. Ruled out: RAM, media, graphics driver (safe-graphics froze),
AMD-IOMMU (BIOS-off froze), `idle=nomwait` (no effect). Secure Boot was ON during most tests
(irrelevant to a hard freeze). Tests ran on BIOS 1.13; machine is now on 1.14 — **ACPI-identical,
so those results carry over exactly.**

### What the firmware analysis adds (all verified from local images)
1. **Firmware-regression hypothesis is now bounded**: across the ENTIRE 1.03→1.14 DSDT lineage
   there is exactly one thermal-relevant change pair:
   - 1.06→1.08: Acer ADDED thermal zone `\_TZ.TZ01` (EC-backed `_TMP`, `_CRT` 120°C, `_HOT`);
   - 1.08→1.10: Acer REWROTE `_TMP` (was EC `P204`, became: if `EC0.Q27F==1` return 110°C else
     read `EC0.CTMP`), raised `CHOT` 75→110°C, removed a `Notify(TZ01,0x81)` trip event.
   - 1.10→1.11→1.13→1.14: thermal/CPU/EC scopes functionally UNCHANGED (1.10→1.11 diff is only
     the iasl compiler-version string; 1.11→1.13 is the Acer FUB→ADED device move).
   So "Ubuntu worked on this machine before" aligns with either pre-1.08 firmware (no ACPI
   thermal zone existed) or an older kernel — both fit the same theory; a BIOS version change
   today changes nothing (verified), and downgrade is NOT recommended.
2. **`TZ01._TMP` is the only `_TMP` in the firmware** (no thermal zones in any of the 59 SSDTs).
   Linux's thermal core (and thermald on installed systems) begins evaluating it shortly after
   boot — matching the ~30–40 s window.
3. **The DSDT contains multiple busy-wait AML loops** that are plausible hard-freeze sources:
   - SoC ADC/sensor mailbox: `DSAD`/`HSAD`/`SECR` — MMIO at `0xFED81E40+(n<<1)`, polling
     `ADDS`/`SD28` status bits (`While (Local0 != 0x07)` etc.). Reached via device `_PS0`/`_PS3`
     (runtime PM!) which call `HSAD(0x1C, …)`.
   - EC/SMBus busy-waits: `ESMC`/`SBA2`/`ERCD` (`While (~(Local4 == Local5))` on `EC0.SMD0`).
   - A full WMI stack (device `WMID` + 27KB `ACRPRDCT` WMI SSDT with `_WED` dispatcher) — the
     `acer_wmi` kernel driver binds and queries it.
   Any of these evaluated while the EC/SoC interface is in an unexpected state = spinning AML =
   hard freeze, intermittent by nature, gone with `acpi=off`.

### Ranked suspects
1. ACPI thermal / EC evaluation path (`TZ01._TMP` or EC-burst contention) — timing + acpi=off fit.
2. Device runtime-PM (`_PS0/_PS3`) walking into the SoC-sensor mailbox loops.
3. acer-wmi / WMI evaluation.
4. fTPM (tpm_crb) — lower probability, cheap to test.
NOT suspects: nouveau/graphics (safe-graphics froze), AMD-IOMMU, C-state MWAIT (tested), media.

### Test ladder (live USB, ONE variable at a time, `quiet splash` stripped)
0. **Red-handed test:** at first live-desktop moment run `watch -n1 cat /sys/class/thermal/thermal_zone*/temp`
   — if the box freezes on this, TZ01/EC is caught in the act.
1. `thermal.off=1` — ACPI thermal driver off; `_TMP` never evaluated.
2. `modprobe.blacklist=acer_wmi`
3. `cpuidle.off=1` (idle=nomwait did NOT disable ACPI C-states — this does)
4. BIOS: TPM/fTPM off
5. `pci=noacpi`, then `acpi=noirq` — partial-ACPI narrowing before acpi=off
6. Ubuntu 24.04.x installer (kernel 6.8 GA / 6.11 HWE) — the "worked before" regression test
   (2 external reports: 5800H+RTX3070 Nitro freeze fixed by kernel change)
Capture on every freeze: reboot → `journalctl -b -1 --no-pager | tail -60`; ideal: netconsole
for the true last words (a freeze never flushes disk).
If `thermal.off=1` alone fixes it → permanent GRUB param (k10temp still reports temps; the EC
runs fans autonomously), and file an upstream kernel ACPI bug — DSDT evidence is already
packaged in this folder (DSDT_113.dsl = 1.14's).

---

## 9. Complete cross-version change matrix (all 7 BIOS versions, full firmware)

Method: full FV dump of 1.03/1.06/1.08/1.10 (matching earlier dumps of 1.11/1.13/1.14);
inventory of every ACPI table (sig+OEM-table-ID+MD5) and every named DXE module
(UI-name + content MD5). Raw matrix: `analysis/change_matrix.txt`, `analysis/tables.json`.

| Hop | ACPI tables | Firmware modules | Meaning |
|---|---|---|---|
| 1.03→1.06 (2021-01→04) | DSDT, AOD, CPMDATPX, NvdPegTb, NvdTable changed | 49 changed (PSP, SMU V12, IOMMU, Fabric, Zen3 PI...) | "Update AMD PI code" per Acer notes |
| 1.06→1.08 (2021-04→07) | **DSDT only: thermal zone TZ01 ADDED** | 21 changed (AcpiPlatform...) | thermal zone introduced |
| 1.08→1.10 (2021-07→2022-08) | **DSDT: TZ01._TMP rewritten**; NvdTable | 25 changed; IdeBusDxe removed | thermal logic rewrite |
| **1.10→1.11 (2022-08→2023-07)** | **DSDT compiler-string only (functionally identical!) BUT entire AMD CPM SSDT family regenerated** (15 added incl. CPMACPV1/V2, CPMDFIG1-5, CDFAADG/CDFAAI; 8 removed; 29 changed incl. **CPMUCSI** 3990→4966 bytes) | **294 of ~314 modules changed** (SmuV12*, AmdPspDxeV2Rn, AmdNbio*, all AmdCpm*, CompalThermalDxe); +AmdRasRn*/AmdPlatformRasRnDxe/AmdCpmWirelessButtonHidDxe; −AmdPspRomArmorSmm | **wholesale AGESA/platform refresh** |
| 1.11→1.13 (2023-07→2025) | DSDT (ADED move), ACRPRDCT | 19 changed; +AcerDeviceEnabling | Acer update-service plumbing |
| 1.13→1.14 (2025-06) | **none — all 59 identical** | 14 changed; **+ReplaceSecureBootKey** | Secure Boot cert update (confirmed at module level) |

### New conclusions from the matrix
1. **Three real firmware boundaries** exist for the freeze: 1.06→1.08 (TZ01 added),
   1.08→1.10 (_TMP rewrite), and **1.10→1.11 (everything AMD)**. "Ubuntu worked before"
   could sit on any of them (or on kernel age).
2. **Correction to §6.6:** downgrade IS a meaningful bisect lever after all — but only
   across the 1.10/1.11 boundary (1.11→1.13→1.14 are ACPI-equivalent). A 1.10 flash
   (`BIOS_110.exe`, Aug 2022) tests the entire pre-AGESA-refresh platform: old CPM SSDT
   family, old SMU/PSP/NBIO, pre-refresh CPMUCSI. Invasive (H2OFFT downgrade may need
   platform.ini checks bypassed; anti-rollback risk) — keep as the LAST diagnostic, after
   the kernel-parameter ladder and old-kernel ISO test.
3. **New prime suspect: USB-C UCSI.** CPMUCSI SSDT (HID `USBC000`, bound by Linux
   `ucsi_acpi` driver) changed materially at 1.11. ucsi/typec hangs are a documented
   freeze class on other laptops. Cheap tests: freeze test with NOTHING attached to
   USB-C; then `modprobe.blacklist=ucsi_acpi`. Ladder updated accordingly.

### Updated test ladder (insert after thermal rung)
- `modprobe.blacklist=ucsi_acpi` (and keep USB-C empty during tests)
- Order: R0 thermal-zone red-handed test → R1 `thermal.off=1` → R2 `modprobe.blacklist=ucsi_acpi`
  → R3 `modprobe.blacklist=acer_wmi` → R4 `cpuidle.off=1` → R5 fTPM off → R6 `pci=noacpi`/`acpi=noirq`
  → R7 Ubuntu 24.04.x (6.8/6.11) → R8 (last resort) BIOS downgrade to 1.10.

---

## 10. ROOT CAUSE FOUND: ALIB → SMN-mailbox spin loop (2026-09-06, runtime-table analysis)

By dumping the LIVE ACPI tables from the Windows registry (`HKLM\HARDWARE\ACPI`,
→ `analysis\runtime_acpi\`), a table invisible in the flash image was found:

**A 29,360-byte Acer SSDT that exists ONLY at runtime** (installed by a DXE driver at boot —
the static image never contains it). Decompilation (`analysis\SSDT_RT.dsl`) shows:

1. Public entry: **`Method (ALIB, 2)`** — the AMD "library" function dispatcher
   (codes 0x0C/0x10/0x11/0x12/0xAA…). Everything else in the table is internal A-names.
2. All paths converge on **`Method (A011)`**: write command to a mailbox, then
   **`While ((A117 == 0x00)){}`** — an EMPTY-BODY INFINITE LOOP polling `A117`, a 32-bit
   BankField in an SMN (AMD System Management Network) register bank (0x03B10564) —
   i.e. spin until the SMU/PSP acknowledges. No timeout, no Sleep, ever.
3. Callers INTO ALIB (cross-verified in the DSDT):
   - **`Device (ACAD)._PSR`** (AC-adapter power-source method) → `ALIB(1,…)`
     — evaluated by the kernel AC/battery driver AND polled by UPower
     (~30 s cadence once the desktop session starts).
   - **`CDPC`** (CPU power control; writes SMUF/SMUD then `ALIB(0x0C,…)` while holding
     mutex DPMX).
   - amdgpu also evaluates `\_SB.ALIB` on AMD systems (external reports).
4. AWR0/ABR0-ABR9 wrapper devices (PNP0C02, _UID 0x80-0x90) own the mailbox plumbing.

### Why this matches every symptom
- **30–40 s freeze**: desktop session start → UPower/power-supply poll → `_PSR` → ALIB → spin.
  Kernel's AML loop timeout default = **30 s** (`AE_AML_LOOP_TIMEOUT`), aligning with the window.
- **Intermittent**: only freezes when the SMU ack doesn't arrive in time (state race).
- **All 9 distros**: power-supply/UPower polling is universal; nothing GPU-related needed
  (explains safe-graphics still freezing).
- **Only `acpi=off` escapes**: it stops ALL AML evaluation.
- **`acpi=off` collateral**: no I2C-HID touchpad, no dGPU, no HDMI — expected (ACPI enumeration).
- **Windows immune**: zero WHEA/ACPI errors in the machine's event log; Acer's Windows
  driver/SMM stack services the mailbox handshake.
- **External corroboration**: Linux Mint forum amdgpu `\_SB.ALIB` errors; r/AMDHelp Dec-2025
  "random full freezes" with `AE_AML_LOOP_TIMEOUT` on `\_SB.ALIB`; ALIB SSDT common on AMD.

### The fix (surgical — keeps touchpad/GPU/HDMI working)
**Primary candidate: kernel parameter `acpi.loop_timeout=1`** — instructs the ACPI
interpreter to abort any AML spin loop after 1 s instead of 30. Expected result: the ALIB
call stalls 1 s, logs `AE_AML_LOOP_TIMEOUT` in dmesg, boot continues normally.
**Confirming fingerprint** on any surviving boot: `dmesg | grep -iE "loop_timeout|ALIB|AE_AML"`.
Secondary: `modprobe.blacklist=amdgpu` (diagnostic only — kills the amdgpu→ALIB path but not
the _PSR path; display falls back to efifb). If loop_timeout alone doesn't stop the freeze
(spin may hold ACPI locks too hard), combine with battery-poll avoidance and re-test;
last-resort firmware lever remains BIOS 1.10 (§9).
Report upstream with: SSDT_RT.dsl, DSDT lines 6203/7589, dmesg fingerprint.

Artifacts: `analysis\runtime_acpi\*.bin` (21 live tables), `analysis\SSDT_RT.dsl` (the
runtime-only table), `analysis\SSD7_RT.dsl` (AMD PLTF runtime table, benign),
`analysis\SSD4_WMI_RT.dsl` (WMI, EC-only, cleared), runtime-vs-static DSDT byte-diff
(63 bytes: OEM re-stamp only — static DSDT analysis remains valid).

---

## 11. Simulator verification + refined trigger + automated test stick (2026-09-06 evening)

### acpiexec simulation (real runtime tables, this machine)
- Control `ECOK` → returns 1. Namespace loads cleanly (17 tables, 11 _INI ran).
- `_PSR` → `ALIB(1)` **benign** — returns instantly. AC/battery polling is NOT the trigger
  (corrects §10's UPower/_PSR theory).
- `CDPC` path executes guard-dependent code: with EC registers simulated as 0, `_Q20` exits
  early via `Default → Return(Zero)` before reaching ALIB. The spin path requires REAL
  power-budget values, so the emulator cannot reproduce it — structural evidence stands.

### Refined root-cause chain (decompilation-verified)
**EC query 0x20** (`_Q20` — power-budget change handler, reads EC `SUPL`/`SPPT` wattage
fields, fires asynchronously when charger/power state settles) → `CDPC(0x03..0x07, value)`
(holds mutex `DPMX`) → `ALIB(0x0C, …)` → `A025` → `A011` → **`While((A117==0x00)){}` SMN
spin**. Other CPMCMN call sites: `ALIB(0x06)` (M114/M113), `ALIB(0x0C)` (XL0A/XL0B).
Asynchronous EC event = intermittency + graphics-independence. `acpi.loop_timeout=1`
covers every entry path. ALIB dispatch codes: 00,01,02,03,06,0A,0B,0C,10,11,12,AA.

### Zero-interaction test stick (user cannot collect results from Linux)
`D:\Acer\autotest\` — `autorun1` harness (SystemRescue) + README. The stick runs 4 boots
itself (1 baseline + 3× acpi.loop_timeout=1), heartbeat-logs every 5 s with sync to the
stick (freeze moment survives), self-sequences kernel params by rewriting its own
grub.cfg, powers the machine off after boot 4, and writes `FINAL-REPORT.txt`.
User interaction: F12 four times + force power-off on freezes. Results read back from
Windows by the assistant. Build is pending: user plugs USB, confirms drive letter + erase.

---

## 12. CORRECTION — `acpi.loop_timeout` is not a mainline kernel parameter (2026-09-08)

Independent review (poteto-agent) + verification against torvalds/linux: no `acpi.loop_timeout`
in kernel-parameters.txt; no loop-timeout global in drivers/acpi/acpica/acglobal.h. The knob
exists in AcpiCA's acpiexec tooling (which I used locally) — I wrongly projected it onto the
Linux kernel. The parameter on the install stick is INERT (ignored with a dmesg warning).

Consequences:
- The freeze fix cannot be a boot parameter. If the ALIB-spin diagnosis is right, the fix is:
  (a) ACPI table override of the DSDT via initrd (classic, supported on Debian): patch the
      DSDT to define a benign \_SB.ALIB stub → Acer's runtime ALIB SSDT then hits a namespace
      collision and fails to load → mailbox never runs. DSDT is a unique table (no OEM-ID
      collision problem — unlike the SSDTs, all 17 of which share ACRSYS/ACRPRDCT IDs).
  (b) or the V1.15 custom BIOS (§ tier-3 plan).
- The Debian 13.6 (kernel 6.12) stick run remains the correct next step regardless:
  no-freeze ⇒ kernel-era dependence, done; freeze ⇒ confirms no parameter can save it and
  escalates to the override/custom-BIOS path. Stick logging (upgraded by review) captures
  by-id names, ACPI error counts, and outcome either way.

Review also fixed (preseed, synced to stick): firmware-load prompt auto-accept,
pkgsel offline-upgrade suppression, `|| true` guards on all late_command steps,
Windows-stays-default NVRAM BootOrder reorder after install (was: Debian would have silently
become default boot), locale form, force-efi-extra-removable pinned, build-stick.ps1
input-validation-before-erase. Disk pin verified byte-identical.

---

## 13. FULL PRE-BOOT AUDIT (2026-09-09, "check everything" — every item verified against sources)

Method column: READBACK = bytes read from stick F:; INITRD-SOURCE = read from the installer's
own unpacked files; EMPIRICAL = proven by the user's real 2026-09-09 boot attempts.

| Item | Verdict | Verified how |
|---|---|---|
| UEFI loader / kernel / initrd / menu / .disk/info on stick | all present | READBACK |
| Menu: stock untouched + ONE AN515 entry, zero params, preseed once | PASS | READBACK |
| preseed-manual sets exactly ONE key: preseed/early_command | PASS | READBACK |
| Old automated preseed (credentials/partitions) deleted | PASS | READBACK |
| Logger scripts LF + syntax | PASS | READBACK + bash -n |
| All 14 busybox commands di-logger uses exist in installer | PASS | INITRD-SOURCE (tree/bin) |
| preseed/file= cmdline → debconf var mapping | PASS | INITRD-SOURCE (/etc/preseed_aliases) |
| File-preseed load + early_command ordering | PASS | INITRD-SOURCE (S30/S33/S60 + lib/preseed/preseed.sh) |
| /cdrom remount-rw + write from early_command | PROVEN | EMPIRICAL (attempt RESULT file written by this exact chain) |
| FAT32-stick UEFI boot to installer | PROVEN | EMPIRICAL (user's attempts reached the installer) |
| d-i default partition recipe (for the interactive install) | documented | INITRD-SOURCE (recipes-amd64-efi/30atomic: ESP 768M, /boot 768M, swap up to 100% RAM) |
| Installed-system logger + kit | staged on stick | READBACK |

Residual known limits (unchanged, previously disclosed): deaths before the preseed loads are
unloggable userspace-side; busybox `tail -n +N` syntax assumed standard (feature-compiled in
Debian d-i busybox; same binary family the failed attempts ran with).

STICK STATE: one entry, interactive, zero configuration, logging only. READY.

---

## 14. REA/Ghidra reversal: the ALIB table found IN the flash image (2026-09-12)

User pointed at github.com/morluto/rea (reverse-engineering toolkit). Installed via npm
(`rea-agents` 6.4.0) + Ghidra 12.1.4 (D:\Acer\tools\, GHIDRA_INSTALL_DIR). REA's binwalk/
pwntools providers need Linux, but Ghidra-backed native analysis works on Windows.

**Result — the central mystery of §10/§11 is closed:** the runtime-only ALIB SSDT is a
STATIC plaintext AML blob embedded in `AmdNbioAlibRNDxe`'s PE `.data` section:
- Driver: dump_114 .../file-fecca19a-d1d3-4cdd-b477-56573f58b1a3/section1.pe (41,152 B;
  42 functions; .data = 31,648 B)
- Table: file offset **0x23E0**, len 29,360, OEM `AMD`, TableID `ALIB`
- Extracted: `analysis\ALIB_embedded.aml`; decompiled `ALIB_emb.dsl`
- Byte-compare vs runtime dump: **71 differing bytes, ALL in the header stamp area**
  (Acer's OemAcpiPlatform re-brands AMD/ALIB -> ACRSYS/ACRPRDCT at boot). AML body
  IDENTICAL. The table was never generated at runtime — earlier "no plaintext in image"
  verdict (§12-era) was wrong: the 2026-09-09 namestring search ran on dump_113 only;
  dump_114's copy was found by REA's ALIB string search.
- Killer loops located in the embedded copy: no-op wait @embedded 0x1AB4 (PE 0x3E94),
  `While((A117==0x00)){}` @embedded 0x1B05 (PE 0x3EE5); A117 = 32-bit BankField on SMN
  bank 0x03B10564 (unchanged from §10).
- Why Windows survives unchanged: the AML is identical for all OSes; Acer's Windows
  driver services the mailbox so A117 acks arrive. Linux enters the loop and the SMU
  never acks -> SoC-level wedge (matches all 4 logged deaths, WiFi-power trigger).

**Consequences for the fix paths:**
1. FIRMWARE PATCH (custom BIOS) is now concretely possible: patch target bytes exist at
   a known offset (PE 0x3EE5 area); same-length AML patch = flip the killer loop's
   predicate to always-false (e.g. LEqual->LLess byte 0x92->0x95 class edit - EXACT
   patch to be validated by recompiling and diffing with iasl). Remaining walls
   unchanged: FV re-LZMA + FFS rebuild + Insyde SecureFlash signature (platform.ini
   escape flags documented in §12) + PSP risk. Full V1.15 plan now has its missing piece.
2. SOFTWARE FIX unchanged in design but now informed: initrd DSDT override w/ \_SB.ALIB
   stub -> namespace collision aborts loading of THIS table at boot (all OSes can then
   not reach the loop; call sites in DSDT/CPMCMN hit the stub). No flash risk.

Artifacts added: ALIB_embedded.aml, ALIB_emb.dsl, tools/ghidra_12.1.4_PUBLIC, REA installed globally.
