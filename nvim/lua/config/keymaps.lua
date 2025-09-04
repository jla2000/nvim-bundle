vim.keymap.set("n", "<esc>", "<cmd>nohl<cr><esc>")
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>bp<cr>")

vim.keymap.set("n", "]t", "<cmd>tabn<cr>")
vim.keymap.set("n", "[t", "<cmd>tabp<cr>")

vim.keymap.set("v", ">", ">gv")
vim.keymap.set("v", "<", "<gv")

vim.keymap.set("v", "<leader>y", '"+y')
vim.keymap.set({ "n", "v" }, "<leader>p", '"+p')

vim.keymap.set("n", "<leader>cf", ":Cfilter ")
vim.keymap.set("n", "<leader>cc", ":copen<cr>")
vim.keymap.set("n", "<leader>co", ":colder<cr>")
vim.keymap.set("n", "<leader>cn", ":cnext<cr>")

vim.keymap.set("n", "<leader>ff", ":find<space>")
vim.keymap.set("n", "<leader>fb", ":b<space>")
vim.keymap.set("n", "<leader>sg", ":sil grep ''<left>")

vim.keymap.set("n", "grn", ":LspRename <c-r><c-w>")
vim.keymap.set("n", "<leader>sS", ":LspSymbol ")

vim.api.nvim_create_user_command("LspRename", function(opts)
  vim.lsp.buf.rename(opts.args)
end, { nargs = 1 })

vim.api.nvim_create_user_command("LspSymbol", function(opts)
  vim.lsp.buf.workspace_symbol(opts.args)
end, { nargs = 1 })
