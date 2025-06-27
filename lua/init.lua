vim.cmd([[ colorscheme catppuccin ]])

require("lz.n").load({
  {
    "oil.nvim",
    cmd = "Oil",
    after = function()
      require("oil").setup()
    end,
  },
  {
    "catppuccin",
    colorscheme = "catppuccin",
  },
})
