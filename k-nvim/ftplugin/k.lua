-- Filetype plugin for K Framework files

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

-- Allow hyphens in keywords (common in K identifiers)
opt_local.iskeyword:append("-")

-- Include pattern for `requires` statements
opt_local.include = [[^\s*requires\?\s\+"\zs[^"]\+\ze"]]

-- Define pattern for definitions (modules, syntax, rules)
opt_local.define = [[^\s*\(module\|syntax\|rule\|claim\|configuration\)]]

-- Fold settings (fold on modules)
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
  "setlocal include<",
  "setlocal define<",
  "setlocal foldmethod<",
  "setlocal matchpairs<",
}, " | ")
