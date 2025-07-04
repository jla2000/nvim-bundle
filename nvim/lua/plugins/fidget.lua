return {
  "fidget.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("fidget").setup({
      notification = { override_vim_notify = true },
    })
  end,
}
