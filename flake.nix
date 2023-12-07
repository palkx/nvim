{
  description = "NVIM Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    flake-utils.url = "github:numtide/flake-utils";
  };
  outputs = inputs @ {
    self,
    nixpkgs,
    flake-utils,
    ...
  }:
    flake-utils.lib.eachDefaultSystem (system: let
      pkgs = import nixpkgs {
        inherit system;
      };

      recursiveMerge = attrList: let
        f = attrPath:
          builtins.zipAttrsWith (n: values:
            if pkgs.lib.tail values == []
            then pkgs.lib.head values
            else if pkgs.lib.all pkgs.lib.isList values
            then pkgs.lib.unique (pkgs.lib.concatLists values)
            else if pkgs.lib.all pkgs.lib.isAttrs values
            then f (attrPath ++ [n]) values
            else pkgs.lib.last values);
      in
        f [] attrList;
    in rec {
      dependencies = with pkgs; [
        ripgrep
        fd
        git
        curl # needed to fetch titles from urls
        lazygit
        wget
        cargo
        python310
        python310Packages.pip
        php82
        php82Packages.composer
        go
        ruby
        luarocks
        nodejs
        zulu #java11
        fish
        fzf
        perl536
        perl536Packages.CPAN
      ];
      neovim-augmented = recursiveMerge [
        pkgs.neovim-unwrapped
        {buildInputs = dependencies;}
      ];
      packages.pwnvim = pkgs.wrapNeovim neovim-augmented {
        viAlias = true;
        vimAlias = true;
        withNodeJs = false;
        withPython3 = false;
        withRuby = false;
        extraPython3Packages = false;
        extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath dependencies}" --set XDG_CONFIG_HOME "${self}"'';
      };
      apps.pwnvim = flake-utils.lib.mkApp {
        drv = self.packages.${system}.pwnvim;
        name = "pwnvim";
        exePath = "/bin/nvim";
      };
      packages.default = packages.pwnvim;
      apps.default = apps.pwnvim;
      devShell = pkgs.mkShell {
        buildInputs = with pkgs; [packages.pwnvim] ++ dependencies;
      };
    });
}
