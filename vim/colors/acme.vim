" `jji.vim` with acme (http://acme.cat-v.org/) colors for the foreground,
" background and status bars.

highlight clear
if exists("syntax_on")
  syntax reset
endif

runtime colors/jji.vim

let g:colors_name = "acme"

highlight clear Normal
highlight clear NonText
highlight clear StatusLine
highlight clear StatusLineNC
highlight clear WildMenu
highlight clear VertSplit
highlight clear Visual
highlight clear ColorColumn

highlight! Normal guibg=#ffffea guifg=#000000
highlight! NonText guibg=bg guifg=#ffffea
highlight! StatusLine guibg=#aeeeee guifg=#000000 gui=NONE
highlight! StatusLineNC guibg=#eaffff guifg=#000000 gui=NONE
highlight! WildMenu guibg=#000000 guifg=#eaffff gui=NONE
highlight! VertSplit guibg=#ffffea guifg=#000000 gui=NONE
highlight! Visual guibg=fg guifg=bg
highlight! ColorColumn guifg=NONE guibg=#eaffff
