-- Filetype plugin for Kore files

-- Only load once per buffer
if vim.b.did_ftplugin then
  return
end
vim.b.did_ftplugin = true

local opt_local = vim.opt_local

-- Comment settings
opt_local.commentstring = "// %s"
opt_local.comments = "s1:/*,mb:*,ex:*/,://"

-- Indentation settings
opt_local.expandtab = true
opt_local.shiftwidth = 2
opt_local.softtabstop = 2
opt_local.tabstop = 2

-- Allow hyphens in keywords
opt_local.iskeyword:append("-")

-- Define pattern for definitions
opt_local.define = [[^\s*\(module\|sort\|symbol\|alias\|axiom\)]]

-- Fold settings
opt_local.foldmethod = "syntax"

-- Match pairs for % command
opt_local.matchpairs:append("<:>")

-- Undo settings when filetype changes
vim.b.undo_ftplugin = table.concat({
  "setlocal commentstring<",
  "setlocal comments<",
  "setlocal expandtab<",
  "setlocal shiftwidth<",
  "setlocal softtabstop<",
  "setlocal tabstop<",
  "setlocal iskeyword<",
  "setlocal define<",
  "setlocal foldmethod<",
  "setlocal matchpairs<",
}, " | ")
