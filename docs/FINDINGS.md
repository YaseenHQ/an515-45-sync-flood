# AN515-45 BIOS 1.14 — firmware review (2026-10-13)

All facts below were checked against primary files; paths are cited.

## What is fine

- Live ACPI tables (dumped from Windows into `tables\`) are consistent: 16 CPUs in
  MADT, IOAPIC IDs 0x21/0x22 match IVRS, standard AMD IVRS, S3 platform (FADT
  "Low Power S0 Idle" = 0).
- Live DSDT (`DSDT_live.dsl`) equals the image DSDT (`DSDT_img.dsl`) except Insyde's
  normal boot patching (region addresses, `XL08`->`_L08`, `MPRW`->`_PRW`, header).
  The BIOS is not corrupted and the extracted files match what runs.
- OS detection (`DSDT_live.dsl` OSTP): Linux answers "Windows 2017.2", so firmware
  gives Linux the same paths as Windows 10/11 (`_OSI("Linux")` is false by default).

## Corrections to the earlier handoff

- `A2 08 93 41 31 31 37 0A 00` is `While (A117 == 0) {}` (0x93 = LEqual), the
  wait-for-SMU-reply step of AMD's generic ALIB mailbox (`ALIB_emb.dsl` A011).
  Patching 0x93->0x95 removes the wait, letting requests overlap. Do not apply.
- Linux aborts AML loops after 30 s with a logged AE_AML_LOOP_TIMEOUT, so this
  loop cannot cause a silent freeze or instant reset.
- No evidence that a Windows driver "services" the mailbox; Windows runs the same AML.
- "C-state MWAIT tested" only covers MWAIT. The deep C-states here are I/O-port
  based and were never disabled in any recorded test.

## Update after the first logged crash (installer, max_cstate=1)

Suspect 1 below is ruled out: the reset happened with only POLL+C1 in use, idle
at the `apt-setup-udeb` prompt for 359 s, temperatures falling (63->53 C), no
MCE/ACPI/thermal messages, no suspend/resume, no GPU or WiFi driver loaded, and
0 WHEA events in Windows afterwards. Remaining: a reset below the OS
(firmware/SMM, EC, watchdog, PCIe sync flood, power). Next evidence: the AMD
reset reason, read by the stick's "After a crash: read the last reset reason"
entry. Logs: `D:\Acer\old-linux-logs\20261014-205318-installer-reset`.

## Reset reason read (2026-10-17, after a Pond reset ~10 s into the desktop)

`x86/amd: Previous system reset reason [0x08000800]: an uncorrected error caused
a data fabric sync flood event` (`E:\an515-logs\reset-reason-1.txt`; bit 11 is
also set). No preserved machine-check lines were logged at the next boot. Other
runs before it: Debian installer reset 8 min in while unpacking packages (busy, not
idle), Secure Boot on; Pond (kernel 7.2.11) reset with Fast Boot off and Secure
Boot off. A sync flood is a hardware-level uncorrected error, most often a PCIe
device that stops answering (link power states, a device powered off and then
accessed, or a failing device). Next: kernel-parameter tests in Pond
(`pcie_aspm=off`, `pcie_port_pm=off`, `nvme_core.default_ps_max_latency_us=0`),
then removing devices (WiFi card first).

## Pond journal (read 2026-10-17 via WSL btrfs mount, `pond-logs\boot*.txt`)

4 boots (RTC is local time, so journal clock reads 4 h early), each ending
39-40 s after power-on with no kernel error, MCE or AER line. Every boot reruns
`pond-first-boot-drivers.service` (never completes): `chwd`, `mkinitcpio -P`
(two ~250 MB images, all cores busy), then `pond-grub-update` (grub-mkconfig,
os-prober over every disk, grub-btrfs snapshot scan). All 4 resets land in that
last step; `/boot/grub/grub-btrfs.new` is left at 0 bytes. Both initramfs images
verify with `lsinitcpio -a`.

Changes made to Pond:
- `EFI\pond\grubx64.efi` embedded menu rewritten in place (5 s menu, default
  entry adds `pcie_aspm=off pcie_port_pm=off nvme_core.default_ps_max_latency_us=0
  amd_iommu=off`; "Pond (original)" keeps the old path). Backup:
  `EFI\pond\grubx64.efi.bak-an515` and `pond_grubx64.efi`. Script `pond_patch_grub.ps1`.
- `an515-trace.service` (sysinit) runs `/etc/an515/trace.sh`: every second
  appends temps, PCI power states, top processes and new journal lines to
  `/var/log/an515/boot-N.log` and fsyncs. Sources in `wsl\pond-files`,
  installer `wsl\install_trace.sh`. Read back with WSL distro `an515-tool`
  (`wsl --mount \\.\PHYSICALDRIVE2 --partition 2 --type btrfs`, admin).

## First traced boots (2026-10-17, all with the 4 PCIe/NVMe params)

3 boots, none stopped cleanly: died at 62 s (idle desktop, load 0.6, CPU ~50 C),
~10.5 s (driver loading; iwlwifi firmware loaded at 10.43 s, last line 10.52 s),
72 s (idle). Reset reason logged at the next boot: sync flood (0x08000800) every
time. First-boot setup finished, so the earlier "always at ~40 s" was the
setup's timing, not a trigger. No MCE/EDAC/AER records; 0 WHEA in Windows.
dGPU 01:00.0 stayed D0/active throughout (no runtime D3); only its HDMI audio
01:00.1 toggled D0/D3hot (last change 35-50 s before each reset).
Ruled out: PCIe port PM, NVMe APST, IOMMU, CPU load/heat, dGPU D3cold.
NOT ruled out: ASPM. `pcie_aspm=off` only stops Linux touching ASPM; the BIOS
left L1 enabled on both NVMe, Ethernet, WiFi and root ports 00:01.2/01.3/02.1/02.2
(trace lspci header). It also made Linux skip _OSC ("not requesting OS
control"), so AER was off in these boots. Default entry now uses
`pcie_aspm.policy=performance` instead (grubx64.efi sha256 A42757C7...).

WiFi card (Killer AX1675x = AX210, 8086:2725 subsys 1674, rev 0x420, fw 89,
00:02.2 -> 05:00.0, 5 GT/s x1, L1 exit <8 us): driver log is clean in every boot
(no microcode/hardware error, no firmware restart). The WFPM/CNVI register lines
are printed at every firmware load and are normal for this chip.

## Run 2 (corrected params) and the automatic ACPI test sequence

`pcie_aspm.policy=performance pcie_port_pm=off nvme_core.default_ps_max_latency_us=0
amd_iommu=off`: all 21 links ASPM Disabled, _OSC granted (AER on), reset at 37 s,
sync flood, no AER line. PCIe link/port power management is ruled out.

Test sequence installed 2026-10-18 (grubx64.efi sha256 DE7725D6...; old PCIe
entry removed). Embedded menu sources `EFI\pond\an515.cfg`; it reads
`an515_next` from `EFI\pond\an515.env`, saves the next number, boots Pond's normal
cmdline + `panic=10 softlockup_panic=1 nmi_watchdog=panic an515.test=N` + one change.
trace.sh re-advances the env, logs the previous reset reason to
`/var/log/an515/results.txt`, and reboots after 600 s up (PASS).
1 maxcpus=1 | 2 amd_pstate=disable + no acpi_cpufreq | 3 acpi_mask_gpe=0-255 |
4 idle=halt | 5 acpi=noirq | 6 pci=noacpi | 7 ACPI/WMI platform drivers blacklisted |
8 no ACPI battery/AC | 9 thermal.off=1 | 10 nvidia-powerd masked | then normal boot.
Stop: delete `EFI\pond\an515.cfg`.

Current harness (installed 2026-10-18, supersedes everything below in this section):
planner search over 18 pieces taken from the BIOS tables, `/etc/an515/plan.sh`
(state in `/var/log/an515/plan.state`, log in `/var/log/an515/results.txt`),
GRUB side generated by `gen_an515_cfg.ps1`. Step 0 = all pieces off. Each step keeps
one group ON; groups that reset are halved, combinations are narrowed, and the run
ends only after "all pieces except the culprits" survives 300 s (else it searches the
rest again). Group PASS = 120 s; the second half of a resetting group is only booted
if the first half gave no culprit; PASS reboots with `systemctl reboot --force`.
Simulated (45 s boot, 100 s per resetting step): one culprit ~20 min mean, 26 max;
two ~37; a pair ~33-41; everything-off resets ~2. Env holds run + after-reset steps; GRUB consumes
them before booting, so without Linux rewriting them the run ends within two boots.
End, stop or unreadable env -> Windows Boot Manager (power off if not found).
Offline check: `wsl/sim_plan.sh` (one/two/pair/triple culprits, early deaths) passes.
Pieces: 1 cpus | 2 cpu-perf | 3 cpu-idle | 4 proc-aggregator (ACPI000C) |
5 irq-routing (PNP0C0F/_PRT) | 6 pci-acpi | 7 mcfg | 8 hpet | 9 gpe-events |
10 battery-ac | 11 thermal-zones | 12 wmi-platform (PNP0C14, Acer AAMC) |
13 gpio (AMDI0030) | 14 i2c-uart (AMDI0010 incl. touchpad, AMDI0020) |
15 backlight | 16 tpm (MSFT0101) | 17 amdgpu (VFCT/CRAT/ATIF/ATCS/ALIB) | 18 nvidia.
Not switchable from the command line: the EC itself (PNP0C09) and AML/SCI as a
whole; if step 0 resets, those are what is left.

Replaced before first run by an adaptive bisection (`gen_an515_cfg.ps1` writes
an515.cfg; env starts at `an515_next=n0`). n0 turns all 13 pieces off at once: a
reset there ends the run as `none_of_these` after one boot. Otherwise each node turns
off half of the remaining candidates; PASS = 300 s without reset. GRUB saves the
reset branch before booting, trace.sh writes the pass branch (`an515.pass=`) on PASS.
Lone candidates reached by elimination are booted once alone (`not_single` if that
resets). End states `found_<piece>`, `none_of_these`, `not_single` chainload Windows
Boot Manager. 21 nodes, at most 6 boots per path. All module blocks share one
`module_blacklist=` (the kernel keeps only the last one).
Pieces: 1 maxcpus=1 | 2 no cpufreq | 3 GPEs masked | 4 idle=halt | 5 acpi=noirq |
6 pci=noacpi | 7 WMI/platform drivers | 8 battery/AC | 9 ACPI thermal | 10 NVIDIA |
11 amdgpu | 12 TPM | 13 ccp/PSP.

Earlier revision notes (the linear list they refer to is gone):
- Pond's kernel is Clang ThinLTO, so `initcall_blacklist=` must name the
  `__initstub__kmod_...` symbols (from `build/System.map`); test 8 now lists both forms.
- Module tests use `module_blacklist=` (kernel refuses the load, including as a
  dependency) instead of `modprobe.blacklist=`.
- Added what `acpi=off` also removes: 11 NVIDIA driver off | 12 amdgpu off (ATIF/
  ATCS/ALIB/VFCT users) | 13 TPM CRB/TIS off (fTPM talks to the PSP) | 14 ccp/PSP off.
- results.txt gets an `applied:` line at 30 s (cpus, cpufreq, cpuidle, TPM,
  power supplies, thermal zones, skipped initcalls, loaded drivers) to prove each
  change took effect.

BIOS/firmware messages in Pond boot logs (none are AML runtime errors):
- `ccp 0000:06:00.2: unable to access the device: you might be running a broken
  BIOS` then `tee enabled`, `psp enabled`: in every boot that lived past ~11 s
  (the "missing" ones are journals cut off at ~10 s, before ccp loads). The CCP
  crypto queues are not exposed; PSP works. Not a discriminator on its own -> test 14.
- `tpm_read_log_acpi: Failed to map ACPI memory`: every boot; event-log mapping only.
- `_OSI(Linux)` ignored, WMBF missing, ECAM partial bridge coverage, _OSC lacks
  SHPCHotplug/LTR/DPC: present in every boot, crash or not.

Visible Acer setup items (SetupUtility, BIOS 1.14) that could touch this, if the
model shows them: Graphic mode (MSHybrid / dGPU only), Fast Boot, Battery
threshold, Power-off USB charging, Wake on LAN/WLAN, USB wake with lid closed.
S1/S3/RTC-wake and wake options only act on sleep/wake, which never ran.

## Ranked suspects (before the first logged crash)

1. **CPU deep idle (CC6) via I/O-port C-states.** (Ruled out, see above.) `ssdt\ACPI_SSD7...dsl` `_CST`:
   C1 = FFH, C2 = I/O 0x414 (18 us), C3 = I/O 0x415 (350 us). Generated at boot by
   `SmuV12DxeCZN`. `acpi=off` removes `_CST` (CPU idles with HLT only), which fits
   it being the only stable config; `idle=nomwait` does not touch these states.
   Firmware already has vendor switches (AMD CBS, hidden), decoded from
   `CbsSetupDxeRN` IFR with `ifr_dump.py`:
   - Variable `AmdSetup` {3a997502-647a-4c82-998e-52ef9486a247}
   - `0x24` Global C-state Control: 0 Disabled, 1 Enabled, 3 Auto (default)
   - `0x13E` DF Cstates: 0 Disabled, 1 Enabled, 255 Auto (default)
   - `0x2F` ACPI _CST C1 Declaration: 0/1/3 (Auto default)
   Linux check without firmware change: `processor.max_cstate=1`.
2. **NVIDIA dGPU D3cold/GC6** (`ssdt\ACPI_SSD5...dsl` PG00 `_OFF`, GPP0 `_DSD`
   HotPlugSupportInD3). Linux runtime PM uses it; weakened by "safe graphics froze".
3. **WiFi slot GPP4.PXSX** (`DSDT_live.dsl` ~7882): handles Intel 0x8086 and
   MediaTek 0x14C3; EC bit `WLEX` power resource; Intel FLR via hard-coded cap offset.
4. **EC power-limit path**: `_Q20` -> `CDPC` -> `ALIB(0x0C)`; `_PSR` -> `ALIB(1)`.
   Same on Windows; low.
