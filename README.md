<div align="center">

# `nvim-bundle`

**Very over-engineered neovim flake**

</div>

```bash
nix run github:jla2000/nvim-bundle

```

## Features

- All plugins are fetched from `nixpkgs`
- Build and execute via `nix`
- Entire config writtin in `lua`
- Lazy loading using `lz.n`
- Lua config can be changed without rebuilding package (when `.#homeManagerModules.neovim` is used)
