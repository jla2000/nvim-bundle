<div align="center">

# `nvim-bundle`

**Very over-engineered neovim config**

</div>

## Usage

```bash
nix run github:jla2000/nvim-bundle
```

[Nix](https://nixos.org/) is used to build this project.

## Installation

Include `nvim-bundle.packages.x86_64-linux.neovim` into nixos/home-manager config.

## Installation (Dev-mode with symlinked lua config)

Example (configPath needs to be adapted) that can be included into [home-manager](https://github.com/nix-community/home-manager) config.

```nix
imports = [ nvim-bundle.homeManagerModules.neovim ];
neovim.configPath = "/home/jlafferton/dev/nvim-bundle/nvim";
```

## Features

- All plugins are fetched from `nixpkgs`
- Build and execute via `nix`
- Entire config writtin in `lua`
- Lazy loaded plugins using [lz.n](https://github.com/nvim-neorocks/lz.n)
- Lua config can be changed on-the-fly without rebuilding (using symlinked lua config)
