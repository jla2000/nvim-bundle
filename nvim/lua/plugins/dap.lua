return {
  {
    "nvim-dap-ui",
    ft = "rust",
    after = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      local enter_debug = function()
        dapui.open()
        vim.diagnostic.hide()

        -- stylua: ignore start
        vim.keymap.set("n", "<down>", function() dap.step_over() end)
        vim.keymap.set("n", "<right>", function() dap.step_into() end)
        vim.keymap.set("n", "<left>", function() dap.step_out() end)
        -- stylua: ignore end
      end

      local exit_debug = function()
        dapui.close()
        vim.diagnostic.show()

        -- stylua: ignore start
        vim.keymap.del("n", "<down>")
        vim.keymap.del("n", "<right>")
        vim.keymap.del("n", "<left>")
        -- stylua: ignore end
      end

      dap.listeners.before.attach.dapui_config = enter_debug
      dap.listeners.before.launch.dapui_config = enter_debug
      dap.listeners.before.event_exited.dapui_config = exit_debug
      dap.listeners.before.event_terminated.dapui_config = exit_debug
    end,
    keys = {
      -- stylua: ignore start
      { "<leader>du", function() require("dapui").toggle() end, desc = "Toggle breakpoint" },
      { "<leader>db", "<cmd>DapToggleBreakpoint<cr>", desc = "Toggle breakpoint" },
      { "<leader>dc", "<cmd>DapContinue<cr>", desc = "Toggle breakpoint" },
      -- stylua: ignore end
    },
  },
}
