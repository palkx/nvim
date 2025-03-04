return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    config = function()
      require("telescope").load_extension("fzf")
    end,
  },
  opts = {
    defaults = {
      file_ignore_patterns = {
        ".git/",
        "^node_modules/",
        ".cache",
      },
    },
    pickers = {
      live_grep = {
        additional_args = { "-L" },
      },
      grep_string = {
        additional_args = { "-L" },
      },
      find_files = {
        hidden = true,
        follow = true,
      },
    },
  },
}
