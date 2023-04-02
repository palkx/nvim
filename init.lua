-- Neovide needs this defined very early
if vim.fn.has('mac') == 1 then
  vim.opt.guifont = "Hasklug Nerd Font:h18"
else
  vim.opt.guifont = "Hasklug Nerd Font:h9"
end
require('impatient')
require('impatient').enable_profile()
require('nvim.filetypes').config()
require('nvim.options').defaults()
require('nvim.options').gui()
require('nvim.mappings')
require('nvim.abbreviations')
require('nvim.plugins').ui()
require('nvim.plugins').diagnostics()
require('nvim.plugins').telescope()
require('nvim.plugins').completions()
require('nvim.plugins').notes()
require('nvim.plugins').misc()
