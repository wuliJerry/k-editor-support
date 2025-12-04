-- Syntax highlighting for Kore (K intermediate representation)
-- Language: Kore

if vim.b.current_syntax then
  return
end

vim.cmd([[
  syntax clear

  " Comments
  syn match koreComment "//.*$" contains=koreTodo
  syn region koreComment start="/\*" end="\*/" contains=koreTodo,koreComment
  syn keyword koreTodo contained TODO FIXME XXX NOTE BUG

  " Strings
  syn region koreString start=/"/ skip=/\\"/ end=/"/ contains=koreEscape
  syn match koreEscape contained "\\[nrtf\\"']"

  " Numbers
  syn match koreNumber "\<\d\+\>"
  syn match koreNumber "\<0[xX][0-9a-fA-F]\+\>"

  " Keywords
  syn keyword koreKeyword module endmodule import
  syn keyword koreKeyword sort symbol alias axiom claim
  syn keyword koreKeyword hooked-sort hooked-symbol

  " Attributes
  syn keyword koreAttr functional constructor injective
  syn keyword koreAttr assoc comm idem unit
  syn keyword koreAttr hook smtlib smt-hook
  syn keyword koreAttr anywhere owise simplification
  syn keyword koreAttr priority trusted
  syn match koreAttr "\<autoReject\>"
  syn match koreAttr "\<noAutoReject\>"

  " ML constructs
  syn match koreML "\\and"
  syn match koreML "\\or"
  syn match koreML "\\not"
  syn match koreML "\\implies"
  syn match koreML "\\iff"
  syn match koreML "\\equals"
  syn match koreML "\\ceil"
  syn match koreML "\\floor"
  syn match koreML "\\exists"
  syn match koreML "\\forall"
  syn match koreML "\\rewrites"
  syn match koreML "\\top"
  syn match koreML "\\bottom"
  syn match koreML "\\in"
  syn match koreML "\\next"
  syn match koreML "\\mu"
  syn match koreML "\\nu"
  syn match koreML "\\dv"

  " Sort declarations
  syn match koreSort "\<Sort[A-Z][a-zA-Z0-9]*\>"
  syn match koreSort "\<SortK\>"
  syn match koreSort "\<SortKItem\>"

  " Operators
  syn match koreOperator ":="
  syn match koreOperator "{}"
  syn match koreOperator "()"

  " Highlighting links
  hi def link koreComment Comment
  hi def link koreTodo Todo
  hi def link koreString String
  hi def link koreEscape Special
  hi def link koreNumber Number
  hi def link koreKeyword Keyword
  hi def link koreAttr PreProc
  hi def link koreML Special
  hi def link koreSort Type
  hi def link koreOperator Operator
]])

vim.b.current_syntax = "kore"
