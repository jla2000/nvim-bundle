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
vim.opt.findfunc = "v:lua.RgFindFiles"

function RgFindFiles(cmdarg, _)
  local files = vim.fn.systemlist("rg --files --hidden --color=never --glob='!.git'")
  if #cmdarg == 0 then
    return vim.list_slice(files, 1, 10)
  else
    return vim.fn.matchfuzzy(files, cmdarg, { limit = 10 })
  end
end

-- vim.opt.guicursor = "i:block-lualine_a_insert,n:block-lualine_a_normal,v:block-lualine_a_visual"
vim.fn.matchadd("ErrorMsg", "\\<SAFETY\\ze:")

vim.diagnostic.config({
  virtual_text = {
    source = true,
    prefix = "󰄛 ",
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "",
      [vim.diagnostic.severity.WARN] = "",
      [vim.diagnostic.severity.INFO] = "",
      [vim.diagnostic.severity.HINT] = "",
    },
  },
  float = { source = true },
  jump = { float = true },
  severity_sort = true,
  update_in_insert = true,
})
