return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    opts = {
      setup = {
        pyright = function(_, opts)
          -- if a venv is active in your shell, use its python
          local venv = vim.fn.getenv("VIRTUAL_ENV")
          if venv ~= vim.NIL and venv ~= "" then
            opts.settings = opts.settings or {}
            opts.settings.python = opts.settings.python or {}
            opts.settings.python.pythonPath = venv .. "/bin/python"
          end

          -- now do the normal lspconfig setup call
          require("lspconfig").pyright.setup(opts)
          return true -- tell LazyVim we’ve handled it
        end,
      },

      servers = {
        pyright = {
          -- instruct Pyright where your venv lives:
          settings = {
            python = {
              analysis = {
                autoSearchPaths = true,
                diagnosticMode = "workspace",
                useLibraryCodeForTypes = true,
              },
            },
          },
        },
      },
    },
  },
}
