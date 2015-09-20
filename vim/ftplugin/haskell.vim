function! FormatHaskell()
    if !empty(v:char)
        return 1
    else
        let l:filter = "hindent --style gibiansky"
        let l:command = v:lnum.','.(v:lnum+v:count-1).'!'.l:filter
        execute l:command
    endif
endfunction
setlocal formatexpr=FormatHaskell()

let g:haskellmode_completion_ghc = 0
setlocal ts=2
setlocal omnifunc=necoghc#omnifunc
map <buffer> <silent> <localleader>t<cr> :HdevtoolsType
map <buffer> <silent> <localleader>c<cr> :HdevtoolsClear
