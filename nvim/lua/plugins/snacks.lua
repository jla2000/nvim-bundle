return {
  "snacks.nvim",
  lazy = false,
  after = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      picker = {
        enabled = true,
        layout = {
          preset = "vertical",
          layout = {
            width = 0.8,
          },
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      lazygit = { enabled = true },
    })

    Snacks.toggle.inlay_hints():map("<leader>uh")
  end,
  keys = {
    {
      "<leader>gg",
      function()
        ---@diagnostic disable-next-line: missing-fields
        Snacks.lazygit({
          args = { "-p", Snacks.git.get_root() },
        })
      end,
    },

    -- stylua: ignore start

    -- Find
    { "<leader>bd", function() Snacks.bufdelete() end, },
    { "<leader>D", function() Snacks.picker.diagnostics() end, },
    { "<leader>n", function() Snacks.picker.notifications() end, },
    { "<leader>sk", function() Snacks.picker.keymaps() end, },

    -- stylua: ignore end
  },
}
