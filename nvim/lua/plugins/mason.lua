return {
  opts = function(_, opts)
    table.insert(opts.ensure_installed, {
      "marksman",
      "mdformat",
    })
  end,
}
