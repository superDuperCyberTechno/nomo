" Name:       nomo
" License:    MIT

hi clear
if exists('syntax_on')
   syntax reset
endif

let g:colors_name = 'nomo'

if !exists('g:nomo_tint') || g:nomo_tint == 'gray'
  let s:lite  = ['#c6bfba', 248]
elseif g:nomo_tint == 'green'
  let s:lite  = ['#9fcc70', 40]
elseif g:nomo_tint == 'red'
  let s:lite  = ['#bf5454', 160]
elseif g:nomo_tint == 'blue'
  let s:lite  = ['#60b7db', 45]
elseif g:nomo_tint == 'yellow'
  let s:lite  = ['#d6bd5e', 220]
endif

let s:semi  = ['#494949', 240]
let s:dark  = ['#202020', 234]

function! s:hi(...)
  let group = a:1
  let fg    = get(a:, 2, s:lite)
  let bg    = get(a:, 3, s:dark)

  exec "hi " . group . " guifg=" . fg[0]
  exec "hi " . group . " ctermfg=" . fg[1]
  
  exec "hi " . group . " guibg=" . bg[0]
  exec "hi " . group . " ctermbg=" . bg[1]
  
  exec "hi " . group . " gui=none cterm=none"
endfunction

call map(split(execute('hi'),'\n'),'execute("hi ".split(v:val)[0]." NONE")')

" --- STYLING ------------------------------------------------------------

call s:hi('Normal')
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
call s:hi('TermCursor', s:dark, s:lite)
call s:hi('TermCursorNC', s:dark, s:semi)

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
  \ 'hl':      ['fg', 'Search'],
  \ 'fg+':     ['fg', 'CursorLine'],
  \ 'bg+':     ['bg', 'Normal'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'CursorLine'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

set background=dark
