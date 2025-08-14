vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if client and client.server_capabilities.inlayHintProvider then
      vim.lsp.inlay_hint.enable(true, { buffer = args.buf })
    end
  end,
})

return {
  {
    "nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      vim.lsp.config("rust_analyzer", {
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
              buildScripts = { enable = true },
              loadOutDirsFromCheck = true,
            },
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            checkOnSave = true,
            files = {
              excludeDirs = {
                ".direnv",
                ".git",
                ".jj",
                "target",
              },
            },
          },
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("nixd")
      vim.lsp.enable("pyrefly")
      vim.lsp.enable("rust_analyzer")
    end,
  },
  {
    "live-rename.nvim",
    keys = {
      {
        "grn",
        function()
          require("live-rename").rename()
        end,
      },
    },
  },
  {
    "conform.nvim",
    event = "BufWritePre",
    after = function()
      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          nix = { "nixpkgs_fmt", "injected" },
          rust = { "rustfmt" },
          python = { "black" },
          toml = { "taplo" },
          markdown = { "markdownlint-cli2" },
        },
        format_on_save = function(bufnr)
          if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
            return
          end
          return { timeout_ms = 500, lsp_format = "fallback" }
        end,
      })

      vim.api.nvim_create_user_command("FormatDisable", function(args)
        if args.bang then
          -- FormatDisable! will disable formatting just for this buffer
          vim.b.disable_autoformat = true
        else
          vim.g.disable_autoformat = true
        end
      end, {
        desc = "Disable autoformat-on-save",
        bang = true,
      })
      vim.api.nvim_create_user_command("FormatEnable", function()
        vim.b.disable_autoformat = false
        vim.g.disable_autoformat = false
      end, {
        desc = "Re-enable autoformat-on-save",
      })
    end,
  },
  {
    "crates.nvim",
    event = "BufRead Cargo.toml",
    after = function()
      require("crates").setup({})
    end,
  },
  {
    "blink.cmp",
    event = "BufEnter",
    after = function()
      require("blink.cmp").setup({
        keymap = {
          preset = "default",
          ["<Up>"] = { "select_prev", "fallback" },
          ["<Down>"] = { "select_next", "fallback" },
        },
        cmdline = {
          enabled = false,
        },
      })
    end,
  },
  {
    "symbol-usage.nvim",
    event = "LspAttach",
    after = function()
      require("symbol-usage").setup({
        vt_position = "end_of_line",
      })
    end,
  },
}
