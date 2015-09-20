setlocal ts=2

if executable('opam') && executable('ocamlmerlin') && has('python')
    let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
    execute "set rtp+=" . g:opamshare . "/merlin/vim"
    execute "helptags " . g:opamshare . "/merlin/vim/doc"
    let g:syntastic_ocaml_checkers = ['merlin']
endif
