return {
  "fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Open files" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Recent files" },
    { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Search files" },
    { "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Search files" },
    { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Find symbol" },
    { "grr", "<cmd>FzfLua lsp_references<cr>", desc = "Lsp references" },
    { "grt", "<cmd>FzfLua lsp_typedefs<cr>", desc = "Lsp references" },
    { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Lsp definitions" },
    {
      "<leader>sS",
      function()
        require("fzf-lua").lsp_live_workspace_symbols({
          formatter = "path.filename_first",
        })
      end,
      desc = "Find global symbol",
    },
  },
  after = function()
    require("fzf-lua").setup({
      winopts = {
        preview = {
          layout = "vertical",
        },
      },
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      fzf_colors = true,
    })
    require("fzf-lua").register_ui_select()
  end,
}
