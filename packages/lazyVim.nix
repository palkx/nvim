{ pkgs }:
let
  config = import ../config { inherit pkgs; };
  runtimeDeps = import ../runtimeDeps.nix { inherit pkgs; };
in
pkgs.wrapNeovim pkgs.neovim {
  viAlias = true;
  vimAlias = true;
  withNodeJs = true;
  withPython3 = true;
  withRuby = false;
  extraMakeWrapperArgs = ''--prefix PATH : "${pkgs.lib.makeBinPath runtimeDeps.dependencies}" --set XDG_CONFIG_HOME "${config}"'';
}
