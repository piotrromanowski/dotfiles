local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>to', ':tabonly<cr>')
map('n', '<leader>tc', ':tabclose<cr>')
map('n', '<leader>tm', ':tabmove')

map('n', '<leader>v', ':vnew<cr>')

map("i", "jk", "<esc>", {})
map("v", "jk", "<esc>", {})
map("t", "jk", "<esc>", {})

map('n', 'K', "<Cmd>lua vim.lsp.buf.hover()<cr>")

-- lsp setup
map('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', {})
map('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', {})
map('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', {})
map('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', {})
map('n', 'K', '<cmd>lua vim.lsp.buf.hover()<CR>', {})
map('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', {})
map('n', '<C-n>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', {})
--"nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
----" nvim lsp saga
----"nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
map('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {})


-- nvim-tree
map('n', '<C-n>', ':NERDTreeToggle<cr>', {})


-- Telescope
map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
map('n', '<leader>a', '<cmd>lua require(\'telescope.builtin\').grep_string({search = vim.fn.expand("<cword>")})<cr>', {})
map('n', '<C-p>', "<cmd>Telescope git_files<cr>", {})
--map('n', ';', ':Buffers<cr>', {})
map('n', ';', ':Telescope buffers<cr>', {})


-- compe
map('i', '<C-space>', 'compe#complete()', { expr = true })
map('i', '<CR>', 'compe#confirm("<CR>")', { expr = true })
map('i', '<C-e>', 'compe#close("<C-e>")', { expr = true })
