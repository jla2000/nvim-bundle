return {
  "fidget.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("fidget").setup({})
    vim.notify = require("fidget.notification").notify
  end,
}
