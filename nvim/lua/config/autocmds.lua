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

vim.api.nvim_create_autocmd("CmdlineChanged", {
  pattern = "*",
  callback = function()
    local cmdline_cmd = vim.fn.split(vim.fn.getcmdline(), " ")[1]
    if cmdline_cmd == "find" or cmdline_cmd == "b" then
      vim.fn.wildtrigger()
    end
  end,
})
