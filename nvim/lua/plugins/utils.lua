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
    "codediff.nvim",
    cmd = "CodeDiff",
    after = function()
      require("codediff").setup()
    end,
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
    "sidekick.nvim",
    event = "LspAttach",
    after = function()
      require("sidekick").setup({
        cli = { mux = { backend = "tmux", enabled = true } },
        nes = { enabled = false },
      })
    end,
    keys = {
      {
        "<c-.>",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle",
        mode = { "n", "t", "i", "x" },
      },
      {
        "<leader>aa",
        function()
          require("sidekick.cli").toggle()
        end,
        desc = "Sidekick Toggle CLI",
      },
      {
        "<leader>as",
        function()
          require("sidekick.cli").select()
        end,
        -- Or to select only installed tools:
        -- require("sidekick.cli").select({ filter = { installed = true } })
        desc = "Select CLI",
      },
      {
        "<leader>ad",
        function()
          require("sidekick.cli").close()
        end,
        desc = "Detach a CLI Session",
      },
      {
        "<leader>at",
        function()
          require("sidekick.cli").send({ msg = "{this}" })
        end,
        mode = { "x", "n" },
        desc = "Send This",
      },
      {
        "<leader>af",
        function()
          require("sidekick.cli").send({ msg = "{file}" })
        end,
        desc = "Send File",
      },
      {
        "<leader>av",
        function()
          require("sidekick.cli").send({ msg = "{selection}" })
        end,
        mode = { "x" },
        desc = "Send Visual Selection",
      },
      {
        "<leader>ap",
        function()
          require("sidekick.cli").prompt()
        end,
        mode = { "n", "x" },
        desc = "Sidekick Select Prompt",
      },
      -- Example of a keybinding to open Claude directly
      {
        "<leader>ac",
        function()
          require("sidekick.cli").toggle({ name = "claude", focus = true })
        end,
        desc = "Sidekick Toggle Claude",
      },
    },
  },
  { "nanode.nvim", colorscheme = "nanode" },
  { "thorn.nvim", colorscheme = "thorn" },
  { "conifer.nvim", colorscheme = "thorn" },
  { "y9nika.nvim", colorscheme = "y9nika" },
  { "lackluster.nvim", colorscheme = "lackluster" },
  { "koda.nvim", colorscheme = "koda" },
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
