{
  description = "Standalone bundled neovim";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
      };
    in
    {
      packages.${system}.default = pkgs.wrapNeovimUnstable pkgs.neovim-unwrapped {
        neovimRcContent = "source ${./lua/init.lua}";
        plugins = with pkgs.vimPlugins; [
          lz-n
          oil-nvim
          catppuccin-nvim
        ];
      };
    };
}
