{
  imports = [
    ./options.nix

    ./modules/colorschemes/catppuccin.nix

    ./modules/plugins/lsp

    ./modules/plugins/airline.nix
    ./modules/plugins/blink-cmp.nix
    ./modules/plugins/bufferline.nix
    ./modules/plugins/conform-nvim.nix
    ./modules/plugins/fzf-lua.nix
    ./modules/plugins/gitsigns.nix
    ./modules/plugins/mini.nix
    # ./modules/plugins/neotree.nix
    ./modules/plugins/oil.nix
    ./modules/plugins/snacks.nix
    ./modules/plugins/tmux-navigator.nix
    ./modules/plugins/treesitter.nix
    ./modules/plugins/undotree.nix
    ./modules/plugins/venv-selector.nix
    ./modules/plugins/which-key.nix
  ];

  performance.byteCompileLua.enable = true;
  performance.byteCompileLua.configs = true;
  performance.byteCompileLua.initLua = true;
  performance.byteCompileLua.luaLib = true;
  performance.byteCompileLua.nvimRuntime = true;
  performance.byteCompileLua.plugins = true;
}
