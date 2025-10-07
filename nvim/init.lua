require("config.options")
require("config.keymaps")
require("config.autocmds")

vim.pack.add({
  "https://github.com/2KAbhishek/nerdy.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/Wansmer/symbol-usage.nvim",
  "https://github.com/christoomey/vim-tmux-navigator",
  "https://github.com/dmtrKovalenko/fff.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/folke/persistence.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/lumen-oss/lz.n",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/saecki/crates.nvim",
  "https://github.com/saecki/live-rename.nvim",
  "https://github.com/sindrets/diffview.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/windwp/nvim-autopairs",
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin-nvim" },
}, { load = function() end })

vim.cmd.packadd("lz.n")
vim.cmd.packadd("nvim-treesitter")

require("lz.n").load("plugins")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    if event.data.updated then
      vim.cmd.TSUpdate()
      vim.cmd.packadd("fff.nvim")
      require("fff.download").download_or_build_binary()
    end
  end,
})

vim.cmd.colorscheme("catppuccin-macchiato")
