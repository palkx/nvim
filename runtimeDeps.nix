{ pkgs }:
{
  dependencies =
    with pkgs;
    [
      nixfmt-rfc-style # nix formatter
      (terraform.overrideAttrs (oldAttrs: {
        meta.license = lib.licenses.mpl20;
      })) # terraform fmt
      ripgrep
      fd
      git
      curl # needed to fetch titles from urls
      wget
      cargo
      php82
      php82Packages.composer
      go
      ruby
      luarocks
      zulu # java11
      fish
      fzf
      perl536
      perl536Packages.CPAN
      unzip
      tree-sitter
      gnumake
      lazygit
      python312
      python312Packages.pip
    ]
    ++ (if pkgs.stdenv.hostPlatform.isDarwin then [ ] else [ gcc ]);
}
