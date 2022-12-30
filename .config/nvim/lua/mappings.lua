local function map(mode, lhs, rhs, opts)
    local options = {noremap = true, silent = true}
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

map('n', '<leader>gb', ':Git blame<cr>')

map('n', '<leader>tn', ':tabnew<cr>')
map('n', '<leader>to', ':tabonly<cr>')
map('n', '<leader>tc', ':tabclose<cr>')
map('n', '<leader>tm', ':tabmove')

map('n', '<leader>v', ':vnew<cr>')
--XXXX
map("i", "jk", "<esc>", {})

----"nnoremap <silent> K <cmd>lua require('lspsaga.hover').render_hover_doc()<CR>
map('n', '<leader>ca', "<cmd>lua require('lspsaga.codeaction').code_action()<CR>", {})


-- nvim-tree
map('n', '<C-n>', ':NERDTreeToggle<cr>', {})


-- Telescope
--map('n', '<leader>fg', '<cmd>Telescope live_grep<cr>', {})
map("n", "<leader>fg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
map('n', '<leader>a', '<cmd>lua require(\'telescope.builtin\').grep_string({search = vim.fn.expand("<cword>")})<cr>', {})
map('n', '<C-p>', "<cmd>Telescope git_files<cr>", {})
--map('n', ';', ':Buffers<cr>', {})
map('n', ';', ':Telescope buffers<cr>', {})


-- compe
--map('i', '<C-space>', 'compe#complete()', { expr = true })
--map('i', '<CR>', 'compe#confirm("<CR>")', { expr = true })
--map('i', '<C-e>', 'compe#close("<C-e>")', { expr = true })

-- remap resizing split panes
map('n', '<C-h>', '<cmd>vertical resize -1<CR>', {})
map('n', '<C-l>', '<cmd>vertical resize +1<CR>', {})

--vim.cmd [[
--command! -bang -nargs=* GitGrep
--  \ call fzf#vim#ag(<q-args>,
--  \  fzf#vim#with_preview({
--  \    'options': '--no-hscroll --delimiter : --nth 4..',
--  \    'dir': systemlist('git rev-parse --show-toplevel')[0]},
--  \    'right:50%'
--  \  ),
--  \  <bang>0)
--]]
