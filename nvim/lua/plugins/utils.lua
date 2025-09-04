return {
  {
    "flash.nvim",
    after = function()
      ---@diagnostic disable-next-line: missing-fields
      require("flash").setup({
        modes = {
          char = {
            enabled = false,
          },
        },
      })
    end,
    keys = {
      {
        "s",
        function()
          require("flash").jump()
        end,
      },
    },
  },
  {
    "vim-tmux-navigator",
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = {
      { "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd><C-U>TmuxNavigatePrevious<cr>" },
    },
  },
  {
    "lazydev.nvim",
    ft = "lua",
    after = function()
      require("lazydev").setup()
    end,
  },
  {
    "persistence.nvim",
    event = "BufReadPre",
    after = function()
      require("persistence").setup()
    end,
    keys = {
      {
        "<leader>ql",
        function()
          require("persistence").load({ last = true })
        end,
      },
    },
  },
  {
    "nvim-autopairs",
    event = "InsertEnter",
    after = function()
      require("nvim-autopairs").setup()
    end,
  },
  { "cfilter", ft = "qf" },
  {
    "gitsigns.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("gitsigns").setup()
    end,
  },
  {
    "nvim-surround",
    event = "BufEnter",
    after = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "catppuccin-nvim",
    after = function()
      require("catppuccin").setup({
        integrations = {
          native_lsp = {
            enabled = true,
            underlines = {
              errors = { "undercurl" },
              warnings = { "undercurl" },
              hints = { "undercurl" },
              information = { "undercurl" },
            },
          },
          snacks = true,
          treesitter_context = true,
          gitsigns = true,
          fzf = true,
        },
      })

      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
  {
    "everforest",
    after = function()
      vim.cmd.colorscheme("everforest")
    end,
  },
  {
    "tokyonight",
    event = "VimEnter",
    after = function()
      vim.cmd.colorscheme("tokyonight")
    end,
  },
  {
    "diffview.nvim",
    cmd = "DiffviewOpen",
    opts = {},
    keys = {
      {
        "<leader>vv",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen")
          else
            vim.cmd("DiffviewClose")
          end
        end,
      },
      {
        "<leader>vm",
        function()
          if next(require("diffview.lib").views) == nil then
            vim.cmd("DiffviewOpen HEAD..main")
          else
            vim.cmd("DiffviewClose")
          end
        end,
      },
    },
  },
  {
    "nerdy.nvim",
    cmd = "Nerdy",
    after = function()
      require("nerdy").setup({
        max_recents = 30,
        add_default_keybindings = true,
        copy_to_clipboard = true,
      })
    end,
  },
  {
    "blame.nvim",
    cmd = "BlameToggle",
    after = function()
      require("blame").setup()
    end,
  },
}
