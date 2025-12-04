-- Syntax highlighting for K Framework
-- Language: K Framework

if vim.b.current_syntax then
  return
end

-- Use vim.cmd with heredoc for cleaner syntax definitions
vim.cmd([[
  syntax clear

  " Comments
  syn match kComment "//.*$" contains=kTodo
  syn region kComment start="/\*" end="\*/" contains=kTodo,kComment
  syn keyword kTodo contained TODO FIXME XXX NOTE BUG

  " Strings
  syn region kString start=/"/ skip=/\\"/ end=/"/ contains=kEscape
  syn match kEscape contained "\\[nrtf\\"']"
  syn match kEscape contained "\\x[0-9a-fA-F]\{2\}"
  syn match kEscape contained "\\u[0-9a-fA-F]\{4\}"

  " Numbers
  syn match kNumber "\<\d\+\>"
  syn match kNumber "\<0[xX][0-9a-fA-F]\+\>"
  syn match kNumber "\<0[oO][0-7]\+\>"
  syn match kFloat "\<\d\+\.\d*\([eE][+-]\?\d\+\)\?\>"
  syn match kFloat "\<\d\+[eE][+-]\?\d\+\>"

  " Keywords - Module/Structure
  syn keyword kModule module endmodule
  syn keyword kImport require requires imports import public private

  " Keywords - Declarations
  syn keyword kDeclaration syntax rule claim configuration context
  syn keyword kDeclaration left right prefer avoid priorities lexical
  syn match kDeclaration "\<non-assoc\>"

  " Keywords - Control/Modifiers
  syn keyword kControl where when alias

  " Boolean literals
  syn keyword kBoolean true false

  " Built-in types
  syn keyword kType K KItem KResult KLabel KList
  syn keyword kType List Bag Set Map
  syn keyword kType NeList NeBag NeSet NeMap
  syn keyword kType ListItem BagItem SetItem MapItem
  syn keyword kType Bool Int Nat Float String Char Id
  syn keyword kType CellLabel Token Lexer

  " Hashed types
  syn match kType "#Bool"
  syn match kType "#Int"
  syn match kType "#Float"
  syn match kType "#String"
  syn match kType "#Char"
  syn match kType "#Id"

  " ML/Logic keywords
  syn match kML "#True"
  syn match kML "#False"
  syn match kML "#And"
  syn match kML "#Or"
  syn match kML "#Not"
  syn match kML "#Implies"
  syn match kML "#Iff"
  syn match kML "#Equals"
  syn match kML "#Ceil"
  syn match kML "#Floor"
  syn match kML "#Exists"
  syn match kML "#Forall"
  syn match kML "#Rewrites"
  syn match kML "#AG"
  syn match kML "#wEF"
  syn match kML "#as"
  syn match kML "#if"
  syn match kML "#then"
  syn match kML "#else"
  syn match kML "#fi"
  syn match kML "#fun"

  " Empty collections
  syn match kConstant "\.List"
  syn match kConstant "\.Map"
  syn match kConstant "\.Set"
  syn match kConstant "\.Bag"
  syn match kConstant "\.K"
  syn match kConstant "\.KList"
  syn keyword kConstant undef

  " Operators
  syn match kOperator "::="
  syn match kOperator "=>"
  syn match kOperator "\~>"
  syn match kOperator "|->"
  syn match kOperator "->"
  syn match kOperator "\.\.\."

  " Type-specific operators
  syn match kOperator "==Int"
  syn match kOperator "=/=Int"
  syn match kOperator "<Int"
  syn match kOperator "<=Int"
  syn match kOperator ">Int"
  syn match kOperator ">=Int"
  syn match kOperator "+Int"
  syn match kOperator "-Int"
  syn match kOperator "\*Int"
  syn match kOperator "/Int"
  syn match kOperator "%Int"
  syn match kOperator "\^Int"
  syn match kOperator "==Float"
  syn match kOperator "=/=Float"
  syn match kOperator "+Float"
  syn match kOperator "-Float"
  syn match kOperator "\*Float"
  syn match kOperator "/Float"
  syn match kOperator "==String"
  syn match kOperator "=/=String"
  syn match kOperator "+String"
  syn match kOperator "==Bool"
  syn match kOperator "=/=Bool"
  syn match kOperator "==K"
  syn match kOperator "=/=K"
  syn match kOperator ":=K"
  syn match kOperator ":/=K"
  syn match kOperator "divInt"
  syn match kOperator "modInt"
  syn match kOperator "dividesInt"
  syn match kOperator "notBool"
  syn match kOperator "andBool"
  syn match kOperator "orBool"
  syn match kOperator "xorBool"
  syn match kOperator "impliesBool"
  syn match kOperator "andThenBool"
  syn match kOperator "orElseBool"

  " Special symbols
  syn keyword kSpecial HOLE HERE

  " Attributes (in square brackets)
  syn region kAttribute start="\[" end="\]" contains=kAttrKeyword,kString,kNumber
  syn keyword kAttrKeyword contained strict seqstrict avoid prefer bracket
  syn keyword kAttrKeyword contained macro token structural latex binder
  syn keyword kAttrKeyword contained klabel symbol hook unit function total
  syn keyword kAttrKeyword contained result assoc comm idem element format
  syn keyword kAttrKeyword contained smtlib anywhere context owise label
  syn keyword kAttrKeyword contained hybrid heat cool trusted simplification
  syn keyword kAttrKeyword contained priority concrete symbolic injective
  syn keyword kAttrKeyword contained functional constructor
  syn match kAttrKeyword contained "\<non-assoc\>"
  syn match kAttrKeyword contained "\<left\>"
  syn match kAttrKeyword contained "\<right\>"
  syn match kAttrKeyword contained "\<macro-rec\>"
  syn match kAttrKeyword contained "\<smt-hook\>"
  syn match kAttrKeyword contained "\<smt-lemma\>"
  syn match kAttrKeyword contained "\<no-evaluators\>"

  " Cell tags
  syn region kCell start="<[a-zA-Z][a-zA-Z0-9_-]*" end=">" contains=kCellName,kCellAttr
  syn region kCellClose start="</[a-zA-Z][a-zA-Z0-9_-]*" end=">"
  syn match kCellName contained "<\/\?[a-zA-Z][a-zA-Z0-9_-]*"

  " Highlighting links
  hi def link kComment Comment
  hi def link kTodo Todo
  hi def link kString String
  hi def link kEscape Special
  hi def link kNumber Number
  hi def link kFloat Float
  hi def link kBoolean Boolean
  hi def link kModule Structure
  hi def link kImport Include
  hi def link kDeclaration Statement
  hi def link kControl Conditional
  hi def link kType Type
  hi def link kML Keyword
  hi def link kConstant Constant
  hi def link kOperator Operator
  hi def link kSpecial Special
  hi def link kAttribute PreProc
  hi def link kAttrKeyword Keyword
  hi def link kCell Tag
  hi def link kCellClose Tag
  hi def link kCellName Identifier
]])

vim.b.current_syntax = "k"