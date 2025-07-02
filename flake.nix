{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    live-rename-nvim = { url = "github:saecki/live-rename.nvim"; flake = false; };
    plantuml-nvim = { url = "github:goropikari/plantuml.nvim"; flake = false; };
    libdeflate-nvim = { url = "github:goropikari/libdeflate.nvim"; flake = false; };
  };

  outputs = { nixpkgs, ... }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
      buildPlugin = name: input: deps:
        pkgs.vimUtils.buildVimPlugin {
          inherit name;
          pname = name;
          src = input;
          dependencies = deps;
        };
      live-rename-nvim = buildPlugin "live-rename.nvim" inputs.live-rename-nvim [ ];
      libdeflate-nvim = buildPlugin "LibDeflate.nvim" inputs.libdeflate-nvim [ ];
      plantuml-nvim = buildPlugin "plantuml.nvim" inputs.plantuml-nvim [ libdeflate-nvim ];
    in
    {
      packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        neovimRcContent = ''
          set rtp^=${./nvim}
          luafile ${./nvim/init.lua}
        '';
        plugins = with pkgs.vimPlugins; [
          lz-n
          libdeflate-nvim
          nvim-treesitter.withAllGrammars
          { plugin = blink-cmp; optional = true; }
          { plugin = catppuccin-nvim; optional = true; }
          { plugin = conform-nvim; optional = true; }
          { plugin = crates-nvim; optional = true; }
          { plugin = diffview-nvim; optional = true; }
          { plugin = flash-nvim; optional = true; }
          { plugin = fzf-lua; optional = true; }
          { plugin = gitsigns-nvim; optional = true; }
          { plugin = lazydev-nvim; optional = true; }
          { plugin = live-rename-nvim; optional = true; }
          { plugin = nvim-autopairs; optional = true; }
          { plugin = nvim-lint; optional = true; }
          { plugin = nvim-lspconfig; optional = true; }
          { plugin = nvim-surround; optional = true; }
          { plugin = nvim-treesitter-context; optional = true; }
          { plugin = nvim-treesitter-textobjects; optional = true; }
          { plugin = oil-nvim; optional = true; }
          { plugin = persistence-nvim; optional = true; }
          { plugin = plantuml-nvim; optional = true; }
          { plugin = snacks-nvim; optional = true; }
          { plugin = vim-tmux-navigator; optional = true; }
        ];
      };
    };
}
