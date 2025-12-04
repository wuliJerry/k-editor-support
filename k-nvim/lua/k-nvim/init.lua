-- K Framework support for Neovim
-- Provides syntax highlighting, filetype detection, and LSP integration

local M = {}

-- Default configuration
M.defaults = {
  -- LSP configuration
  lsp = {
    enabled = true,
    cmd = { "klsp" },
  },
}

-- Current configuration
M.config = {}

--- Setup the K Framework plugin
--- @param opts table|nil Optional configuration
function M.setup(opts)
  opts = opts or {}
  M.config = vim.tbl_deep_extend("force", M.defaults, opts)

  -- Mark as manually configured
  vim.g.k_nvim_setup_done = true

  -- Setup LSP if enabled
  if M.config.lsp.enabled then
    require("k-nvim.lsp").setup({
      cmd = M.config.lsp.cmd,
    })
  end
end

return M
