vim.cmd[[filetype plugin indent on]]


vim.cmd [[
  autocmd BufWritePre *.js lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  autocmd BufWritePre *.tsx lua vim.lsp.buf.formatting_seq_sync(nil, 1000)
  autocmd BufWritePre *.ts lua vim.lsp.buf.formatting_seq_sync(nil, 1000)

  highlight GitSignsAddLn guibg=#99FF99 guifg=black
  highlight GitSignsAddLn guifg=black
  highlight GitSignsChangeLn guibg=#eeff99 guifg=black
  highlight GitSignsChangeLn guifg=black
  highlight GitSignsDeleteLn guibg=#FFAAAA guifg=black
  highlight GitSignsDeleteLn guifg=black
]]
