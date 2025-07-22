vim.keymap.set("n", "<esc>", "<cmd>nohl<cr><esc>")
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>bp<cr>")
vim.keymap.set("n", "<leader>xq", "<cmd>copen<cr>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "]t", "<cmd>tabn<cr>")
vim.keymap.set("n", "[t", "<cmd>tabp<cr>")

-- TODO: replace with on_jump option once available
local reset_virtual_lines = vim.schedule_wrap(function()
  vim.diagnostic.config({ virtual_lines = { current_line = true } })
  vim.api.nvim_create_autocmd("CursorMoved", {
    once = true,
    callback = function()
      vim.diagnostic.config({ virtual_lines = false })
    end,
  })
end)

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1 })
  reset_virtual_lines()
end)

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1 })
  reset_virtual_lines()
end)

vim.keymap.set("n", "<leader>d", function()
  reset_virtual_lines()
end)

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")
