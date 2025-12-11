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
      {
        "S",
        function()
          require("flash").treesitter()
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
    colorscheme = {
      "catppuccin",
      "catppuccin-mocha",
      "catppuccin-macchiato",
    },
    after = function()
      require("catppuccin").setup({
        lsp_styles = {
          underlines = {
            errors = { "undercurl" },
            warnings = { "undercurl" },
            hints = { "undercurl" },
            information = { "undercurl" },
          },
        },
        integrations = {
          snacks = true,
          treesitter_context = true,
          gitsigns = true,
          fzf = true,
        },
      })
    end,
  },
  {
    "everforest-nvim",
    colorscheme = "everforest",
  },
  {
    "tokyonight.nvim",
    colorscheme = { "tokyonight", "tokyonight-storm" },
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
  { "nanode.nvim", colorscheme = "nanode" },
  { "thorn.nvim", colorscheme = "thorn" },
  { "conifer.nvim", colorscheme = "thorn" },
  { "y9nika.nvim", colorscheme = "y9nika" },
  { "lackluster.nvim", colorscheme = "lackluster" },
  {
    "rose-pine",
    colorscheme = "rose-pine",
    after = function()
      require("rose-pine").setup({
        styles = { transparency = true },
      })
    end,
  },
  { "tokyodark.nvim", colorscheme = "tokyodark" },
  { "onedark.nvim", colorscheme = "onedark" },
}
