local nvim_lsp = require('lspconfig')
-- vim.lsp.set_log_level("debug")
-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
  local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  --Enable completion triggered by <c-x><c-o>
  buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  local opts = { noremap=true, silent=true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
  buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
  buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
  buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
  buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
  buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
  buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
  buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
  buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
  buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
  buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
  buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
  buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
  buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
  buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting_seq_sync()<CR>", opts)

end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "jsonnet_ls", "pyright", "rust_analyzer", "tsserver", "gopls", "bashls" }

local serverFileTypes = {
  jsonnet_ls = { 'jsonnet', 'libsonnet' },
  pyright = { 'python' },
  rust_analyzer = { 'rust' },
  tsserver = {
      'javascript',
      'javascriptreact',
      'javascript.jsx',
      'typescript',
      'typescriptreact',
      'typescript.tsx',
  },
  gopls = { 'go', 'gomod', 'gotmpl' },
  bashls = { 'sh' },
}

for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup {
    on_attach = on_attach,
    filetypes = serverFileTypes[lsp],
    flags = {
      debounce_text_changes = 150,
    }
  }
end

nvim_lsp["tsserver"].setup({
    on_attach = on_attach,
    filetypes = serverFileTypes["tsserver"],
    flags = {
      debounce_text_changes = 150,
    },
    cmd = {
      "typescript-language-server",
      "--stdio",
      "--tsserver-path",
      "/nix/store/lgcap3wqz0zbwgdzhlfclni69w0jb9rj-typescript-4.6.4/lib/node_modules/typescript/lib/"
    }
})

local go = {formatCommand = "gofmt", formatStdin = true}
local python = {formatCommand = "yapf --quiet", formatStdin = true}
local prettier = {
    formatCommand = "/home/promanowski/.nvm/versions/node/v12.22.7/bin/prettier --stdin-filepath ${INPUT}",
    formatStdin = true
}
local lua = {formatCommand = "lua-format -i", formatStdin = true}

local languages = {
    --go = {go},
    --lua = {lua},
    --python = {python},
    javascript = {prettier},
    javascriptreact = {prettier},
    --typescript = {prettier},
    --typescriptreact = {prettier}
}

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

nvim_lsp.efm.setup({
    init_options = {documentFormatting = true},
    filetypes = vim.tbl_keys(languages),
    settings = {
      rootMarkers = {".git/"},
      languages = languages
    },
    capabilities = capabilities,
})
