require("config.options")
require("config.keymaps")
require("config.autocmds")

vim.api.nvim_create_autocmd("PackChanged", {
  callback = function(event)
    if event.data.updated then
      require("fff.download").download_binary()
      vim.cmd.TSUpdate()
    end
  end,
})

vim.pack.add({
  "https://github.com/2KAbhishek/nerdy.nvim",
  "https://github.com/KijitoraFinch/nanode.nvim",
  "https://github.com/MeanderingProgrammer/render-markdown.nvim",
  "https://github.com/MunifTanjim/nui.nvim",
  "https://github.com/Wansmer/symbol-usage.nvim",
  "https://github.com/christoomey/vim-tmux-navigator",
  "https://github.com/dmtrKovalenko/fff.nvim",
  "https://github.com/esmuellert/codediff.nvim",
  "https://github.com/folke/flash.nvim",
  "https://github.com/folke/lazydev.nvim",
  "https://github.com/folke/persistence.nvim",
  "https://github.com/folke/sidekick.nvim",
  "https://github.com/folke/snacks.nvim",
  "https://github.com/folke/tokyonight.nvim",
  "https://github.com/folke/which-key.nvim",
  "https://github.com/ibhagwan/fzf-lua",
  "https://github.com/j-hui/fidget.nvim",
  "https://github.com/jpwol/thorn.nvim",
  "https://github.com/kylechui/nvim-surround",
  "https://github.com/kyza0d/xeno.nvim",
  "https://github.com/lewis6991/gitsigns.nvim",
  "https://github.com/lucasadelino/conifer.nvim",
  "https://github.com/lumen-oss/lz.n",
  "https://github.com/mfussenegger/nvim-lint",
  "https://github.com/navarasu/onedark.nvim",
  "https://github.com/neanias/everforest-nvim",
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/nvim-tree/nvim-web-devicons",
  "https://github.com/nvim-treesitter/nvim-treesitter",
  "https://github.com/nvim-treesitter/nvim-treesitter-context",
  "https://github.com/nvim-treesitter/nvim-treesitter-textobjects",
  "https://github.com/oskarnurm/koda.nvim",
  "https://github.com/saecki/crates.nvim",
  "https://github.com/saecki/live-rename.nvim",
  "https://github.com/serhez/bento.nvim",
  "https://github.com/slugbyte/lackluster.nvim",
  "https://github.com/stevearc/conform.nvim",
  "https://github.com/stevearc/oil.nvim",
  "https://github.com/tiagovla/tokyodark.nvim",
  "https://github.com/windwp/nvim-autopairs",
  "https://github.com/y9san9/y9nika.nvim",
  { src = "https://github.com/Saghen/blink.cmp", version = "v1.7.0" },
  { src = "https://github.com/catppuccin/nvim", name = "catppuccin-nvim" },
  { src = "https://github.com/rose-pine/neovim", name = "rose-pine" },
}, { load = function() end })

vim.cmd.packadd("lz.n")
vim.cmd.packadd("nvim-treesitter")
vim.cmd.packadd("nvim-web-devicons")
vim.cmd.packadd("nui.nvim")

require("lz.n").load("plugins")

vim.cmd.colorscheme("catppuccin-mocha")
