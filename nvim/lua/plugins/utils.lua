return {
  {
    "flash.nvim",
    after = function()
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
    "snacks.nvim",
    lazy = false,
    after = function()
      require("snacks").setup({
        bigfile = { enabled = true },
        bufdelete = { enabled = true },
        input = { enabled = true },
        picker = { enabled = true },
        notifier = { enabled = true },
        quickfile = { enabled = true },
        lazygit = { enabled = true },
      })
    end,
    keys = {
      {
        "<leader>gg",
        function()
          local git_folder = vim.fn.finddir(".git", ".;")
          local root_folder = vim.fn.fnamemodify(git_folder, ":h")

          Snacks.lazygit({
            args = { "-p", root_folder },
          })
        end,
      },
      {
        "<leader>bd",
        function()
          Snacks.bufdelete()
        end,
      },
    },
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
    event = "UIEnter",
    colorscheme = { "catppuccin", "catppuccin-macchiato" },
    after = function()
      vim.cmd.colorscheme("catppuccin-macchiato")
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
}
