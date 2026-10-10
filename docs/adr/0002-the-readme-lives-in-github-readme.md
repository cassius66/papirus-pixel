# 0002. The README lives in .github/README.md

- Status: Accepted
- Date: 2026-10-10

## Context

The root `README.md` is upstream's and documents Papirus. Upstream edited it 3
times in the 12 months to October 2026. GitHub shows a README from `.github/`
before one in the root.

## Decision

This fork's README is `.github/README.md`. The root `README.md` stays
upstream's, unedited.

## Consequences

The repo page shows Papirus-Pixel's README, and merging upstream never
touches it.

Someone reading a local checkout sees upstream's README first. The
`.github/README.md` path is named in `pixel/papixel.py --help`.
