if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-endwise'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'raimondi/delimitmate'
Plug 'w0rp/ale'
Plug 'tpope/vim-fugitive'
call plug#end()

syntax enable
filetype plugin indent on
colorscheme elflord

set tabstop=4
set softtabstop=4
set expandtab

" Visual options
set showcmd
set cursorline
set wildmenu
set lazyredraw

" Set hybrid line numbers
:set number relativenumber

augroup numbertoggle
        autocmd!
        autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
        autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Search options
set showmatch
set incsearch
set hlsearch
set smartcase

" Mapleader is comma
let mapleader=","

" Remap leader space to clear search, space does nothing
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <space> <nop>

" Move down by visual line, not actual line
nnoremap j gj
nnoremap k gk

" Open line without entering insert mode
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>

" ESC remap
inoremap jk <esc>
inoremap kj <esc>

" Window remaps
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l
nnoremap <C-k> <C-w>k

" Tab remaps
nnoremap <leader>t :tabnew<CR>
nnoremap <leader>w :tabclose<CR>

" FZF remaps
nnoremap <leader>p :FZF<CR>

"Airline
let g:airline#extensions#ale#enabled=1

" NerdTree remaps
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <leader>f :NERDTreeFind<CR>

let NERDTreeAutoDeleteBuffer = 1
let NERDTreeQuitOnOpen = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

augroup nerdtree
        autocmd!

        " Start NERDTree when Vim is started without file arguments.
        autocmd StdinReadPre * let s:std_in=1
        autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif

        " Exit Vim if NERDTree is the only window left.
        autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif
augroup END

" ALE
let g:ale_lint_on_text_changed=0
let g:ale_lint_on_save=1

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ruby': ['rubocop'],
\}

nnoremap <leader>aj :ALENextWrap<CR>
nnoremap <leader>ak :ALEPreviousWrap<CR>

" Functions
function! <SID>StripTrailingWhitespaces()
        " save last search & cursor position
        let _s=@/
        let l = line(".")
        let c = col(".")
        %s/\s\+$//e
        let @/=_s
        call cursor(l, c)
endfunction

augroup configgroup
autocmd BufWritePre *.php,*.py,*.js,*.txt,*.hs,*.java,*.md,*.rb
          \:call <SID>StripTrailingWhitespaces()
augroup END
