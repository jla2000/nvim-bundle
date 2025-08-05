return {
  {
    "nvim-dap-ui",
    ft = "rust",
    after = function()
      local dap = require("dap")
      local dapui = require("dapui")

      dapui.setup()

      vim.fn.sign_define("DapBreakpoint", { text = "", texthl = "DiagnosticError" })
      vim.api.nvim_set_hl(0, "DapStoppedLine", { default = true, link = "Visual" })

      vim.fn.sign_define(
        "DapStopped",
        { text = "", texthl = "DiagnosticWarn", linehl = "DapStoppedLine", numhl = "DapStoppedLine" }
      )

      local enter_debug = function()
        dapui.open()
        vim.diagnostic.hide()

        -- stylua: ignore start
        vim.keymap.set("n", "<down>", function() dap.step_over() end)
        vim.keymap.set("n", "<right>", function() dap.step_into() end)
        vim.keymap.set("n", "<left>", function() dap.step_out() end)
        -- stylua: ignore end
      end

      dap.listeners.before.attach.dapui_config = enter_debug
      dap.listeners.before.launch.dapui_config = enter_debug
    end,
    keys = {
      -- stylua: ignore start
      { "<leader>Du", function() require("dapui").toggle() end, desc = "Toggle ui" },
      { "<leader>Db", function() require("dap").toggle_breakpoint() end, desc = "Toggle breakpoint" },
      { "<leader>Dc", function() require("dap").continue() end, desc = "Toggle breakpoint" },
      { "<leader>DC", function() require("dap").run_to_cursor() end, desc = "Toggle breakpoint" },
      -- stylua: ignore end
    },
  },
}
