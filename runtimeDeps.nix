{pkgs}: {
  dependencies = with pkgs; [
    nixd # nix lsp
    alejandra # nix formatter
    statix # linter for nix
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
    zulu #java11
    fish
    fzf
    perl536
    perl536Packages.CPAN
    unzip
    tree-sitter
    gcc
    gnumake
    lazygit
  ];
}
