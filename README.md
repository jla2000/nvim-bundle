<div align="center">

# `nvim-bundle`

**Very over-engineered neovim flake**

</div>

## Usage

```bash
nix run github:jla2000/nvim-bundle

```

## Installation

Include `nvim-bundle.packages.x86_64-linux.neovim` into nixos/home-manager config.

## Installation (HomeManager with symlinked lua config)

Example (configPath needs to be adapted):

```nix
imports = [ nvim-bundle.homeManagerModules.neovim ];
neovim.configPath = "/home/jlafferton/dev/nvim-bundle/nvim";
```

## Features

- All plugins are fetched from `nixpkgs`
- Build and execute via `nix`
- Entire config writtin in `lua`
- Lazy loading using `lz.n`
- Lua config can be changed without rebuilding package (when `.#homeManagerModules.neovim` is used)
