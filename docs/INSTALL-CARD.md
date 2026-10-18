# AN515-45 — Debian Install Card (final)

Stick: Debian 13.6 DVD, preseeded, thermal mitigation + crash logging baked in.
Target: E: (WD SN530) only. Windows + data drives untouchable by design.

## Before you boot (2 minutes, once)

1. Power on, tap **F2** (BIOS):
   - Secure Boot → **Disabled**
   - Fast Boot → **Disabled**
   - (F10 save + exit. NOTE: this model silently re-enables Fast Boot after
     some shutdowns — if the stick doesn't appear in the boot menu later,
     re-check F2 → Fast Boot first.)
2. USB stick plugged in (the DEBIAN-labeled one).

## The install (~15–30 min, zero interaction)

3. Power on, tap **F12**.
4. Pick the USB entry that says **UEFI** (not "USB HDD" legacy).
5. At the Debian menu pick **Install** (text mode).
6. Walk away. It asks nothing. Everything is pre-decided:
   - Installs to the WD SN530 (E:) ONLY — Windows/data drives never referenced
   - Bootloader on E: — Windows stays the default power-on OS
   - `thermal.off=1` mitigation active during install and permanently after
   - Crash logger streams every kernel line to the stick (2s heartbeat)

### If something unusual happens
- A screen that looks like a QUESTION → stop, don't press anything,
  note what it says, tell me.
- The machine dies suddenly → nothing to do, no notes needed.
  The stick already recorded everything up to the moment it died.

## After it finishes

7. "Installation complete" screen → pull the stick out → the machine reboots.
8. It boots **Windows** as always. To use Linux: **F12 → debian**.
9. First login: **user** / **nitro5** → open a terminal, run `passwd`,
   pick a real password. (Timezone defaulted to UTC — one click to change.)

## The check (any time, one action)

Plug the stick back into this Windows machine and tell ZCode:
**"read the stick"**
Everything — install log, kernel stream, mitigation YES/NO lines,
thermal/power history, crash records — is on it and I do the reading.
