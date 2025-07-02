vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.shiftwidth = 2
vim.opt.tabstop = 4
vim.opt.expandtab = true
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.laststatus = 3
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.diagnostic.config({
  virtual_text = { current_line = true },
  update_in_insert = true,
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
})
