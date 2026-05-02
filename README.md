# Scarlett2 Firmware

This repository contains the firmware, tested and working well with
Linux, for these Focusrite interfaces:

- Scarlett 2nd Gen 6i6, 18i8, and 18i20
- Scarlett 3rd Gen Solo, 2i2, 4i4, 8i6, 18i8, and 18i20
- Scarlett 4th Gen Solo, 2i2, and 4i4
- Clarett 2Pre, 4Pre, and 8Pre USB
- Clarett+ 2Pre, 4Pre, and 8Pre
- Vocaster One and Two

These files are used by:

- the [ALSA Scarlett Control
  Panel](https://github.com/geoffreybennett/alsa-scarlett-gui/)
  (`alsa-scarlett-gui`), or

- the [`scarlett2` CLI
  utility](https://github.com/geoffreybennett/scarlett2) — for
  command-line firmware management.

Install these files using the [RPM/deb
package](https://github.com/geoffreybennett/scarlett2-firmware/releases),
or just create a directory `/usr/lib/firmware/scarlett2` and copy the
contents of the `firmware` directory there.

```
mkdir -p /usr/lib/firmware/scarlett2
git clone https://github.com/geoffreybennett/scarlett2-firmware.git
cp scarlett2-firmware/firmware/* /usr/lib/firmware/scarlett2
```

