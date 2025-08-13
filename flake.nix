{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    fff = {
      url = "github:dmtrKovalenko/fff.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, fff, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      symbol-usage-nvim = pkgs.vimUtils.buildVimPlugin {
        pname = "symbol-usage.nvim";
        version = "2025-05-03";
        src = pkgs.fetchFromGitHub {
          owner = "Wansmer";
          repo = "symbol-usage.nvim";
          rev = "e07c07dfe7504295a369281e95a24e1afa14b243";
          sha256 = "0539ahy72wh8rdkn2pybsdk58ki0jdn9dk2ap7q65986crjglr6d";
        };
      };
      fff-nvim = fff.packages.${system}.fff-nvim;
    in
    {
      packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        luaRcContent = ''
          vim.opt.rtp:prepend("${./nvim}")
          dofile("${./nvim/init.lua}")
        '';
        viAlias = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          LibDeflate-nvim
          lz-n
          nvim-treesitter.withAllGrammars
          { plugin = blink-cmp; optional = true; }
          { plugin = catppuccin-nvim; optional = true; }
          { plugin = conform-nvim; optional = true; }
          { plugin = crates-nvim; optional = true; }
          { plugin = diffview-nvim; optional = true; }
          { plugin = fff-nvim; optional = true; }
          { plugin = fidget-nvim; optional = true; }
          { plugin = flash-nvim; optional = true; }
          { plugin = fzf-lua; optional = true; }
          { plugin = gitsigns-nvim; optional = true; }
          { plugin = lazydev-nvim; optional = true; }
          { plugin = live-rename-nvim; optional = true; }
          { plugin = nerdy-nvim; optional = true; }
          { plugin = nvim-autopairs; optional = true; }
          { plugin = nvim-lint; optional = true; }
          { plugin = nvim-lspconfig; optional = true; }
          { plugin = nvim-surround; optional = true; }
          { plugin = nvim-treesitter-context; optional = true; }
          { plugin = nvim-treesitter-textobjects; optional = true; }
          { plugin = oil-nvim; optional = true; }
          { plugin = persistence-nvim; optional = true; }
          { plugin = plantuml-nvim; optional = true; }
          { plugin = render-markdown-nvim; optional = true; }
          { plugin = snacks-nvim; optional = true; }
          { plugin = symbol-usage-nvim; optional = true; }
          { plugin = vim-tmux-navigator; optional = true; }
          { plugin = which-key-nvim; optional = true; }
        ];
      };
    };
}
