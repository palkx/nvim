{ lib, ... }:
{
  plugins.venv-selector = {
    enable = true;

    settings = {
      dap_enabled = true;
      name = [
        "venv"
        ".venv"
      ];
      pyenv_path = lib.nixvim.mkRaw "vim.fn.expand('$HOME/.pyenv/versions')";
    };
  };

  keymaps = [
    {
      mode = "n";
      key = "<leader>cv";
      action = "<cmd>VenvSelect<CR>";
      options = {
        desc = "Select Python virtual env";
      };
    }
  ];
}
