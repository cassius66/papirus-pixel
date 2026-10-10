# papirus-pixel

Papirus icons redrawn as 24 by 24 pixel art in a 16 colour palette.

## Why

Pixel art icons for a Linux desktop, without drawing 20,989 icons by hand.
`pixel/papixel.py` renders each Papirus icon, snaps it to a grid, moves every
pixel to the nearest colour of the
[Sweetie 16](https://lospec.com/palette-list/sweetie-16) palette, and adds a
1 pixel outline. It is a fork of
[Papirus](https://github.com/PapirusDevelopmentTeam/papirus-icon-theme) so
that new upstream icons arrive with a merge.

## Setup

Papirus-Pixel inherits from Papirus-Dark, so install Papirus first. On Arch:

```bash
sudo pacman -S papirus-icon-theme
```

Then install Papirus-Pixel for your user, from the latest release:

```bash
curl -fsSL https://raw.githubusercontent.com/cassius66/papirus-pixel/master/pixel/install.sh | bash
gsettings set org.gnome.desktop.interface icon-theme Papirus-Pixel
```

On Omarchy, the [Wizard theme](https://github.com/cassius66/omarchy-wizard-theme)
selects it for you. Remove it with `bash pixel/install.sh --uninstall`.

## Usage

To build it yourself you need Python 3.8 or newer and `rsvg-convert`
(`sudo pacman -S librsvg`):

```bash
git clone https://github.com/cassius66/papirus-pixel
cd papirus-pixel
python3 pixel/papixel.py
make install PREFIX=$HOME/.local ICON_THEMES=Papirus-Pixel
```

A build takes about 3.5 minutes on 8 cores. Other palettes:

```bash
python3 pixel/papixel.py --list-palettes
python3 pixel/papixel.py -p nord -n Papirus-Pixel-Nord
python3 pixel/papixel.py -p ~/.local/state/omarchy/current/theme/colors.toml -n Papirus-Pixel-Mine
```

`--palette` takes a built in name, a comma list of hex colours, or any file
holding hex colours.

## Structure

| Path | Holds |
|---|---|
| `pixel/papixel.py` | The converter. Reads `Papirus-Dark`, writes `Papirus-Pixel`. |
| `pixel/aliases.txt` | App icon names Papirus lacks, and the Papirus icon each one shows. |
| `pixel/install.sh` | Installs the latest release into `~/.local/share/icons`. |
| `.github/workflows/papirus-pixel.yml` | Builds and releases on push to `master`. |
| `docs/adr/` | Decision records for this fork. |
| `Papirus/`, `Papirus-Dark/`, `Papirus-Light/` | Upstream Papirus, unedited. |

Only `pixel/`, `docs/`, `.github/README.md` and the workflow are this fork's.
Everything else is upstream's.

## Not Done

- Symbolic, panel and animation icons are not redrawn. They come from
  Papirus-Dark.
- Icons under 24 pixels are redrawn on their own grid without an outline, so
  they differ from the larger sizes.
- Fine detail is lost at 24 by 24. Signal and OBS suffer most.
- Not packaged for the AUR.
- Install Papirus-Pixel alone in `~/.local/share/icons`. Launchers that take
  the first icon file they find, such as Omarchy's, pick between themes there
  at random.

## Decisions

See [docs/adr/](../docs/adr/README.md).

- [0001. The fork keeps upstream's license and layout](../docs/adr/0001-the-fork-keeps-upstream-license-and-layout.md)
- [0002. The README lives in .github/README.md](../docs/adr/0002-the-readme-lives-in-github-readme.md)
- [0003. The built theme is released, not committed](../docs/adr/0003-the-built-theme-is-released-not-committed.md)
- [0004. Icons use the Sweetie 16 palette](../docs/adr/0004-icons-use-sweetie-16.md)
- [0005. Extra aliases for icons Papirus does not draw](../docs/adr/0005-extra-aliases-for-icons-papirus-does-not-draw.md)

## License

GPL 3.0, as upstream Papirus. See [LICENSE](../LICENSE). Sweetie 16 is by
GrafxKid.
