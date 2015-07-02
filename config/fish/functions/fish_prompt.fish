function fish_prompt --description 'Write out the left prompt'
    set_color $fish_color_cwd
    printf "%s " (prompt_pwd)
    set_color normal
end
