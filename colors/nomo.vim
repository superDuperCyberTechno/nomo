" Vim color scheme
"
" Name:       nomo
" License:    MIT

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'nomo'

let s:white  = ['#e2e2e2', 15]
let s:black  = ['#222222', 16]
let s:gray  = ['#606060', 16]
let s:blue  = ['#20bbfc', 67]

let s:default_fg = s:white
let s:default_bg = s:black

let s:none = 'NONE'

let s:default_lst = []
let s:default_str = ''

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)
    let attr  = get(a:, 4, s:none)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    if attr != s:default_str
        call add(cmd, 'gui='.attr)
        call add(cmd, 'cterm='.attr)
    endif

    exec join(cmd, ' ')
endfunction


" --- STYLING ------------------------------------------------------------
call s:hi('Normal')
call s:hi('Cursor', s:black, s:white)
call s:hi('ColorColumn')
call s:hi('Search', s:black, s:white)
call s:hi('Visual', s:black, s:white)
call s:hi('ErrorMsg')
call s:hi('NonText', s:black, s:black)
call s:hi('Folded')

call s:hi('Title', s:gray)
call s:hi('TabLine', s:gray)
call s:hi('TabLineFill')
call s:hi('TabLineSel')

call s:hi('StatusLine')
call s:hi('StatusLineNC', s:gray)
call s:hi('VertSplit', s:gray)

call s:hi('LineNr', s:gray)
call s:hi('WildMenu')

call s:hi('Pmenu', s:black, s:white)
call s:hi('PmenuSel')

call s:hi('ALEErrorSign')
call s:hi('ALEWarningSign')
call s:hi('SpecialKey', s:gray)
call s:hi('Directory')

call s:hi('SignColumn')
call s:hi("SignifySignAdd")
call s:hi("SignifySignChange")
call s:hi("SignifySignChangeDelete")
call s:hi("SignifySignDelete")

call s:hi('Statement')
call s:hi('PreProc')
call s:hi('String')
call s:hi('Comment', s:gray)
call s:hi('Constant')
call s:hi('Type')
call s:hi('Function')
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:gray)
