return {
  "adam12/ruby-lsp.nvim",
  ft = { "ruby", "eruby" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "neovim/nvim-lspconfig",
  },
  config = true,
  opts = {
    auto_install = true,
  },
  keys = {
    {
      "<leader>cl",
      function()
        vim.lsp.codelens.run()
      end,
      desc = "Run Code Lens",
    },
  },
}
