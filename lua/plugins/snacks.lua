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
              "**/vendor/**",
            },
          },
          grep = {
            exclude = {
              "**/.git/**",
              "**/node_modules/**",
              "**/__pycache__/**",
              "**/.venv/**",
              "**/vendor/**",
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
