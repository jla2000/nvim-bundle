return {
  {
    "which-key.nvim",
    event = "DeferredUIEnter",
    after = function()
      ---@diagnostic disable-next-line: missing-fields
      require("which-key").setup({
        preset = "helix",
        delay = 300,
      })
    end,
  },
}
