{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
    neovim = {
      url = "github:neovim/neovim";
      flake = false;
    };
  };

  outputs = inputs:
    let
      system = "x86_64-linux";
      pkgs = inputs.nixpkgs.legacyPackages.${system};
      neovim-unstable = pkgs.neovim-unwrapped.overrideAttrs {
        version = "0.12.0-dev";
        src = inputs.neovim;
      };
    in
    {
      packages.${system} = {
        neovim-bundle = pkgs.wrapNeovimUnstable neovim-unstable {
          luaRcContent = ''
            vim.opt.rtp:prepend("${./nvim}")
            dofile("${./nvim/init.lua}")
          '';
        };
        neovim = neovim-unstable;
      };
    };
}
