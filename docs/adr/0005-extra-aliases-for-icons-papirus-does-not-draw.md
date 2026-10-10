# 0005. Extra aliases for icons Papirus does not draw

- Status: Accepted
- Date: 2026-10-10

## Context

Omarchy's own `imv.desktop` asks for an icon named `imv`. Papirus has no icon
by that name, so on Omarchy the Image Viewer showed imv's own icon from
`hicolor`, not a pixel one. Of the 22 apps in the Omarchy launcher on the
machine this was found on, 2 had this problem: `imv` and `LimineSnapperSync`.

Upstream Papirus adds such aliases on request, but slowly, and this fork does
not edit upstream files.

## Decision

`pixel/aliases.txt` lists icon names Papirus lacks, each with the Papirus icon
it should show. `pixel/papixel.py` links each one in every `apps` folder of
the built theme where the target exists. A name that Papirus later draws
itself is left alone.

## Consequences

Apps that use a non-standard icon name get a pixel icon, without any change
to upstream's folders.

The list is maintained by hand. A new app with an unknown icon name shows its
own icon until someone adds a line.
