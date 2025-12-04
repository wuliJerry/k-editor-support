-- K Framework plugin initialization

-- Prevent loading twice
if vim.g.loaded_k_nvim then
  return
end
vim.g.loaded_k_nvim = true

-- Register filetypes with high priority to override other plugins
-- This runs early so lazy.nvim knows to load the plugin for .k files
vim.filetype.add({
  extension = {
    k = "k",
    kore = "kore",
  },
  pattern = {
    [".*%.k"] = { "k", { priority = 10 } },
    [".*%.kore"] = { "kore", { priority = 10 } },
  },
})

-- Auto-setup LSP when the plugin loads (if not using manual setup)
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "k", "kore" },
  callback = function()
    -- Only auto-setup if user hasn't called setup() manually
    if not vim.g.k_nvim_setup_done then
      require("k-nvim").setup()
      vim.g.k_nvim_setup_done = true
    end
  end,
  group = vim.api.nvim_create_augroup("KNvimAutoSetup", { clear = true }),
})