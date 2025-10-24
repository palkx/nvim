{
  plugins.oil = {
    enable = true;
    settings = {
      win_options = {
        signcolumn = "yes:2";
      };
    };
  };

  plugins.oil-git-status = {
    enable = true;
    settings = {
      show_ignored = true;
    };
  };

  keymaps = [
    {
      mode = "n";
      action = "<cmd>Oil<CR>";
      key = "<leader>o";
      options = {
        desc = "Open [O]il";
      };
    }
  ];
}
