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
hi Normal ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Cursor ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLine ctermfg=NONE ctermbg=NONE cterm=NONE
"hi LineNr ctermfg=NONE ctermbg=NONE cterm=NONE
hi CursorLineNR ctermfg=NONE ctermbg=NONE cterm=NONE

" -----------------
" - Number column -
" -----------------
"hi CursorColumn ctermfg=NONE ctermbg=NONE cterm=NONE
"hi FoldColumn ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SignColumn ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Folded ctermfg=NONE ctermbg=NONE cterm=NONE

" -------------------------
" - Window/Tab delimiters -
" -------------------------
"hi VertSplit ctermfg=NONE ctermbg=NONE cterm=NONE
hi ColorColumn ctermfg=NONE ctermbg=Gray cterm=NONE
"hi TabLine ctermfg=NONE ctermbg=NONE cterm=NONE
"hi TabLineFill ctermfg=NONE ctermbg=NONE cterm=NONE
"hi TabLineSel ctermfg=NONE ctermbg=NONE cterm=NONE

" -------------------------------
" - File Navigation / Searching -
" -------------------------------
"hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Search ctermfg=NONE ctermbg=NONE cterm=NONE
"hi IncSearch ctermfg=NONE ctermbg=NONE cterm=NONE

" -----------------
" - Prompt/Status -
" -----------------
"hi StatusLine ctermfg=NONE ctermbg=NONE cterm=NONE
"hi StatusLineNC ctermfg=NONE ctermbg=NONE cterm=NONE
"hi WildMenu ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Question ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Title ctermfg=NONE ctermbg=NONE cterm=NONE
"hi ModeMsg ctermfg=NONE ctermbg=NONE cterm=NONE
"hi MoreMsg ctermfg=NONE ctermbg=NONE cterm=NONE

" --------------
" - Visual aid -
" --------------
"hi MatchParen ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Visual ctermfg=NONE ctermbg=NONE cterm=NONE
"hi VisualNOS ctermfg=NONE ctermbg=NONE cterm=NONE
"hi NonText ctermfg=NONE ctermbg=NONE cterm=NONE

"hi Todo ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Underlined ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Error ctermfg=NONE ctermbg=NONE cterm=NONE
"hi ErrorMsg ctermfg=NONE ctermbg=NONE cterm=NONE
"hi WarningMsg ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Ignore ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpecialKey ctermfg=NONE ctermbg=NONE cterm=NONE

" --------------------------------
" Variable types
" --------------------------------
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE
"hi String ctermfg=NONE ctermbg=NONE cterm=NONE
"hi StringDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Character ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Number ctermfg=NONE ctermbg=NONE    cterm=NONE
"hi Boolean ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Float ctermfg=NONE ctermbg=NONE cterm=NONE

hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE
hi Function ctermfg=NONE ctermbg=NONE cterm=NONE

" --------------------------------
" Language constructs
" --------------------------------
hi Statement ctermfg=NONE ctermbg=NONE cterm=bold
"hi Conditional ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Repeat ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Label ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Operator ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Keyword ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Exception ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Comment ctermfg=NONE ctermbg=NONE cterm=NONE

hi Special ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpecialChar ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Tag ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Delimiter ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpecialComment ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Debug ctermfg=NONE ctermbg=NONE cterm=NONE

" ----------
" - C like -
" ----------
hi PreProc ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Include ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Define ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Macro ctermfg=NONE ctermbg=NONE cterm=NONE
"hi PreCondit ctermfg=NONE ctermbg=NONE cterm=NONE

hi Type ctermfg=NONE ctermbg=NONE cterm=NONE
"hi StorageClass ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Structure ctermfg=NONE ctermbg=NONE cterm=NONE
"hi Typedef ctermfg=NONE ctermbg=NONE cterm=NONE

" --------------------------------
" Diff
" --------------------------------
"hi DiffAdd ctermfg=NONE ctermbg=NONE cterm=NONE
"hi DiffChange ctermfg=NONE ctermbg=NONE cterm=NONE
"hi DiffDelete ctermfg=NONE ctermbg=NONE cterm=NONE
"hi DiffText ctermfg=NONE ctermbg=NONE cterm=NONE

" --------------------------------
" Completion menu
" --------------------------------
"hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE
"hi PmenuSel ctermfg=NONE ctermbg=NONE cterm=NONE
"hi PmenuSbar ctermfg=NONE ctermbg=NONE cterm=NONE
"hi PmenuThumb ctermfg=NONE ctermbg=NONE cterm=NONE

" --------------------------------
" Spelling
" --------------------------------
"hi SpellBad ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpellCap ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpellLocal ctermfg=NONE ctermbg=NONE cterm=NONE
"hi SpellRare ctermfg=NONE ctermbg=NONE cterm=NONE

"--------------------------------------------------------------------
" Specific settings                                                 |
"--------------------------------------------------------------------
