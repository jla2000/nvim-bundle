vim.fn.matchadd("ErrorMsg", "\\<SAFETY\\ze:")

return {
  {
    "rustaceanvim",
    ft = "rust",
    before = function()
      vim.g.rustaceanvim = function()
        return {
          server = {
            on_attach = function()
              vim.keymap.set("n", "<leader>Dr", function()
                vim.cmd.RustLsp("debuggables")
              end)
            end,
          },
          default_settings = {
            ["rust-analyzer"] = {
              cargo = {
                features = "all",
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
        }
      end
    end,
  },
}
