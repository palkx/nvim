{
  description = "NVIM Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.11";
    flake-utils.url = "github:numtide/flake-utils";
    neovim-nightly-overlay = {
      url = "github:nix-community/neovim-nightly-overlay";
      # inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  nixConfig = {
    trusted-substituters = [
      "https://nix-community.cachix.org"
      "https://palkx.cachix.org"
    ];
    extra-trusted-public-keys = [
      "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
      "palkx.cachix.org-1:qaQoL5CXpGzUbqsIvxUEL7wUhoIrjV0Q8M4HbJ8/8S4="
    ];
  };

  outputs =
    inputs@{
      nixpkgs,
      flake-utils,
      neovim-nightly-overlay,
      ...
    }:
    flake-utils.lib.eachDefaultSystem (
      system:
      let
        overlayFlakeInputs = prev: final: {
          neovim = neovim-nightly-overlay.packages.${system}.default.overrideAttrs (oa: {
            nativeBuildInputs = oa.nativeBuildInputs ++ [ final.libtermkey ];
          });
        };

        overlayLazyVim = prev: final: { lazyVim = import ./packages/lazyVim.nix { pkgs = final; }; };

        pkgs = import nixpkgs {
          inherit system;
          overlays = [
            overlayFlakeInputs
            overlayLazyVim
          ];
        };
      in
      rec {
        packages.lazyVim = pkgs.lazyVim;
        apps.lazyVim = {
          type = "app";
          program = "${packages.default}/bin/nvim";
        };
        packages.default = packages.lazyVim;
        apps.default = apps.lazyVim;
      }
    );
}
