{
  description = "NVIM Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    flake-utils.url = "github:numtide/flake-utils";
    neovim = {
      url = "github:neovim/neovim/stable?dir=contrib";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    neovim,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      overlayFlakeInputs = prev: final: {
        neovim = neovim.packages.${system}.neovim;
      };

      overlayLazyVim = prev: final: {
        lazyVim = import ./packages/lazyVim.nix {
          pkgs = final;
        };
      };

      pkgs = import nixpkgs {
        inherit system;
        overlays = [overlayFlakeInputs overlayLazyVim];
      };
    in rec {
      packages.lazyVim = pkgs.lazyVim;
      apps.lazyVim = {
        type = "app";
        program = "${packages.default}/bin/nvim";
      };
      packages.default = packages.lazyVim;
      apps.default = apps.lazyVim;
    });
}
