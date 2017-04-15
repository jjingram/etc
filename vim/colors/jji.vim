set background=light

highlight clear
if exists("syntax_on")
    syntax reset
endif
let g:colors_name="jji"

colorscheme default

"----------------------------------------------------------------
" General settings                                              |
"----------------------------------------------------------------
"----------------------------------------------------------------
" Syntax group   | Foreground    | Background    | Style        |
"----------------------------------------------------------------

" --------------------------------
" Editor settings
" --------------------------------
"hi Normal guifg=NONE guibg=NONE gui=NONE
"hi Cursor guifg=NONE guibg=NONE gui=NONE
hi CursorLine guifg=NONE guibg=NONE gui=NONE
"hi LineNr guifg=NONE guibg=NONE gui=NONE
hi CursorLineNR guifg=NONE guibg=NONE gui=NONE

" -----------------
" - Number column -
" -----------------
"hi CursorColumn guifg=NONE guibg=NONE gui=NONE
"hi FoldColumn guifg=NONE guibg=NONE gui=NONE
"hi SignColumn guifg=NONE guibg=NONE gui=NONE
"hi Folded guifg=NONE guibg=NONE gui=NONE

" -------------------------
" - Window/Tab delimiters -
" -------------------------
"hi VertSplit guifg=NONE guibg=NONE gui=NONE
hi ColorColumn guifg=NONE guibg=Gray gui=NONE
"hi TabLine guifg=NONE guibg=NONE gui=NONE
"hi TabLineFill guifg=NONE guibg=NONE gui=NONE
"hi TabLineSel guifg=NONE guibg=NONE gui=NONE

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
"hi Directory guifg=NONE guibg=NONE gui=NONE
"hi Search guifg=NONE guibg=NONE gui=NONE
"hi IncSearch guifg=NONE guibg=NONE gui=NONE

" -----------------
" - Prompt/Status -
" -----------------
"hi StatusLine guifg=NONE guibg=NONE gui=NONE
"hi StatusLineNC guifg=NONE guibg=NONE gui=NONE
"hi WildMenu guifg=NONE guibg=NONE gui=NONE
"hi Question guifg=NONE guibg=NONE gui=NONE
"hi Title guifg=NONE guibg=NONE gui=NONE
"hi ModeMsg guifg=NONE guibg=NONE gui=NONE
"hi MoreMsg guifg=NONE guibg=NONE gui=NONE

" --------------
" - Visual aid -
" --------------
"hi MatchParen guifg=NONE guibg=NONE gui=NONE
"hi Visual guifg=NONE guibg=NONE gui=NONE
"hi VisualNOS guifg=NONE guibg=NONE gui=NONE
"hi NonText guifg=NONE guibg=NONE gui=NONE

"hi Todo guifg=NONE guibg=NONE gui=NONE
"hi Underlined guifg=NONE guibg=NONE gui=NONE
"hi Error guifg=NONE guibg=NONE gui=NONE
"hi ErrorMsg guifg=NONE guibg=NONE gui=NONE
"hi WarningMsg guifg=NONE guibg=NONE gui=NONE
"hi Ignore guifg=NONE guibg=NONE gui=NONE
"hi SpecialKey guifg=NONE guibg=NONE gui=NONE

" --------------------------------
" Variable types
" --------------------------------
hi Constant guifg=NONE guibg=NONE gui=NONE
"hi String guifg=NONE guibg=NONE gui=NONE
"hi StringDelimiter guifg=NONE guibg=NONE gui=NONE
"hi Character guifg=NONE guibg=NONE gui=NONE
"hi Number guifg=NONE guibg=NONE    gui=NONE
"hi Boolean guifg=NONE guibg=NONE gui=NONE
"hi Float guifg=NONE guibg=NONE gui=NONE

hi Identifier guifg=NONE guibg=NONE gui=NONE
hi Function guifg=NONE guibg=NONE gui=NONE

" --------------------------------
" Language constructs
" --------------------------------
hi Statement guifg=NONE guibg=NONE gui=bold
"hi Conditional guifg=NONE guibg=NONE gui=NONE
"hi Repeat guifg=NONE guibg=NONE gui=NONE
"hi Label guifg=NONE guibg=NONE gui=NONE
"hi Operator guifg=NONE guibg=NONE gui=NONE
"hi Keyword guifg=NONE guibg=NONE gui=NONE
"hi Exception guifg=NONE guibg=NONE gui=NONE
hi Comment guifg=Gray guibg=NONE gui=NONE

hi Special guifg=NONE guibg=NONE gui=NONE
"hi SpecialChar guifg=NONE guibg=NONE gui=NONE
"hi Tag guifg=NONE guibg=NONE gui=NONE
"hi Delimiter guifg=NONE guibg=NONE gui=NONE
"hi SpecialComment guifg=NONE guibg=NONE gui=NONE
"hi Debug guifg=NONE guibg=NONE gui=NONE

" ----------
" - C like -
" ----------
hi PreProc guifg=NONE guibg=NONE gui=NONE
"hi Include guifg=NONE guibg=NONE gui=NONE
"hi Define guifg=NONE guibg=NONE gui=NONE
"hi Macro guifg=NONE guibg=NONE gui=NONE
"hi PreCondit guifg=NONE guibg=NONE gui=NONE

hi Type guifg=NONE guibg=NONE gui=NONE
"hi StorageClass guifg=NONE guibg=NONE gui=NONE
"hi Structure guifg=NONE guibg=NONE gui=NONE
"hi Typedef guifg=NONE guibg=NONE gui=NONE

" --------------------------------
" Diff
" --------------------------------
"hi DiffAdd guifg=NONE guibg=NONE gui=NONE
"hi DiffChange guifg=NONE guibg=NONE gui=NONE
"hi DiffDelete guifg=NONE guibg=NONE gui=NONE
"hi DiffText guifg=NONE guibg=NONE gui=NONE

" --------------------------------
" Completion menu
" --------------------------------
"hi Pmenu guifg=NONE guibg=NONE gui=NONE
"hi PmenuSel guifg=NONE guibg=NONE gui=NONE
"hi PmenuSbar guifg=NONE guibg=NONE gui=NONE
"hi PmenuThumb guifg=NONE guibg=NONE gui=NONE

" --------------------------------
" Spelling
" --------------------------------
"hi SpellBad guifg=NONE guibg=NONE gui=NONE
"hi SpellCap guifg=NONE guibg=NONE gui=NONE
"hi SpellLocal guifg=NONE guibg=NONE gui=NONE
"hi SpellRare guifg=NONE guibg=NONE gui=NONE

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
