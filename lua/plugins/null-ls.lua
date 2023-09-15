return {
	"jose-elias-alvarez/null-ls.nvim",
	opts = function(_, opts)
		if type(opts.sources) == "table" then
			local null_ls = require("null-ls")
			vim.list_extend(opts.sources, {
				null_ls.builtins.diagnostics.hadolint,
				null_ls.builtins.formatting.prettierd,
				null_ls.builtins.formatting.terraform_fmt,
				null_ls.builtins.diagnostics.terraform_validate,
				null_ls.builtins.code_actions.gomodifytags,
				null_ls.builtins.code_actions.impl,
				null_ls.builtins.formatting.gofumpt,
				null_ls.builtins.formatting.goimports_reviser,
			})
		end
	end,
}
