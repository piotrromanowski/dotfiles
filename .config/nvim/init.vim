" -----------------------------------------------------------------------
" NeoVim Config
" Make sure to first download plugged
"   curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then run :PlugInstall
" -----------------------------------------------------------------------

let mapleader = ","
"set spell spelllang=en_us
"setlocal spell spelllang=us

" Useful mappings for managing tabs:
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove

" Map leader c to clear current search
nnoremap <leader>c :nohl<CR>

" http://neovim.io/doc/user/nvim_terminal_emulator.html
tnoremap jk <C-\><C-n>

call plug#begin('~/.config/nvim/plugged')

Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'scrooloose/nerdtree'
Plug 'airblade/vim-gitgutter'
Plug 'ntpeters/vim-better-whitespace'
Plug 'junegunn/vim-easy-align'
Plug 'mtth/scratch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'
Plug 'qpkorr/vim-bufkill'
Plug 'andymass/vim-matchup'
Plug 'machakann/vim-highlightedyank'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'sainnhe/sonokai' "treesitter-supported-color

" Color themes
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'

Plug 'dikiaap/minimalist'
Plug 'MaxSt/FlatColor'
Plug 'justinmk/molokai'
Plug 'Anthony25/gnome-terminal-colors-solarized'
Plug 'vim-scripts/AtelierDune'
Plug 'scheakur/vim-scheakur'
Plug 'chriskempson/base16-vim'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'
Plug 'google/vim-colorscheme-primary'
Plug 'rakr/vim-one'
Plug 'altercation/vim-colors-solarized'
Plug 'NLKNguyen/papercolor-theme'
Plug 'fatih/molokai'

Plug 'reasonml-editor/vim-reason-plus'
Plug 'tomlion/vim-solidity'
Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'sk1418/Join'
Plug 'dart-lang/dart-vim-plugin'
Plug 'uarun/vim-protobuf'
Plug 'chrisbra/csv.vim'

Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}


Plug 'google/vim-maktaba'
Plug 'google/vim-codefmt'
Plug 'google/vim-glaive'

" LSPS
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
"Plug 'nvim-lua/completion-nvim'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'


Plug 'rust-lang/rust.vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go'
Plug 'SirVer/ultisnips'

call plug#end()

luafile ~/.config/nvim/compe-config.lua
luafile ~/.config/nvim/lsp-config.lua


autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end


lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"go", "python"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { "c", "rust" },  -- list of language that will be disabled
  },
}
EOF

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set relativenumber
set number
"set mouse=c " turn off mouse
set mouse=a
set expandtab tabstop=2 shiftwidth=2 softtabstop=2

" remap esc to jk
inoremap jk      <esc>
inoremap <esc>   <NOP>

:command W w
:command Q q
:command WQ wq

"NerdTree toggle using Ctrl-n
map <silent> <C-n> :NERDTreeToggle<CR>

au VimEnter * ToggleStripWhitespaceOnSave

" http://stackoverflow.com/questions/607435/why-does-vim-save-files-with-a-extension
set nobackup
set noswapfile
set nowritebackup

" turn off code folding
set foldlevelstart=99

let &colorcolumn=81
"highlight ColorColumn ctermbg=235 guibg=#2c2d27


syntax enable
let g:solarized_termcolors=256
"set bg=light
"colorscheme solarized

function! SetupPython()
      " Here, you can have the final say on what is set.  So
      "     " fixup any settings you don't like.
  setlocal softtabstop=2
  setlocal tabstop=2
  setlocal shiftwidth=2
endfunction
command! -bar SetupPython call SetupPython()


" Python
let python_highlight_all = 1
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python map <buffer> F :set foldmethod=indent<cr>

au FileType python inoremap <buffer> $r return
au FileType python inoremap <buffer> $i import
au FileType python inoremap <buffer> $p print
au FileType python inoremap <buffer> $f #--- <esc>a
au FileType python map <buffer> <leader>1 /class
au FileType python map <buffer> <leader>2 /def
au FileType python map <buffer> <leader>C ?class
au FileType python map <buffer> <leader>D ?def
au FileType python set cindent
au FileType python set cinkeys-=0#
au FileType python set indentkeys-=0#

" open directory of current file
nmap ' :e %:h<CR>
" cd to current open file
nmap \ :cd %:p:h<CR>

" show current buffers
nmap ; :Buffers<CR>
map <silent> <C-g> :Gstatus<CR>

" Map Ctrlp to Ag, use either GitFiles or Files
map <silent> <C-p> :GF<CR>
"map <silent> <C-p> :Files<CR>
" Greps the current word under the cursor
noremap <leader>a :Ag <C-r>=expand('<cword>')<CR><CR>

let base16colorspace=256
colorscheme base16-material-palenight


" Tabs Colors
:hi TabLineSel ctermfg=White ctermbg=Blue
" set list listchars=tab:>>,eol:$,trail:-
highlight NonText ctermfg=Blue guifg=gray
set guicursor=

" Delete trailing whitespace
let g:strip_whitespace_on_save = 1

" autoformat Rust
let g:rustfmt_autosave = 1

" Preview %s changes as you're making them
set inccommand=nosplit

" Preview Files when using :Ag
command! -bang -nargs=* Ag
\ call fzf#vim#ag(<q-args>,
\                 <bang>fzf#vim#with_preview('right:50%'),
\                 <bang>0)

" Toggle paste mode
nmap <silent> <leader>p :set invpaste<CR>:set paste?<CR>

" Toggle case sensitive search
nmap <silent> <leader>c :set invignorecase<CR>

" Greps the current word under the cursor
noremap <leader>a :Ag <C-r>=expand('<cword>')<CR><CR>

" remap resizing split panes
noremap <C-h> :vertical resize -1<CR>
noremap <C-l> :vertical resize +1<CR>

" underline the current line that you're at
set cursorline
hi clear CursorLine
hi CursorLine gui=underline cterm=underline


au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" Autoformatting
call glaive#Install()
Glaive codefmt google_java_executable="java -jar /usr/local/lib/google-java-format-1.8-all-deps.jar"
augroup autoformat_settings
  autocmd FileType html,css,sass,scss,less,json AutoFormatBuffer js-beautify
  autocmd FileType typescript AutoFormatBuffer prettier
  autocmd FileType typescript.tsx AutoFormatBuffer prettier
  autocmd FileType javascript AutoFormatBuffer prettier
  "autocmd BufWritePre *.py 0,$!myyapf
  " autocmd FileType java AutoFormatBuffer google-java-format
augroup END


let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1


" Underline instead of highlight words
hi clear SpellBad
hi SpellBad cterm=underline


set laststatus=2                " always show statusbar
set statusline+=%F\             " filename
set statusline+=%=              " right align remainder
set statusline+=%-14(%l,%c%V%)  " line, character
set statusline+=%<%P            " file position

set cmdheight=1

" nvim lsp
" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-k> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-n> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-p> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
