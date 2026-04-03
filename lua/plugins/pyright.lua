return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "mason-org/mason-lspconfig.nvim" },
    opts = {
      setup = {
        pyright = function(_, opts)
          -- Walk up from a directory to find the closest .venv
          local function find_venv(start_dir)
            local dir = start_dir
            while dir and dir ~= "/" do
              local candidate = dir .. "/.venv"
              if vim.uv.fs_stat(candidate .. "/bin/python") then
                return candidate
              end
              dir = vim.fn.fnamemodify(dir, ":h")
            end
            return nil
          end

          opts.on_new_config = function(new_config, root_dir)
            local venv = find_venv(root_dir)
            -- fall back to VIRTUAL_ENV env var
            if not venv then
              local env_venv = vim.fn.getenv("VIRTUAL_ENV")
              if env_venv ~= vim.NIL and env_venv ~= "" then
                venv = env_venv
              end
            end

            if venv then
              local venv_dir = vim.fn.fnamemodify(venv, ":h")
              local venv_name = vim.fn.fnamemodify(venv, ":t")
              new_config.settings = vim.tbl_deep_extend("force", new_config.settings or {}, {
                python = {
                  pythonPath = venv .. "/bin/python",
                  venvPath = venv_dir,
                  venv = venv_name,
                },
              })
            end
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
