-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Tabs
vim.api.nvim_set_keymap(
  "n",
  "<Tab>",
  "<cmd>BufferLineCycleNext<cr>",
  { noremap = true, silent = true, desc = "Next buffer" }
)
vim.api.nvim_set_keymap(
  "n",
  "<S-Tab>",
  "<cmd>BufferLineCyclePrev<cr>",
  { noremap = true, silent = true, desc = "Previous buffer" }
)

-- Bubble Text Up/Down
vim.api.nvim_set_keymap("n", "<C-j>", "ddp", { noremap = true, silent = true, desc = "Bubble Text Up" })
vim.api.nvim_set_keymap("n", "<C-k>", "ddkP", { noremap = true, silent = true, desc = "Bubble Text Down" })

-- GoLang specific keymaps
vim.api.nvim_set_keymap(
  "n",
  "<leader>Gsj",
  "<cmd> GoTagAdd json <CR>",
  { noremap = true, silent = true, desc = "Add json struct tags" }
)
vim.api.nvim_set_keymap(
  "n",
  "<leader>Gsy",
  "<cmd> GoTagAdd yaml <CR>",
  { noremap = true, silent = true, desc = "Add yaml struct tags" }
)

-- Markdown keymaps
vim.api.nvim_create_autocmd("FileType", {
  group = vim.api.nvim_create_augroup("markdown_keymaps", { clear = true }),
  pattern = "markdown",
  callback = function(ev)
    vim.bo[ev.buf].textwidth = 80
    vim.schedule(function()
      vim.keymap.set("v", "=", "gw", { buffer = ev.buf, silent = true, desc = "Format selection to 80 chars" })
    end)
  end,
})
