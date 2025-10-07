return {
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
      ---@diagnostic disable-next-line: missing-fields
      require("nvim-treesitter.configs").setup({
        auto_install = true,
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

      vim.api.nvim_set_hl(0, "TreesitterContextBottom", { underline = false })
    end,
  },
}
