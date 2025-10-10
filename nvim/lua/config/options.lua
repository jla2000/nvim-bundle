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
vim.opt.swapfile = false
vim.opt.confirm = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
vim.opt.foldtext = ""
vim.opt.foldlevel = 99
vim.opt.jumpoptions = "stack"
vim.opt.wildmenu = true
vim.opt.wildmode = "noselect:lastused,full"
vim.opt.grepprg = "rg --vimgrep --hidden -g '!.git/*'"

vim.diagnostic.config({
  virtual_text = {
    source = true,
    prefix = "󰄛 ",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = " ",
      [vim.diagnostic.severity.WARN] = " ",
      [vim.diagnostic.severity.INFO] = " ",
      [vim.diagnostic.severity.HINT] = " ",
    },
  },
  float = { source = true },
  jump = { float = true },
  severity_sort = true,
  update_in_insert = true,
})
