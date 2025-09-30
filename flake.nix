{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim = {
      url = "github:neovim/neovim";
      flake = false;
    };
    fff = {
      url = "github:dmtrKovalenko/fff.nvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-appimage = {
      url = "github:ralismark/nix-appimage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, fff, nix-appimage, neovim, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      fff-nvim = fff.packages.${system}.fff-nvim;
      neovim-unwrapped = pkgs.neovim-unwrapped.overrideAttrs {
        version = "0.12.0-dev";
        src = neovim;
      };
      neovim-wrapped = pkgs.wrapNeovimUnstable neovim-unwrapped {
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
          { plugin = everforest; optional = true; }
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
          { plugin = tokyonight-nvim; optional = true; }
          { plugin = vim-tmux-navigator; optional = true; }
          { plugin = which-key-nvim; optional = true; }
        ];
      };
    in
    {
      packages.${system} = rec {
        neovim = neovim-wrapped.override {
          luaRcContent = ''
            vim.opt.rtp:prepend("${./nvim}")
            dofile("${./nvim/init.lua}")
          '';
        };
        neovim-appimage = nix-appimage.lib.${system}.mkAppImage {
          program = "${neovim}/bin/nvim";
        };
        default = neovim;
      };

      homeManagerModules.neovim = { config, lib, ... }: {
        options.neovim.configPath = lib.mkOption {
          type = lib.types.path;
          description = "Path to the neovim lua config";
        };

        config = {
          home.packages = [ (neovim-wrapped.override { wrapRc = false; }) ];
          xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink config.neovim.configPath;
        };
      };
    };
}
