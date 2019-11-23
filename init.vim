" -------------------------- Config UI ------------------------------------
" -------------------------------------------------------------------------

" Call the theme one
" colorscheme  gruvbox

set background=dark
colorscheme PaperColor
" General settings {{{
 scriptencoding utf-16      " allow emojis in vimrc
 set nocompatible           " vim, not vi
 syntax on                  " syntax highlighting
 filetype plugin indent on  " try to recognize filetypes and load rel' plugins

 " }}}
 "  Behavior Modification ----------------------  {{{
   " set leader key
   let g:mapleader=","
   set backspace=2       " Backspace deletes like most programs in insert mode
   set history=200       " how many : commands to save in history
   set ruler             " show the cursor position all the time
   set showcmd           " display incomplete commands
   set incsearch         " do incremental searching
   set laststatus=2      " Always display the status line
   set autowrite         " Automatically :write before running commands
   set ignorecase        " ignore case in searches
   set smartcase         " use case sensitive if capital letter present or \C
   set magic             " Use 'magic' patterns (extended regular expressions).
   set noshowmode        " don't show mode as airline already does
   set showcmd           " show any commands
   set foldmethod=manual " set folds by syntax of current language
   set mouse=a           " enable mouse (selection, resizing windows)
   set iskeyword+=-      " treat dash separated words as a word text object

   set tabstop=4         " Softtabs or die! use 2 spaces for tabs.
   set shiftwidth=4      " Number of spaces to use for each step of (auto)indent.
   set expandtab         " insert tab with right amount of spacing
   set shiftround        " Round indent to multiple of 'shiftwidth'
   " set termguicolors     " enable true colors
   set hidden            " enable hidden unsaved buffers

   if !has('nvim')             " does not work on neovim
     set emoji                 " treat emojis 😄  as full width characters
     set cryptmethod=blowfish2 " set encryption to use blowfish2 (vim -x file.txt)
   end

   set ttyfast           " should make scrolling faster
   set lazyredraw        " should make scrolling faster

   " visual bell for errors
     set visualbell

   " text appearance
     set textwidth=80
     set nowrap                          " nowrap by default
     set list                            " show invisible characters
     set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

   " Numbers
     set number
     set numberwidth=1

   " set where swap file and undo/backup files are saved
     set backupdir=~/.vim/tmp,.
     set directory=~/.vim/tmp,.

   " persistent undo between file reloads
     if has('persistent_undo')
       set undofile
       set undodir=~/.vim/tmp,.
     endif

   " Open new split panes to right and bottom, which feels more natural
     set splitbelow
     set splitright

   " Set spellfile to location that is guaranteed to exist, can be symlinked to
   " Dropbox or kept in Git
     set spellfile=$HOME/.vim-spell-en.utf-8.add

   " Autocomplete with dictionary words when spell check is on
     set complete+=kspell

   " Always use vertical diffs
     set diffopt+=vertical
     set noundofile
   " highlight fenced code blocks in markdown
   let g:markdown_fenced_languages = [
         \ 'bash=sh',
         \ 'elixir',
         \ 'elm',
         \ 'graphql',
         \ 'html',
         \ 'js=javascript',
         \ 'json',
         \ 'python',
         \ 'ruby',
         \ 'sql',
         \ 'vim',
         \ ]

   " enable folding in bash files
     let g:sh_fold_enabled=1
 " }}}
" Ignore popular folder and file system
let g:ctrlp_custom_ignore ='node_modules\DS_Store\|git'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " Linux/MacOSX

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:31,results:31'

" ------------------- MAPPING --------------------------------------------
nnoremap ,<space> :nohlsearch<CR>					" stop highline search

" VimPlug:
nnoremap <leader>pi :PlugInstall<CR>
nnoremap <leader>pu :PlugUpdate<CR>
nnoremap <leader>pc :PlugClean<CR>

" close all other windows with <leader>o
nnoremap <leader>wo <c-w>o

" Switch between the last two files
nnoremap <tab><tab> <c-^>
" ---------------------- COPY TO CLIPBOARD -----------------------
" :w !pbcopy work when copy from the other window
vmap <C-c> :w !pbcopy<CR>               " i dont known maybe use: "*y instead, or "+y

" copy to end of line
nnoremap Y y$

" copy to system clipboard
noremap gy "+y

" copy whole file to system clipboard
nnoremap gY gg"+yG

" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" --------------- Search ----------------------------------
set hlsearch

" Incsearch:
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" --------------- End Search ------------------------------
" toggle NERDTree
nmap <C-b> :NERDTreeToggle<cr>
" NERDTree reload or refresh
nmap <Leader>r :NERDTreeRefreshRoot<CR>

" Open files relative to current path:
nnoremap <leader>ed :edit <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>sp :split <C-R>=expand("%:p:h") . "/" <CR>
nnoremap <leader>vs :vsplit <C-R>=expand("%:p:h") . "/" <CR>
" move lines up and down in visual mode
xnoremap <c-k> :move '<-2<CR>gv=gv
xnoremap <c-j> :move '>+1<CR>gv=gv
" Load all plugins ------------------------------- {{{
if filereadable(expand('~/.config/nvim/vimrc.bundles'))
  source ~/.config/nvim/vimrc.bundles
endif
" }}}
