{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
    neovim = {
      url = "github:neovim/neovim";
      flake = false;
    };
  };

  outputs = inputs:
    inputs.flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = inputs.nixpkgs.legacyPackages.${system};
        neovim-unstable = pkgs.neovim-unwrapped.overrideAttrs {
          version = "0.12.0-dev";
          src = inputs.neovim;
        };
      in
      {
        packages.${system} = rec {
          neovim-bundle = pkgs.wrapNeovimUnstable neovim-unstable {
            luaRcContent = ''
              vim.opt.rtp:prepend("${./nvim}")
              dofile("${./nvim/init.lua}")
            '';
            vimAlias = true;
            viAlias = true;
          };
          neovim = pkgs.wrapNeovimUnstable neovim-unstable {
            wrapRc = false;
            vimAlias = true;
            viAlias = true;
          };
          default = neovim-bundle;
        };
      });
}
