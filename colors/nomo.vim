" Name:       nomo
" License:    MIT

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'nomo'

if !exists('g:nomo_tint') || g:nomo_tint == 'white'
  let s:lite  = ['#e2e2e2', 254]
elseif g:nomo_tint == 'green'
  let s:lite  = ['#85f762', 254]
elseif g:nomo_tint == 'red'
  let s:lite  = ['#d65151', 254]
elseif g:nomo_tint == 'blue'
  let s:lite  = ['#70d6ff', 254]
elseif g:nomo_tint == 'yellow'
  let s:lite  = ['#ffff70', 254]
endif

let s:dark  = ['#222222', 234]
let s:semi  = ['#494949', 240]

let s:default_fg = s:lite
let s:default_bg = s:dark

let s:default_lst = []
let s:default_str = ''

function! s:hi(...)
    let group = a:1
    let fg    = get(a:, 2, s:default_fg)
    let bg    = get(a:, 3, s:default_bg)

    let cmd = ['hi', group]

    if fg != s:default_lst
        call add(cmd, 'guifg='.fg[0])
        call add(cmd, 'ctermfg='.fg[1])
    endif

    if bg != s:default_lst
        call add(cmd, 'guibg='.bg[0])
        call add(cmd, 'ctermbg='.bg[1])
    endif

    call add(cmd, 'gui=NONE')
    call add(cmd, 'cterm=NONE')

    exec join(cmd, ' ')
endfunction

" --- STYLING ------------------------------------------------------------

call s:hi('Normal')
"call s:hi('NormalNC', s:semi)
call s:hi('Cursor', s:dark, s:lite)
call s:hi('ColorColumn')
call s:hi('Search', s:dark, s:lite)
call s:hi('Visual', s:dark, s:lite)
call s:hi('ErrorMsg')
call s:hi('WarningMsg')
call s:hi('NonText', s:dark, s:dark)
call s:hi('Folded')
call s:hi('Question')
call s:hi('MoreMsg')
call s:hi('Underlined')
call s:hi('Todo', s:dark, s:lite)
call s:hi('Search', s:lite, s:semi)
call s:hi('SearchCurrent', s:dark, s:lite)
call s:hi('CursorLineNr', s:lite, s:semi)
call s:hi('CursorLine', s:lite, s:semi)

call s:hi('Sneak', s:dark, s:lite)
call s:hi('SneakScope', s:dark, s:lite)
call s:hi('SneakLabel', s:dark, s:lite)
call s:hi('SneakLabelMask', s:dark, s:dark)

call s:hi('fzf1')
call s:hi('fzf2')
call s:hi('fzf3')

call s:hi('Title', s:semi)
call s:hi('TabLine', s:semi)
call s:hi('TabLineFill')
call s:hi('TabLineSel')

call s:hi('StatusLine')
call s:hi('StatusLineNC', s:semi)
call s:hi('VertSplit', s:semi)

call s:hi('LineNr', s:semi)
call s:hi('WildMenu', s:dark, s:lite)

call s:hi('Pmenu', s:dark, s:lite)
call s:hi('PmenuSel')

call s:hi('ALEErrorSign')
call s:hi('ALEWarningSign')
call s:hi('SpellBad')
call s:hi('SpellCap')
call s:hi('SpecialKey', s:semi)
call s:hi('Directory')

call s:hi('SignColumn')
call s:hi("SignifySignAdd")
call s:hi("SignifySignChange")
call s:hi("SignifySignChangeDelete")
call s:hi("SignifySignDelete")

call s:hi("htmlLink")
call s:hi("htmlTitle")
call s:hi("htmlH1")

call s:hi('Statement')
call s:hi('PreProc')
call s:hi('String')
call s:hi('Comment', s:semi)
call s:hi('Constant')
call s:hi('Type')
call s:hi('Function')
call s:hi('Identifier')
call s:hi('Special')
call s:hi('MatchParen', s:semi)

let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }
