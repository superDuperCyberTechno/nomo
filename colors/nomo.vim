" Name:       nomo
" License:    MIT

hi clear
if exists('syntax_on')
    syntax reset
endif

"hi, my name is:
let g:colors_name = 'nomo'

" this is the random number generator. turns out it's not random at all. get over it.
if exists('g:nomo_color') && g:nomo_color == 'random'
    let nomo_colors = ["white", "green", "red", "blue", "yellow"]
    let random_index = strftime("%S") % 5
    let g:nomo_color = nomo_colors[random_index]
endif

" check what color the user selected and let's get paintin' boys
if !exists('g:nomo_color') || g:nomo_color == 'white'
    let s:lite  = ['#c6bfba', 248]
elseif g:nomo_color == 'green'
    let s:lite  = ['#9cd363', 40]
elseif g:nomo_color == 'red'
    let s:lite  = ['#f26363', 160]
elseif g:nomo_color == 'blue'
    let s:lite  = ['#60b7db', 45]
elseif g:nomo_color == 'yellow'
    let s:lite  = ['#d6bd5e', 220]
endif

" static colors, easy and clean
let s:semi  = ['#424242', 240]
let s:dark  = ['#202020', 234]
let s:none =  ['NONE', 'NONE']

" the painting function to make it less insane to color shit
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
call s:hi('CursorLineNr', s:lite, s:semi)
call s:hi('CursorLine', s:lite, s:semi)
call s:hi('TermCursor', s:dark, s:lite)
call s:hi('TermCursorNC', s:dark, s:semi)

call s:hi('fzf1')
call s:hi('fzf2')
call s:hi('fzf3')

call s:hi('Sneak', s:dark, s:lite)
call s:hi('SneakScope', s:dark, s:lite)
call s:hi('SneakLabel', s:dark, s:lite)
call s:hi('SneakLabelMask', s:dark, s:dark)

call s:hi('Title', s:semi)
call s:hi('TabLine', s:semi)
call s:hi('TabLineFill')
call s:hi('TabLineSel')

call s:hi('StatusLine')
call s:hi('StatusLineNC', s:semi)
call s:hi('VertSplit', s:semi)

call s:hi('LineNr', s:semi)
call s:hi('WildMenu', s:dark, s:lite)

call s:hi('Pmenu', s:lite, s:semi)
call s:hi('PmenuSel', s:dark, s:lite)

call s:hi('ALEErrorSignLineNr', s:none, s:none)
call s:hi('ALEWarningLineNr', s:none, s:none)
call s:hi('ALEInfoLineNr', s:none, s:none)
call s:hi('ALEStyleErrorLineNr', s:none, s:none)
call s:hi('ALEStyleWarningLineNr', s:none, s:none)
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
call s:hi("htmlBold")
call s:hi("htmlBoldItalic")
call s:hi("htmlBoldUnderline")
call s:hi("htmlUnderlineItalic")
call s:hi("htmlUnderline")
call s:hi("htmlBoldUnderlineItalic")
call s:hi("htmlStrike")
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
call s:hi('MatchParen', s:lite, s:semi)

" fzf support because that plugin is one of the good guys
let g:fzf_colors = {
            \ 'fg':      ['fg', 'Comment'],
            \ 'bg':      ['bg', 'Normal'],
            \ 'hl':      ['fg', 'Normal'],
            \ 'fg+':     ['fg', 'Normal'],
            \ 'bg+':     ['bg', 'Normal'],
            \ 'hl+':     ['fg', 'Normal'],
            \ 'info':    ['fg', 'Normal'],
            \ 'border':  ['fg', 'Normal'],
            \ 'prompt':  ['fg', 'Normal'],
            \ 'pointer': ['fg', 'Normal'],
            \ 'marker':  ['fg', 'Normal'],
            \ 'spinner': ['fg', 'Normal'],
            \ 'header':  ['fg', 'Normal'] }

" terminal color customization. this shit is a pain in the fucking ass to get right so it's a work in progress
let g:terminal_color_0  = s:dark[0] "emphasis fg
let g:terminal_color_1  = s:dark[0] "warning bg
let g:terminal_color_2  = s:lite[0]
let g:terminal_color_3  = s:lite[0]
let g:terminal_color_4  = s:lite[0]
let g:terminal_color_5  = s:lite[0]
let g:terminal_color_6  = s:semi[0] "emphasis bg
let g:terminal_color_7  = s:lite[0] "warning fg
let g:terminal_color_8  = s:dark[0] "notice bg?
let g:terminal_color_9  = s:lite[0]
let g:terminal_color_10 = s:lite[0]
let g:terminal_color_11 = s:lite[0]
let g:terminal_color_12 = s:lite[0]
let g:terminal_color_13 = s:lite[0]
let g:terminal_color_14 = s:lite[0]
let g:terminal_color_15 = s:lite[0]

set background=dark
