" To be linked to ~/.config/nvim/after/syntax/javascript.vim
" https://maximewack.com/post/emulating_ligatures/
" https://maximewack.com/post/tricking_ligatures/
syntax match arrow "=>" conceal cchar=→
syntax match eq "===" conceal cchar=≣
syntax match neq "!=" conceal cchar=≠
syntax match gteq ">=" conceal cchar=≥
syntax match lteq "<=" conceal cchar=≤


" Trick the concealer:
" syntax match pipe1 contained "%" conceal cchar=| containedin=pipe
" syntax match pipe2 contained ">%" conceal cchar=> containedin=pipe
" syntax match pipe "%>%" contains=pipe1,pipe2
