return {
  "fzf-lua",
  cmd = "FzfLua",
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Open files" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Recent files" },
    { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Search files" },
    { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Goto definition" },
    { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Find symbol" },
    {
      "<leader>sS",
      function()
        require("fzf-lua").lsp_live_workspace_symbols({
          winopts = {
            preview = {
              layout = "vertical",
            },
          },
          formatter = "path.filename_first",
        })
      end,
      desc = "Find global symbol",
    },
  },
  after = function()
    require("fzf-lua").setup({
      keymap = {
        fzf = {
          ["ctrl-q"] = "select-all+accept",
        },
      },
      fzf_colors = true,
    })
  end,
}
