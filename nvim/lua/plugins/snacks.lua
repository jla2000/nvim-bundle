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
        local git_folder = vim.fn.finddir(".git", ".;")
        local root_folder = vim.fn.fnamemodify(git_folder, ":h")

        Snacks.lazygit({
          args = { "-p", root_folder },
        })
      end,
    },

    -- stylua: ignore start

    -- Find
    { "<leader>bd", function() Snacks.bufdelete() end, },
    { "<leader>d", function() Snacks.picker.diagnostics() end, },
    { "<leader>n", function() Snacks.picker.notifications() end, },
    { "<leader>sk", function() Snacks.picker.keymaps() end, },

    -- stylua: ignore end
  },
}
