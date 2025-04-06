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

let s:bg0     = '#000000'
let s:bg1     = '#1A1A1A'
let s:bg2     = '#0f172a'
let s:fg0     = '#f8fafc'
let s:fg1     = '#e2e8f0'
let s:fg2     = '#94a3b8'
let s:blue0   = '#0000ff'
let s:blue1   = '#2563eb'
let s:blue2   = '#1e3a8a'
let s:gray0   = '#808080'
let s:green0  = '#22c55e'
let s:green1  = '#91AE4E'
let s:green2  = '#839D48'
let s:cyan0   = '#22d3ee'
let s:teal0   = '#14b8a6'
let s:teal1   = '#5FAA9C'
let s:emerald0 = '#92FFB8'
let s:emerald1 = '#34d399'
let s:yellow0 = '#fde047'
let s:red0    = '#ef4444'

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
hi Character guifg=#34d399
hi Number guifg=#839D48
hi Boolean guifg=#839D48
hi Float guifg=#839D48
hi Function guifg=#91AE4E
hi Identifier guifg=#e2e8f0
hi Statement guifg=#e2e8f0
hi Conditional guifg=#e2e8f0
hi Repeat guifg=#e2e8f0
hi Label guifg=#e2e8f0
hi Operator guifg=#e2e8f0
hi Keyword guifg=#e2e8f0
hi Exception guifg=#e2e8f0
hi Type guifg=#839D48
hi StorageClass guifg=#839D48
hi Structure guifg=#839D48
hi Typedef guifg=#839D48
hi Special guifg=#839D48
hi SpecialChar guifg=#92FFB8
hi Tag guifg=#e2e8f0
hi Delimiter guifg=#e2e8f0
hi SpecialComment guifg=#808080 gui=italic
hi Debug guifg=#e2e8f0
hi PreProc guifg=#e2e8f0
hi PreCondit guifg=#e2e8f0
hi Include guifg=#e2e8f0
hi Define guifg=#e2e8f0
hi Macro guifg=#e2e8f0
hi Constant guifg=#839D48

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

let g:terminal_ansi_colors = [
\ s:bg0, s:red0, s:green0, s:yellow0,
\ s:blue0, s:blue2, s:cyan0, s:fg0,
\ s:bg1, s:red0, s:green0, s:yellow0,
\ s:blue0, s:blue2, s:cyan0, s:fg1
\ ] 
