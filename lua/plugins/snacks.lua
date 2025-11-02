return {
  {
    "folke/snacks.nvim",
    opts = {
      scroll = { enabled = false },
      picker = {
        enabled = true,
        hidden = true,
        ignored = true,
        sources = {
          files = {
            hidden = true,
            ignored = true,
            exclude = {
              "**/.git/**",
              "**/node_modules/**",
              "**/__pycache__/**",
              "**/.venv/**",
            },
          },
          grep = {
            exclude = {
              "**/.git/**",
              "**/node_modules/**",
              "**/__pycache__/**",
              "**/.venv/**",
            },
          },
        },
      },
      explorer = {
        hidden = false,
        ignored = false,
        layout = { cycle = false },
      },
    },
  },
}
