# AN515-45 — Concrete Linux Test Runbook

**Print this or keep it open on your phone. You do not need the chat to run it.**
Companion: `AN515-45-Linux-BIOS-Investigation.md` (background/evidence). Fill `RESULTS.md` as you go.

## Ground rules (read once)

1. **Nothing here installs or writes anything.** Live-USB testing never touches your disk.
   Your Windows, files, and D:\Acer are safe. You only install Linux AFTER a config passes
   3 boots in a row (step R7).
2. **Freeze = hard freeze** (caps lock light unresponsive / clock stopped / cursor frozen).
   Escape = hold power button 5-10 s. That is normal and harmless.
3. **Pass = 10 minutes up +** open a terminal and run a few commands without dying.
   Your freezes hit at 30-40 s, but one clean boot happened before, so **every rung needs
   3 consecutive passes** to count.
4. When a freeze happens during a test, first photo the screen (shows last kernel lines —
   that photo is evidence), then power off.

---

## R0 — Prepare (in Windows, ~15 min, one time)

1. USB stick: any stick ≥8 GB you're willing to erase. Your previous sticks booted this
   machine fine (you reached boot on 9 distros), so any flashing method you used before
   (Rufus/dd/Etcher) is fine — media is not a variable here.
2. **Flash the ISO with what you already use** (e.g. Rufus from https://rufus.ie —
   select the ISO, GPT partition scheme for UEFI, default settings, Start; it erases the stick).
   Each ISO needs its own re-flash of the stick.
3. ISO to flash first: **one you already have** (the Ubuntu or CachyOS you tested before — reuse it).
4. **Optional but do it now:** also grab the **old-kernel Ubuntu 24.04** ISO for test T7:
   https://releases.ubuntu.com/24.04/ → `ubuntu-24.04.x-desktop-amd64.iso` (any 24.04 point
   release). Flash it when you reach T7.
5. Troubleshooting note (only if relevant): if a stick ever black-screens before the boot menu
   appears — which never happened to you — that's a known AN515-45 quirk some users solved by
   using Ventoy instead of Rufus/dd. Ignore unless it happens.
5. BIOS prep (F2 at Acer logo):
   - Fast Boot = **Disabled** (re-check this EVERY session — this model re-enables it by itself)
   - Secure Boot = **Disabled** (for the duration of testing; simpler than MOK)
   - TPM, SVM, IOMMU: leave at defaults for now.
6. In Windows, create `D:\Acer\RESULTS.md` (template below) — or copy the template now.

## R1 — The red-handed test (do this FIRST, needs no parameters)

1. Boot the USB: power on, hammer **F12** → pick your USB in the one-time boot menu →
   pick the ISO's normal boot entry (e.g. "Try or Install Ubuntu"; do NOT pick safe graphics).
2. The moment you reach the desktop (or a terminal), run:
   ```
   watch -n1 'cat /sys/class/thermal/thermal_zone*/temp; date'
   ```
3. Watch up to 10 minutes.
   - **Freezes during this** → photo screen, power off, write `T1: S (froze at _m_s)`.
     Thermal-zone/EC convicted. Skip to R7 with `thermal.off=1` as your permanent fix.
   - Survives 10 min → leave it running and note `T1: P`.

## R2 — Kernel-parameter ladder (one parameter per run of 3 boots)

How to set a parameter (Ubuntu/Fedora live):
1. At the ISO's GRUB menu, highlight the normal boot entry, press **`e`**.
2. Find the line starting with `linux`. Go to its END, add a space + the parameter.
3. Press **Ctrl+X** (Ubuntu) or **F10** (Fedora/CachyOS) to boot.
   (It applies to THIS boot only. Nothing is saved anywhere.)

Run each row for **3 consecutive boots**. Stop at the first row that passes 3×3.

| # | Parameter (append exactly) | Tests whether the freeze is… |
|---|---|---|
| **T2** | **`acpi.loop_timeout=1`** | **THE PRIME SUSPECT** — infinite AML spin loop in Acer's runtime `ALIB` SSDT (SMN mailbox). 1 s timeout instead of 30. **Expected: boot survives; `dmesg | grep -iE "loop_timeout|ALIB"` shows `AE_AML_LOOP_TIMEOUT`** |
| T3 | `modprobe.blacklist=amdgpu` | amdgpu's own ALIB evaluation (diagnostic; display will be basic framebuffer) |
| T4 | `thermal.off=1` | the ACPI thermal zone (TZ01._TMP / EC) |
| T5 | `modprobe.blacklist=acer_wmi` | Acer's WMI interface |
| T6 | `cpuidle.off=1` | CPU C-state transitions |
| T7a | `pci=noacpi` | ACPI PCI routing |
| T7b | `acpi=noirq` | ACPI IRQ handling |

On every passing boot, run and record:
```
dmesg | grep -iE "loop_timeout|ALIB|AE_AML"
cat /sys/class/thermal/thermal_zone*/temp
xinput list | head
lspci -nn | grep -i nvidia
```
(touchpad + temps + GPU visible = the acpi=off breakage is NOT happening — expected when a
surgical parameter works. The dmesg line is the FINGERPRINT confirming the ALIB diagnosis.)

## R7 — Old-kernel test (independent, can be done any time)

Boot the **Ubuntu 24.04.x** stick (same F12 flow, no parameters added), 3 boots.
This is the "Ubuntu used to work" regression test. Kernel there is ~6.8/6.11 vs the 6.17+
you've been freezing on.

## Reading your results (decision tree)

- **T2 passes** → freeze = ACPI thermal zone. Fix forever: add `thermal.off=1` permanently
  (when installing, it goes into `/etc/default/grub` as `GRUB_CMDLINE_LINUX_DEFAULT="... thermal.off=1"`).
  You lose nothing important: `k10temp` still shows CPU temps, fans run EC-controlled.
- **T3 passes** → freeze = ucsi_acpi (USB-C). Permanent: blacklist it, keep USB-C unused or
  test newer kernel.
- **T4/T5/T6 pass** → note which one; same permanent-parameter logic.
- **Nothing passes but R7 (old Ubuntu) passes 3×** → kernel regression between ~6.11 and now.
  Solution: run an older-kernel distro (Ubuntu 24.04, Debian 12 + backports kernel of choice)
  and/or we file a kernel bug with your captured data.
- **Nothing passes anywhere, including R7** → firmware-level. Then and only then consider the
  BIOS 1.10 downgrade (separate section in the investigation report; do NOT do it casually).

## Evidence capture (whenever a freeze happens)

1. **Photo the screen** before powering off (kernel lines visible if `quiet splash` absent —
   for Ubuntu's GRUB, the `linux` line usually has both; you can delete them when editing `e`).
2. If you ever boot a Linux that works: `sudo dmesg > dmesg.txt` and save it to the USB stick
   or another phone photo. Bring it back to the chat.

## Returning to the chat / a new session

Everything durable lives in `D:\Acer` (this runbook, the investigation report, BIOS analysis,
RESULTS.md). My assistant memory also holds the summary. New session: open it and say
**"continue the Acer AN515-45 investigation — read D:\Acer\RUNBOOK-Linux-Test.md and D:\Acer\RESULTS.md"**.

---

## RESULTS.md template (copy to D:\Acer\RESULTS.md and fill)

```
# Test results — AN515-45 freeze hunt
USB stick: ____   ISO used (T1-T6): ____   Ubuntu 24.04 ISO: ____

T1 red-handed (watch thermal_zone temps):  [ S at _m_s / P 10m ]  (repeat x3 if P)
T2 thermal.off=1:          boot1 [S/P]  boot2 [S/P]  boot3 [S/P]
T3 blacklist ucsi_acpi:    boot1 [S/P]  boot2 [S/P]  boot3 [S/P]   USB-C empty? Y/N
T4 blacklist acer_wmi:     boot1 [S/P]  boot2 [S/P]  boot3 [S/P]
T5 cpuidle.off=1:          boot1 [S/P]  boot2 [S/P]  boot3 [S/P]
T6a pci=noacpi:            boot1 [S/P]  boot2 [S/P]  boot3 [S/P]
T6b acpi=noirq:            boot1 [S/P]  boot2 [S/P]  boot3 [S/P]
T7 Ubuntu 24.04 (no params): boot1 [S/P] boot2 [S/P] boot3 [S/P]

Freeze notes (time of freeze, what was on screen, photo taken?):
-
-

Working-boot captures (temps/xinput/lspci outputs, dmesg.txt):
-
```

*S = froze (note time), P = passed 10 minutes.*
