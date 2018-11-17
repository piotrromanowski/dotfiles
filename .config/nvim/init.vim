" -----------------------------------------------------------------------
" NeoVim Config
" Make sure to first download plugged
"   curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
" Then run :PlugInstall
" -----------------------------------------------------------------------

let mapleader = ","
set spell spelllang=en_us

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
"Plug 'terryma/vim-multiple-cursors'
"Plug 'vim-airline/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/vim-easy-align'
"Plug 'godlygeek/tabular'
Plug 'morhetz/gruvbox'
Plug 'mtth/scratch.vim'
Plug 'easymotion/vim-easymotion'
Plug 'alvan/vim-closetag'
Plug 'qpkorr/vim-bufkill'

" Color themes
Plug 'dikiaap/minimalist'
Plug 'MaxSt/FlatColor'
Plug 'justinmk/molokai'
Plug 'Anthony25/gnome-terminal-colors-solarized'
Plug 'vim-scripts/AtelierDune'
Plug 'scheakur/vim-scheakur'
Plug 'chriskempson/base16-vim'
Plug 'sickill/vim-monokai'
Plug 'morhetz/gruvbox'

Plug 'derekwyatt/vim-scala'
Plug 'pangloss/vim-javascript'
Plug 'kchmck/vim-coffee-script'
Plug 'mtscout6/vim-cjsx'
Plug 'leafgarland/typescript-vim'
Plug 'mxw/vim-jsx'
Plug 'sk1418/Join'
Plug 'dart-lang/dart-vim-plugin'

Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
Plug 'zchee/deoplete-go', { 'do': 'make'}
Plug 'nsf/gocode', {'rtp': 'vim/'}
Plug 'fatih/vim-go'

call plug#end()

let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif
" let g:deoplete#disable_auto_complete = 1
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

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

set relativenumber
set number
"set mouse=c " turn off mouse
set mouse=a
set expandtab tabstop=2 shiftwidth=2 softtabstop=2

set list " show whitespace

" unmap arrow keys
inoremap <Left>  <NOP>
inoremap <Right> <NOP>
inoremap <Up>    <NOP>
inoremap <Down>  <NOP>
nnoremap <Left>  <NOP>
nnoremap <Right> <NOP>
nnoremap <Up>    <NOP>
nnoremap <Down>  <NOP>

" remap esc to jk
inoremap jk      <esc>
inoremap <esc>   <NOP>

:command W w
:command Q q
:command WQ wq

"NerdTree toggle using Ctrl-n
map <silent> <C-n> :NERDTreeToggle<CR>

au VimEnter * ToggleStripWhitespaceOnSave

" Multiple Cursors remapped
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_quit_key='q'
let g:multi_cursor_insert_maps={'j':1}

" Turn of Syntastic by default
" autocmd VimEnter * SyntasticToggleMode

" http://stackoverflow.com/questions/607435/why-does-vim-save-files-with-a-extension
set nobackup
set noswapfile
set nowritebackup

" turn off code folding
set foldlevelstart=99

let &colorcolumn=81
"highlight ColorColumn ctermbg=235 guibg=#2c2d27

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:NERDTreeWinPos = "right"
let NERDTreeShowHidden=0
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let g:NERDTreeWinSize=35
map <silent> <C-n> :NERDTreeToggle<CR>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>


" => vim-multiple-cursors
let g:multi_cursor_next_key='<C-m>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_exit_from_insert_mode=0
let g:multi_cursor_quit_key='q'
let g:multi_cursor_insert_maps={'j':1}



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

" -----------------------------------------------------------------------
" --------------------------Vim Color Stuff -----------------------------
" -----------------------------------------------------------------------
"
"colorscheme solarized
"colorscheme molokai
"colorscheme jellybeans
let g:airline_theme='vice'
"colorscheme peaksea

nmap ; :Buffers<CR>
map <silent> <C-g> :Gstatus<CR>

" Map Ctrlp to Ag, use either GitFiles or Files
map <silent> <C-p> :GF<CR>
"map <silent> <C-p> :Files<CR>

"let g:solarized_termcolors=256
"colorscheme solarized

" let base16colorspace=256
" colorscheme base16-tomorrow-night
" colorscheme molokai

set bg=dark
colorscheme gruvbox

" Tabs Colors
:hi TabLineSel ctermfg=White ctermbg=Blue
" set list listchars=tab:>>,eol:$,trail:-
highlight NonText ctermfg=Blue guifg=gray
set guicursor=

" Underline instead of highlight words
hi clear SpellBad
hi SpellBad cterm=underline

" Delete trailing whitespace
let g:strip_whitespace_on_save = 1

" Preview %s changes as you're making them
set inccommand=nosplit


" Preview Files when using :Ag
command! -bang -nargs=* Ag                                                                                                                                                                                                              
\ call fzf#vim#ag(<q-args>,                                                                                                                                                                                                           
\                 <bang>fzf#vim#with_preview('right:50%'),                                                                                                                                                                            
\                 <bang>0) 
