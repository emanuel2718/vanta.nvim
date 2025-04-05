if exists('g:colors_name')
  hi clear
endif

if exists('syntax_on')
  syntax reset
endif

set termguicolors

let g:colors_name = 'vanta'

lua << EOF
if vim.g.vanta_config ~= nil then
  require('vanta').setup(vim.g.vanta_config)
end
require('vanta').load()
EOF 
