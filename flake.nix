{
  description = "NVIM Configuration";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";
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
      dependencies = with pkgs;
        [
          ripgrep
          zsh # terminal requires it
          git
          curl # needed to fetch titles from urls
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
        extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath dependencies}"'';
        # make sure impatient is loaded before everything else to speed things up
        configure = {
          customRC =
            ''
              lua << EOF
                package.path = "${self}/?.lua;" .. package.path
            ''
            + pkgs.lib.readFile ./init.lua
            + ''
              EOF
            '';
          packages.myPlugins = with pkgs.vimPlugins; {
            start = with pkgs.vimPlugins; [
                # Common dependencies of other plugins
                popup-nvim # dependency of some other plugins
            ];
            opt = with pkgs.vimPlugins; [
              # grammar check
              vim-grammarous
            ];
          };
        };
      };
      apps.pwnvim = flake-utils.lib.mkApp {
        drv = packages.pwnvim;
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
