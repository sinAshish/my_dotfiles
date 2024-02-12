"  (N)Vim Configuration File

" vim  : place in $HOME/.vimrc
" nvim : place in $HOME/.config/nvim/init.vim
" General settings
" ---------------------------------------------------------------------------
" drop vi support - kept for vim compatibility but not needed for nvim
set nocompatible
set termguicolors

" Helps force plugins to load correctly when it is turned back on below
filetype off 
let g:coc_disable_startup_warning = 1
set encoding=UTF-8

" TODO: Load plugins here (pathogen or vundle)
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'tpope/vim-sensible'
" Plug 'junegunn/seoul256.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'catppuccin/nvim', {'as': 'catppuccin'}
Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'airblade/vim-gitgutter'
" git plugin
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-rhubarb'
Plug 'preservim/nerdtree'
Plug 'nvim-lualine/lualine.nvim'
Plug 'nvim-tree/nvim-web-devicons'
Plug 'adelarsq/vim-devicons-emoji'
Plug 'aserowy/tmux.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
" surround plugin
Plug 'tpope/vim-surround'
" comment plugin
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/Align'
" Plug 'scrooloose/nerdcommenter'
" Plug 'scrooloose/nerdtree'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline-themes'
Plug 'ap/vim-buftabline'
Plug 'junegunn/fzf', {'do': { -> fzf#isntall() } }
Plug 'ryanoasis/vim-devicons'
" latex plugin 
Plug 'lervag/vimtex'
" markdown plugin
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
" deep learning pytorch or jax plugin
" Plug 'davidhalter/jedi-vim'

" Plug 'Valloric/YouCompleteMe' it's very heavy - don't use it
" List ends here. Plugins become visible to Vim after this call.
call plug#end()
" autocmd vimenter * NERDTree

" Turn on syntax highlighting
syntax on
" enable syntax processing
syntax enable

" For plugins to load correctly
filetype plugin indent on


" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8
set fenc=utf-8
set fencs="iso-2022-jp,euc-jp,cp932,ucs-bom,utf-8,default,latin1"

" errors flash screen rather than emit beep
set visualbell

" make Backspace work like Delete
set backspace=indent,eol,start

" don't create `filename~` backups
" set nobackup

" don't create temp files
" set noswapfile

" line numbers and distances
" set relativenumber 
set number 
" open NERDTree and shift focus to  focus to another window
nnoremap <C-n> :NERDTreeToggle<CR>

" number of lines offset when jumping
set scrolloff=2

" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=2 shiftwidth=2 softtabstop=2 

" Indent new line the same as the preceding line
set autoindent
set smartindent

" statusline indicates insert or normal mode
set showmode showcmd

" make scrolling and painting fast
" ttyfast kept for vim compatibility but not needed for nvim
set ttyfast lazyredraw

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
"set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" open new buffers without saving current modifications (buffer remains open)
set hidden
noremap <C-N> :bnext<CR>
noremap <C-P> :bprev<CR>

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
set clipboard=unnamedplus

" Show character column
" highlight ColorColumn ctermbg=DarkBlue
set colorcolumn=100

" CursorLine - sometimes autocmds are not performant; turn off if so
" http://vim.wikia.com/wiki/Highlight_current_line
set cursorline
" Normal mode
" highlight CursorLine ctermbg=None
autocmd InsertEnter "*" highlight  CursorLine ctermbg=17 ctermfg=None
autocmd InsertLeave * highlight  CursorLine ctermbg=None ctermfg=None

set foldmethod=syntax
set foldlevel=99

let g:catppuccin_flavour = "mocha" "latte, frappe. macchiato, mocha
" colorscheme catppuccin

lua require("catppuccin").setup()
lua require("tmux").setup()
lua require('nvim-web-devicons').setup()
lua require('nvim-web-devicons').get_icons()

colorscheme catppuccin

lua require('lualine').setup({options = {theme = "catppuccin"}})
" lua require('lualine').setup()

" use <tab> for trigger completion and navigate to the next complete item    
function! s:check_back_space() abort                                                                                                          
  let col = col('.') - 1    
  return !col || getline('.')[col - 1]  =~ '\s'    
endfunction    
autocmd BufWinLeave "*" mkview
autocmd BufWinEnter "*" silent loadview      
inoremap <silent><expr> <Tab>    
      \ pumvisible() ? "\<C-n>" :    
      \ <SID>check_back_space() ? "\<Tab>" :    
      \ coc#refresh()  


" vim tex plugin
" This is necessary for VimTeX to load properly. The "indent" is optional.
" Note that most plugin managers will do this automatically.
filetype plugin indent on

" indentLine plugin 
let g:indentLine_concealcursor = 0

" This enables Vim's and neovim's syntax-related features. Without this, some
" VimTeX features will not work (see ":help vimtex-requirements" for more
" info).
syntax enable

" Viewer options: One may configure the viewer either by specifying a built-in
" viewer method:
let g:vimtex_view_method = 'zathura'

" Or with a generic interface:
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'

" VimTeX uses latexmk as the default compiler backend. If you use it, which is
" strongly recommended, you probably don't need to configure anything. If you
" want another compiler backend, you can change it as follows. The list of
" supported backends and further explanation is provided in the documentation,
" see ":help vimtex-compiler".
let g:vimtex_compiler_method = 'latexrun'

" Most VimTeX mappings rely on localleader and this can be changed with the
" following line. The default is usually fine and is the symbol "\".
let maplocalleader = ","
