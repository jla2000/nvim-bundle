vim.filetype.add({
  extension = {
    puml = "plantuml",
  },
})

return {
  "plantuml.nvim",
  ft = "plantuml",
  after = function()
    require("plantuml").setup({})
  end,
}
