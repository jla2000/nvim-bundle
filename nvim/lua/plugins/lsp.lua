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
            check = {
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            checkOnSave = true,
          },
        },
      })

      vim.lsp.enable("lua_ls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("nixd")
      vim.lsp.enable("pyrefly")
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
        },
        format_on_save = {
          timeout_ms = 500,
          lsp_format = "fallback",
        },
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
}
