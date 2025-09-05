function FFFFindFunc(cmdarg, _)
  local picker = require("fff.file_picker")
  if not picker.is_initialized() then
    picker.setup()
  end

  local result = picker.search_files(cmdarg, 10, 4, nil, false)

  local list = {}
  for _, item in ipairs(result) do
    table.insert(list, item.relative_path)
  end

  return list
end

return {
  {
    "fff.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("fff").setup({})
      vim.opt.findfunc = "v:lua.FFFFindFunc"
    end,
  },
}
