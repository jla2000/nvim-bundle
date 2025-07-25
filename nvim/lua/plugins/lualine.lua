return {
  {
    "lualine.nvim",
    event = "UIEnter",
    after = function()
      require("lualine").setup({
        options = {
          section_separators = { left = "", right = "" },
          component_separators = { left = "", right = "" },
        },
      })
    end,
  },
}
