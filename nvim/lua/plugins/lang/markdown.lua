return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      vim.list_extend(opts.ensure_installed, {
        "marksman",
        -- TODO: remove when fixed
        -- See https://xaked.com/xaked/nvim/issues/11
        -- "mdformat",
      })
    end,
  },
  -- TODO: remove when fixed
  -- See https://xaked.com/xaked/nvim/issues/11
  -- {
  --   "nvimtools/none-ls.nvim",
  --   opts = function(_, opts)
  --     local nls = require("null-ls")
  --     opts.sources = opts.sources or {}
  --     vim.list_extend(opts.sources, {
  --       nls.builtins.formatting.mdformat,
  --     })
  --   end,
  -- },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "markdown",
          "markdown_inline",
        })
      end
    end,
  },
}
