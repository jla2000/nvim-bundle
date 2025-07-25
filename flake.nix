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
        luaRcContent = ''
          vim.opt.rtp:prepend("${./nvim}")
          dofile("${./nvim/init.lua}")
        '';
        viAlias = true;
        vimAlias = true;
        plugins = with pkgs.vimPlugins; [
          LibDeflate-nvim
          lz-n
          nvim-dap
          nvim-treesitter.withAllGrammars
          { plugin = blink-cmp; optional = true; }
          { plugin = catppuccin-nvim; optional = true; }
          { plugin = conform-nvim; optional = true; }
          { plugin = crates-nvim; optional = true; }
          { plugin = diffview-nvim; optional = true; }
          { plugin = fidget-nvim; optional = true; }
          { plugin = flash-nvim; optional = true; }
          { plugin = fzf-lua; optional = true; }
          { plugin = gitsigns-nvim; optional = true; }
          { plugin = lazydev-nvim; optional = true; }
          { plugin = live-rename-nvim; optional = true; }
          { plugin = lualine-nvim; optional = true; }
          { plugin = nvim-autopairs; optional = true; }
          { plugin = nvim-dap-ui; optional = true; }
          { plugin = nvim-lint; optional = true; }
          { plugin = nvim-lspconfig; optional = true; }
          { plugin = nvim-surround; optional = true; }
          { plugin = nvim-treesitter-context; optional = true; }
          { plugin = nvim-treesitter-textobjects; optional = true; }
          { plugin = oil-nvim; optional = true; }
          { plugin = persistence-nvim; optional = true; }
          { plugin = plantuml-nvim; optional = true; }
          { plugin = render-markdown-nvim; optional = true; }
          { plugin = rustaceanvim; optional = true; }
          { plugin = snacks-nvim; optional = true; }
          { plugin = vim-tmux-navigator; optional = true; }
        ];
      };
    };
}
