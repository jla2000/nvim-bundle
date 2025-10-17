<div align="center">

# `nvim-bundle`

**Personal neovim flake**

![build](https://github.com/jla2000/nvim-bundle/actions/workflows/ci.yml/badge.svg)

</div>

## Try without installation

```bash
nix run --extra-experimental-features "nix-command flakes" github:jla2000/nvim-bundle
```

[Nix](https://nixos.org/) is used to build this project.

## Installation

Include `nvim-bundle.packages.x86_64-linux.neovim-bundle` into nixos/home-manager config.

## Installation (Dev-mode with symlinked lua config)

Include `nvim-bundle.packages.x86_64-linux.neovim` into nixos/home-manager config.

Symlink config:

```bash
ln -s $(realpath ./nvim) ~/.config/nvim
```

## Features

- All plugins are fetched from `nixpkgs`
- Build and execute via `nix`
- Entire config writtin in `lua`
- Lazy loaded plugins using [lz.n](https://github.com/nvim-neorocks/lz.n)
- Lua config can be changed on-the-fly without rebuilding (using symlinked lua config)
- Bundle complete config as `AppImage`

## Similar projects

- [nixCats-nvim](https://github.com/BirdeeHub/nixCats-nvim)
