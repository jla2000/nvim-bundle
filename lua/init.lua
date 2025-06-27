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

vim.lsp.enable("lua_ls")
vim.lsp.enable("rust_analyzer")
vim.lsp.enable("nixd")

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
  {
    "lazydev.nvim",
    ft = "lua",
    after = function()
      require("lazydev").setup()
    end,
  },
  {
    "blink.cmp",
    event = "BufEnter",
    after = function()
      require("blink.cmp").setup()
    end,
  },
  {
    "snacks.nvim",
    lazy = false,
    after = function()
      require("snacks").setup({
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        lazygit = { enabled = true },
      })
    end,
    keys = {
      {
        "<leader>gg",
        function()
          local git_folder = vim.fn.finddir(".git", ".;")
          local root_folder = vim.fn.fnamemodify(git_folder, ":h")

          Snacks.lazygit({
            args = { "-p", root_folder },
          })
        end,
      },
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
      },
    },
  },
  { "nvim-treesitter", lazy = false },
  { "nvim-lspconfig", lazy = false },
  { "catppuccin-nvim", colorscheme = "catppuccin" },
})

vim.cmd([[ colorscheme catppuccin ]])
