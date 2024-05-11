-- Configure symlinks needed by LazyVim
vim.fn.system({ "mkdir", "-p", os.getenv("HOME") .. "/.config/lazyvim/nvim" })
vim.fn.system({ "mkdir", "-p", os.getenv("HOME") .. "/.config/lazyvim/lazygit" })
vim.fn.system({ "ln", "-sfT", os.getenv("HOME") .. "/.config/lazyvim/nvim", "/tmp/lazyvim-nvim" })
vim.fn.system({ "ln", "-sfT", os.getenv("HOME") .. "/.config/lazyvim/lazygit", "/tmp/lazyvim-lazygit" })

-- Load lazyvim
require("config.lazy")
