vim.cmd[[filetype plugin indent on]]


vim.cmd [[
  highlight GitSignsAddLn guibg=#99FF99 guifg=black
  highlight GitSignsAddLn guifg=black
  highlight GitSignsChangeLn guibg=#eeff99 guifg=black
  highlight GitSignsChangeLn guifg=black
  highlight GitSignsDeleteLn guibg=#FFAAAA guifg=black
  highlight GitSignsDeleteLn guifg=black

  hi VertSplit ctermbg=none gui=none

  autocmd BufWritePre *.go lua vim.lsp.buf.format(nil, 1000)
  autocmd BufWritePre *.libsonnet lua vim.lsp.buf.format(nil, 1000)
]]
