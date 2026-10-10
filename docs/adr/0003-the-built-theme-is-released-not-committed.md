# 0003. The built theme is released, not committed

- Status: Accepted
- Date: 2026-10-10

## Context

`pixel/papixel.py` writes 52,046 icon files, drawn from 20,989 unique
drawings, plus 48,537 aliases. Committing them would change thousands of
files on each palette tweak and on each upstream merge.

## Decision

`Papirus-Pixel/` is gitignored. A workflow,
`.github/workflows/papirus-pixel.yml`, builds it on every push to `master`
that changes Papirus or the script, and attaches `Papirus-Pixel.tar.gz` to a
release tagged `pixel-YYYYMMDD` from the commit date. The archive lists the
largest sizes first, because launchers that keep the first icon file they
find, such as Omarchy's, would otherwise show some 16 px drawings.
`pixel/install.sh` installs the latest release.

## Consequences

The git history holds only the script, not its output.

A user without the release has to build it, which needs `rsvg-convert` and
takes minutes.

Pushing to `master` costs one Actions run.
