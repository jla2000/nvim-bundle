{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim = {
      url = "github:neovim/neovim";
      flake = false;
    };
    nix-appimage = {
      url = "github:ralismark/nix-appimage";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = import inputs.nixpkgs {
        inherit system;
      };
      neovim-dev = pkgs.neovim-unwrapped.overrideAttrs {
        version = "0.12.0-dev";
        src = inputs.neovim;
      };
    in
    {
      packages.${system} = rec {
        neovim-bundle = pkgs.wrapNeovimUnstable neovim-dev {
          luaRcContent = ''
            vim.opt.rtp:prepend("${./nvim}")
            dofile("${./nvim/init.lua}")
          '';
        };
        neovim = neovim-dev;
        neovim-appimage = inputs.nix-appimage.lib.${system}.mkAppImage {
          program = "${neovim-bundle}/bin/nvim";
        };
      };

      homeManagerModules.neovim = { config, lib, ... }: {
        options.neovim.configPath = lib.mkOption {
          type = lib.types.path;
          description = "Path to the neovim lua config";
        };

        config = {
          home.packages = [ neovim-dev ];
          xdg.configFile."nvim".source = config.lib.file.mkOutOfStoreSymlink config.neovim.configPath;
        };
      };
    };
}
