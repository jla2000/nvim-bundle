{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        neovimRcContent = "luafile ${./lua/init.lua}";
        plugins = with pkgs.vimPlugins; [
          lz-n
          { plugin = blink-cmp; optional = true; }
          { plugin = catppuccin-nvim; optional = true; }
          { plugin = flash-nvim; optional = true; }
          { plugin = lazydev-nvim; optional = true; }
          { plugin = nvim-lspconfig; optional = true; }
          { plugin = nvim-treesitter.withAllGrammars; optional = true; }
          { plugin = oil-nvim; optional = true; }
          { plugin = snacks-nvim; optional = true; }
          { plugin = vim-tmux-navigator; optional = true; }
          { plugin = snacks-nvim; optional = true; }
        ];
      };
    };
}
