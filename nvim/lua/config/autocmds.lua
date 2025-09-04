vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd({ "BufRead", "BufWritePre" }, {
  pattern = { "**/fenet/**.rs", "**/fenet/**.rst", "**/fenet/**.md" },
  callback = function()
    require("lint").try_lint("cspell")
  end,
})

vim.api.nvim_create_autocmd("QuickFixCmdPost", {
  pattern = "grep",
  callback = function()
    vim.cmd.cwindow()
  end,
})
