return {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		if type(opts.ensure_installed) == "table" then
			vim.list_extend(opts.ensure_installed, {
				"java",
				"go",
				"gomod",
				"gowork",
				"gosum",
				"dockerfile",
				"terraform",
				"hcl",
				"json",
				"json5",
				"jsonc",
				"ninja",
				"python",
				"rst",
				"toml",
				"yaml",
			})
		end
	end,
}
