return {
  {
    "rustaceanvim",
    ft = "rust",
    before = function()
      vim.g.rustaceanvim = function()
        return {
          default_settings = {
            ["rust-analyzer"] = {},
          },
        }
      end
    end,
  },
}
