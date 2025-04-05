if exists('g:colors_name')
  hi clear
endif

if exists('syntax_on')
  syntax reset
endif

let g:colors_name = 'vanta'

if has('nvim-0.8')
  lua require('vanta').load()
  finish
endif

set termguicolors

hi Normal guifg=#f8fafc guibg=#000000

hi Comment guifg=#808080 gui=italic
hi CursorLine guibg=#0f172a
hi CursorLineNr guifg=#92FFB8
hi Visual guibg=#0000ff guifg=#f8fafc

hi Search guifg=#000000 guibg=#14b8a6
hi IncSearch guifg=#000000 guibg=#0000ff

hi StatusLine guifg=#f8fafc guibg=#0000ff
hi StatusLineNC guifg=#000000 guibg=#94a3b8

hi String guifg=#92FFB8
hi Number guifg=#839D48
hi Function guifg=#91AE4E
hi Identifier guifg=#e2e8f0
hi Statement guifg=#e2e8f0
hi Type guifg=#839D48
hi Special guifg=#839D48

hi DiffAdd guibg=#22c55e
hi DiffChange guibg=#22d3ee
hi DiffDelete guibg=#ef4444
hi DiffText guibg=#fde047 guifg=#000000

hi LineNr guifg=#808080
hi Directory guifg=#5FAA9C
hi FoldColumn guifg=#94a3b8
hi Folded guifg=#94a3b8 guibg=#1A1A1A gui=italic

hi Pmenu guifg=#f8fafc guibg=#000000
hi PmenuSel guifg=#f8fafc guibg=#0000ff gui=bold
hi PmenuSbar guibg=#1A1A1A
hi PmenuThumb guibg=#94a3b8 
