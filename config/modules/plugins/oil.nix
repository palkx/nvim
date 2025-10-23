{
  plugins.oil.enable = true;

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
