-- LSP configuration for K Framework Language Server (klsp)

local M = {}

-- Default configuration
M.config = {
  cmd = { "klsp" },
  filetypes = { "k" },
  root_markers = { ".git", "Makefile", "*.k" },
  settings = {},
}

--- Setup the K language server
--- @param opts table|nil Optional configuration overrides
function M.setup(opts)
  opts = opts or {}

  -- Merge user options with defaults
  local config = vim.tbl_deep_extend("force", M.config, opts)

  -- Check if klsp is available
  if vim.fn.executable(config.cmd[1]) ~= 1 then
    vim.notify(
      string.format("klsp not found at '%s'. Please install K Framework or configure klsp path.", config.cmd[1]),
      vim.log.levels.WARN
    )
    return
  end

  -- Use vim.lsp.config (Neovim 0.11+) if available
  if vim.lsp.config then
    vim.lsp.config.klsp = {
      cmd = config.cmd,
      filetypes = config.filetypes,
      root_markers = config.root_markers,
      settings = config.settings,
    }

    -- Enable the LSP for k filetype
    vim.lsp.enable("klsp")
  else
    -- Fallback for older Neovim versions using vim.lsp.start
    vim.api.nvim_create_autocmd("FileType", {
      pattern = config.filetypes,
      callback = function(args)
        -- Find root directory
        local root_dir = vim.fs.root(args.buf, config.root_markers) or vim.fn.getcwd()

        vim.lsp.start({
          name = "klsp",
          cmd = config.cmd,
          root_dir = root_dir,
          settings = config.settings,
        })
      end,
      group = vim.api.nvim_create_augroup("KFrameworkLsp", { clear = true }),
    })
  end
end

return M
