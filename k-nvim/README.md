# k-nvim

Neovim plugin for K Framework language support.

## Features

- Syntax highlighting for `.k` and `.kore` files
- Filetype detection
- LSP integration with `klsp`
- Proper indentation and comment settings

## Requirements

- Neovim 0.9.0+
- `klsp` (K Language Server) in PATH for LSP features

## Installation

### lazy.nvim

```lua
{
  "kframework/k-editor-support",
  ft = { "k", "kore" },
  opts = {
    lsp = {
      enabled = true,
      cmd = { "klsp" },
    },
  },
}
```

Or with explicit config:

```lua
{
  "kframework/k-editor-support",
  ft = { "k", "kore" },
  config = function()
    require("k-nvim").setup({
      lsp = {
        enabled = true,
        cmd = { "klsp" },
      },
    })
  end,
}
```

### packer.nvim

```lua
use {
  "kframework/k-editor-support",
  ft = { "k", "kore" },
  config = function()
    require("k-nvim").setup()
  end,
}
```

### Manual Installation

Clone this repository and add the `k-nvim` directory to your runtime path:

```lua
-- In your init.lua
vim.opt.runtimepath:prepend("/path/to/k-editor-support/k-nvim")
```

The plugin will auto-setup when you open a `.k` file. For custom configuration:

```lua
require("k-nvim").setup({
  lsp = {
    cmd = { "/custom/path/to/klsp" },
  },
})
```

## Configuration

Default configuration:

```lua
{
  lsp = {
    enabled = true,        -- Enable LSP support
    cmd = { "klsp" },      -- Command to start the language server
  },
}
```

### Disable LSP

```lua
require("k-nvim").setup({
  lsp = {
    enabled = false,
  },
})
```

## LSP Features

When `klsp` is available, you get:

- Code completion
- Diagnostics
- Go to definition
- Find references
- Selection range

## File Types

| Extension | Filetype | Description |
|-----------|----------|-------------|
| `.k`      | `k`      | K Framework definitions |
| `.kore`   | `kore`   | Kore intermediate representation |
