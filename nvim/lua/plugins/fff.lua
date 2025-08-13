return {
  {
    "fff.nvim",
    cmd = "FFFFind",
    after = function()
      require("fff").setup({})
    end,
    keys = {
      {
        "<leader>ff",
        function()
          require("fff").find_files()
        end,
        desc = "Find files",
      },
    },
  },
}
