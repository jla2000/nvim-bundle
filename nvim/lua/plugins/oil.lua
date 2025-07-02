vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
    if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})

return {
  "oil.nvim",
  cmd = "Oil",
  after = function()
    require("oil").setup({
      default_file_explorer = true,
      skip_confirm_for_simple_edits = true,
      delete_to_trash = true,
      columns = {
        "permissions",
        "size",
        "icon",
      },
      keymaps = {
        ["<ESC>"] = "actions.close",
      },
    })
  end,
  keys = {
    { "-", "<cmd>Oil<cr>", desc = "Open oil" },
  },
}
