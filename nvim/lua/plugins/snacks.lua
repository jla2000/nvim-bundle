return {
  "snacks.nvim",
  lazy = false,
  after = function()
    require("snacks").setup({
      bigfile = { enabled = true },
      bufdelete = { enabled = true },
      input = { enabled = true },
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

    -- LSP
    { "gr", function() Snacks.picker.lsp_references() end, },
    { "gd", function() Snacks.picker.lsp_definitions() end, },
    { "<leader>ss", function() Snacks.picker.lsp_symbols() end, },
    { "<leader>sS", function() Snacks.picker.lsp_workspace_symbols() end, },

    -- Find
    { "<leader>ff", function() Snacks.picker.files() end, },
    { "<leader>fr", function() Snacks.picker.recent() end, },
    { "<leader>fb", function() Snacks.picker.buffers() end, },
    { "<leader>sg", function() Snacks.picker.grep() end, },

    { "<leader>bd", function() Snacks.bufdelete() end, },
    { "<leader>d", function() Snacks.picker.diagnostics() end, },
    { "<leader>n", function() Snacks.picker.notifications() end, },
    { "<leader>sk", function() Snacks.picker.keymaps() end, },
    { "<leader>sR", function() Snacks.picker.resume() end, },

    -- stylua: ignore end
  },
}
