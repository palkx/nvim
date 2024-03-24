return {
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        ["nix"] = { "alejandra" },
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        nixd = {},
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      if type(opts.ensure_installed) == "table" then
        vim.list_extend(opts.ensure_installed, {
          "nix",
        })
      end
    end,
  },
  {
    "nvimtools/none-ls.nvim",
    optional = true,
    opts = function(_, opts)
      local null_ls = require("null-ls")
      opts.sources = vim.list_extend(opts.sources or {}, {
        null_ls.builtins.code_actions.statix,
        null_ls.builtins.diagnostics.statix,
        null_ls.builtins.formatting.alejandra,
      })
    end,
  },
}
