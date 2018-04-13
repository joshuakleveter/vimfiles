" Example Vim configuration.
" Copy or symlink to ~/.vimrc or ~/_vimrc.

set nocompatible                  " Must come first because it changes other options.

syntax enable                     " Turn on syntax highlighting.
filetype plugin indent on         " Turn on file type detection.

runtime macros/matchit.vim        " Load the matchit plugin.

set showcmd                       " Display incomplete commands.
set showmode                      " Display the mode you're in.

set backspace=indent,eol,start    " Intuitive backspacing.

set hidden                        " Handle multiple buffers better.

set fileformat=unix               " Set line endings to UNIX

set wildmenu                      " Enhanced command line completion.
set wildmode=list:longest         " Complete files like a shell.

set ignorecase                    " Case-insensitive searching.
set smartcase                     " But case-sensitive if expression contains a capital letter.

set number                        " Show line numbers.
set ruler                         " Show cursor position.

set incsearch                     " Highlight matches as you type.
set hlsearch                      " Highlight matches.

set wrap                          " Turn on line wrapping.
set scrolloff=3                   " Show 3 lines of context around the cursor.

set title                         " Set the terminal's title

set visualbell                    " No beeping.

set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set directory=$HOME/.vim/tmp//,.  " Keep swap files in one location

" UNCOMMENT TO USE
set tabstop=2                    " Global tab width.
set shiftwidth=2                 " And again, related.
set expandtab                    " Use spaces instead of tabs

set laststatus=2                  " Show the status line all the time
" Useful status information at bottom of screen
set statusline=[%n]\ %<%.99f\ %h%w%m%r%y\ %{exists('*CapsLockStatusline')?CapsLockStatusline():''}%=%-16(\ %l,%c-%v\ %)%P

" Use industry colorscheme
colorscheme default

" Autostart language servers
let g:LanguageClient_autoStart = 1

" Configure JavaScript LSP for NeoVim
let g:LanguageClient_serverCommands = {}
if executable('javascript-typescript-stdio')
  let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']
else
  echo "javascript-typescript-stdio not installed!\n"
  :cq
endif

" Tab mappings.
map <leader>tt :tabnew<cr>
map <leader>te :tabedit
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>
map <leader>tm :tabmove

" Uncomment to use Jamis Buck's file opening plugin
"map <Leader>t :FuzzyFinderTextMate<Enter>

" Controversial...swap colon and semicolon for easier commands
"nnoremap ; :
"nnoremap : ;

"vnoremap ; :
"vnoremap : ;

" Automatic fold settings for specific files. Uncomment to use.
" autocmd FileType ruby setlocal foldmethod=syntax
" autocmd FileType css  setlocal foldmethod=indent shiftwidth=2 tabstop=2

" Vim-Plug section
call plug#begin('~/.vim/plugged')

" Use single-quotes for filepaths!

Plug 'autozimu/LanguageClient-neovim', {
  \ 'branch': 'next',
  \ 'do': 'bash install.sh',
  \ }                                         " Vim LSP client
Plug 'junegunn/fzf'
Plug 'roxma/nvim-completion-manager'
Plug 'ctrlpvim/ctrlp.vim'                     " CtrlP.vim fuzzy finder
Plug 'heavenshell/vim-jsdoc'                  " JSDoc Autogenerator
Plug 'godlygeek/tabular'                      " Tabular
Plug 'andreimaxim/vim-io'                     " Io Language
Plug 'posva/vim-vue'                          " Vue.js
Plug 'mattn/emmet-vim'                        " Emmet completion
Plug 'tpope/vim-fugitive'                     " Git wrapper
Plug 'airblade/vim-gitgutter'                 " Git diff gutter
Plug 'sheerun/vim-polyglot'                   " A whole lotta languages in that thar plugin.
Plug 'w0rp/ale'                               " Asynchronous Linting Engine
Plug 'xolox/vim-easytags'                     " Ctags manager
Plug 'xolox/vim-misc'                         " Loading scripts for vim-easytags
Plug 'majutsushi/tagbar'                      " Ctags navigation

call plug#end()

" Configure ALE
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_pattern_options = {
      \'.*\.vue$': {'ale_enabled': 0},
      \}

" Configure Tagbar
nmap <F8> :TagbarToggle<CR>
