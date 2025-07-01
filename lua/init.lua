vim.g.mapleader = " "

vim.opt.number = true
vim.opt.cursorline = true
vim.opt.undofile = true
vim.opt.shiftwidth = 2
vim.opt.signcolumn = "yes:1"
vim.opt.scrolloff = 8
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.wrap = false
vim.opt.laststatus = 3

vim.diagnostic.config({
  virtual_text = { current_line = true },
})

vim.keymap.set("n", "<esc>", "<cmd>nohl<cr><esc>")
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>bp<cr>")

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(args)
    local opts = { buffer = args.buf }
    vim.lsp.inlay_hint.enable(true, opts)

    vim.keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)
    vim.keymap.set("n", "<leader>uh", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
    end)
    vim.keymap.set("n", "grn", function()
      require("live-rename").rename()
    end, opts)
  end,
})

vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
    vim.highlight.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

vim.api.nvim_create_autocmd("User", {
  pattern = "OilActionsPost",
  callback = function(event)
    if event.data.actions.type == "move" then
      Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
    end
  end,
})

vim.filetype.add({
  extension = {
    puml = "plantuml",
  },
})

require("lz.n").load({
  {
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
  },
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
    "fzf-lua",
    cmd = "FzfLua",
    keys = {
      { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Open files" },
      { "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent files" },
      { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Recent files" },
      { "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Search files" },
      { "gd", "<cmd>FzfLua lsp_definitions<cr>", desc = "Goto definition" },
      { "<leader>ss", "<cmd>FzfLua lsp_document_symbols<cr>", desc = "Find symbol" },
      {
        "<leader>sS",
        function()
          require("fzf-lua").lsp_live_workspace_symbols({
            winopts = {
              preview = {
                layout = "vertical",
              },
            },
            formatter = "path.filename_first",
          })
        end,
        desc = "Find global symbol",
      },
    },
    after = function()
      require("fzf-lua").setup({
        keymap = {
          fzf = {
            ["ctrl-q"] = "select-all+accept",
          },
        },
        fzf_colors = true,
      })
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
  {
    "nvim-treesitter-context",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      require("treesitter-context").setup({
        max_lines = 3,
      })
    end,
  },
  {
    "nvim-treesitter-textobjects",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      require("nvim-treesitter.configs").setup({
        auto_install = false,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
        textobjects = {
          select = {
            enable = true,
            lookahead = true,

            keymaps = {
              ["af"] = "@function.outer",
              ["if"] = "@function.inner",
              ["ac"] = "@class.outer",
              ["ic"] = "@class.inner",
              ["ia"] = "@parameter.inner",
              ["aa"] = "@parameter.outer",
              ["ix"] = "@comment.inner",
              ["ax"] = "@comment.outer",
            },
          },
          swap = {
            enable = true,
            swap_next = {
              ["<leader>a"] = "@parameter.inner",
            },
            swap_previous = {
              ["<leader>A"] = "@parameter.inner",
            },
          },
          move = {
            enable = true,
            set_jumps = true,
            goto_next_start = {
              ["]a"] = "@parameter.inner",
              ["]f"] = "@function.outer",
            },
            goto_next_end = {
              ["]A"] = "@parameter.outer",
              ["]F"] = "@function.outer",
            },
            goto_previous_start = {
              ["[a"] = "@parameter.outer",
              ["[f"] = "@function.outer",
            },
            goto_previous_end = {
              ["[A"] = "@parameter.outer",
              ["[F"] = "@function.outer",
            },
          },
        },
      })
    end,
  },
  {
    "nvim-lint",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      require("lint").linters_by_ft = {
        rust = { "clippy" },
      }

      require("lint").linters.clippy.ignore_exitcode = true

      vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
        callback = function()
          require("lint").try_lint()
        end,
      })
    end,
  },
  {
    "cfilter",
    ft = "qf",
  },
  {
    "gitsigns.nvim",
    event = "DeferredUIEnter",
    after = function()
      require("gitsigns").setup()
    end,
  },
  {
    "live-rename.nvim",
    event = "BufEnter",
  },
  {
    "nvim-surround",
    event = "BufEnter",
    after = function()
      require("nvim-surround").setup({})
    end,
  },
  {
    "plantuml.nvim",
    ft = "plantuml",
    after = function()
      require("plantuml").setup({})
    end,
  },
  {
    "nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    after = function()
      vim.lsp.enable("lua_ls")
      vim.lsp.enable("rust_analyzer")
      vim.lsp.enable("nixd")
      vim.lsp.enable("pyrefly")
    end,
  },
  { "catppuccin-nvim", colorscheme = { "catppuccin", "catppuccin-macchiato" } },
})

vim.cmd([[ colorscheme catppuccin-macchiato ]])
