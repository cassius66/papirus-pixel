# 0004. Icons use the Sweetie 16 palette

- Status: Accepted
- Date: 2026-10-10

## Context

`pixel/papixel.py` moves every pixel to its nearest palette colour. With a
desktop theme's palette, every icon took on that theme's hues: under a
grey-and-green palette, blue folders turned grey and orange VLC turned red.
The Omarchy theme the icons were made for wanted icons that look like pixel
art, not icons tinted to the theme.

Sweetie 16 and PICO-8 were compared on 32 icons. Both have 16 colours. Sweetie
16 kept each icon's hue; PICO-8 turned Discord and Steam grey.

## Decision

The default palette is Sweetie 16, by GrafxKid. The release ships one theme,
`Papirus-Pixel`, in that palette. Other palettes stay available through
`--palette`.

## Consequences

One icon theme works under any desktop theme.

Icons do not match a desktop theme's colours. Anyone who wants that builds a
variant with `--palette` and a theme's colour file.
