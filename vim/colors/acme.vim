" `jji.vim` with acme (http://acme.cat-v.org/) colors for the foreground,
" background and status bars.

highlight clear
if exists("syntax_on")
  syntax reset
endif

runtime colors/jji.vim

let g:colors_name = "acme"

highlight clear StatusLine
highlight clear StatusLineNC
highlight clear WildMenu
highlight clear VertSplit
highlight clear Visual
highlight clear ColorColumn

highlight! StatusLine ctermbg=Blue ctermfg=White cterm=NONE
highlight! StatusLineNC ctermbg=Blue ctermfg=White cterm=NONE
highlight! WildMenu ctermbg=Black ctermfg=White cterm=NONE
highlight! Visual ctermbg=Black ctermfg=White
highlight! ColorColumn ctermfg=NONE ctermbg=LightGray
