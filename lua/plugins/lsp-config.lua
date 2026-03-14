return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- pyright will be automatically installed with mason and loaded with lspconfig
      pyright = {},
      ruby_lsp = {
        mason = false,
        cmd = { vim.fn.expand("~/.local/share/mise/shims/ruby-lsp") },
        cmd_cwd = require("lspconfig.util").root_pattern("Gemfile", ".git"),
        filetypes = { "ruby", "eruby" },
        root_markers = { "Gemfile", ".git" },
      },
    },
  },
}
