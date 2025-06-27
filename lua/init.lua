vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8

vim.diagnostic.config({
  jump = { float = true },
})

vim.keymap.set("n", "<esc>", "<cmd>nohl<cr><esc>")
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>")
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>bp<cr>")

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
    if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})

require("lz.n").load({
  {
    "oil.nvim",
    cmd = "Oil",
    after = function()
      require("oil").setup()
    end,
    keys = {
      { "-", "<cmd>Oil<cr>", desc = "Open oil" },
    },
  },
  {
    "flash.nvim",
    after = function()
      require("flash").setup({
        modes = {
          char = {
            enabled = false,
          },
        },
      })
    end,
    keys = {
      {
        "s",
        function()
          require("flash").jump()
        end,
      },
    },
  },
  {
    "vim-tmux-navigator",
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  { "catppuccin-nvim", colorscheme = "catppuccin" },
})

vim.cmd([[ colorscheme catppuccin ]])
