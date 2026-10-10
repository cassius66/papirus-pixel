# 0001. The fork keeps upstream's license and layout

- Status: Accepted
- Date: 2026-10-10

## Context

This repo is a fork of
[PapirusDevelopmentTeam/papirus-icon-theme](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme),
which is GPL 3.0. Papirus-Pixel is drawn from Papirus's icons, so it is GPL
3.0 as well.

## Decision

The repo stays GPL 3.0 under upstream's `LICENSE`. No upstream file is
edited. Everything this fork adds lives in new
paths: `pixel/`, `docs/`, `.gitignore`, `.github/README.md` and
`.github/workflows/papirus-pixel.yml`.

## Consequences

`git merge upstream/master` cannot conflict while this holds.

Changing an upstream icon by hand is ruled out. A fix belongs upstream, or in
`pixel/papixel.py` as a rule applied to every icon.
