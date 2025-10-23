{ lib, pkgs, ... }:
{
  plugins.fzf-lua = {
    enable = true;
    # keymaps = {
    #   "<leader>sf" = {
    #     action = "files";
    #     options = {
    #       desc = "Fzf-Lua File Grep";
    #     };
    #   };
    #   "<leader>sg" = {
    #     action = "live_grep_native";
    #     options = {
    #       desc = "Fzf-Lua File Grep";
    #     };
    #   };
    #   "<leader>sv" = {
    #     action = "git_files";
    #     # settings = {
    #     #   previewers.cat.cmd = lib.getExe' pkgs.coreutils "cat";
    #     #   winopts.height = 0.5;
    #     # };
    #     options = {
    #       desc = "Fzf-Lua VCS Grep (Git)";
    #     };
    #   };
    # };
  };
}
