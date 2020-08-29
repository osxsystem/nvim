" -------------------------- Config UI ------------------------------------
" -------------------------------------------------------------------------



" Call the theme one
" colorscheme  gruvbox

set background=dark
 colorscheme PaperColor
set encoding=utf-8
" General settings {{{
 scriptencoding utf-16      " allow emojis in vimrc
 set nocompatible           " vim, not vi
 syntax on                  " syntax highlighting
 filetype plugin indent on  " try to recognize filetypes and load rel' plugins
 set guicursor=
 set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
" let g:python_host_prog='/Users/hung/.pyenv/shims/python'
" let g:loaded_python_provider = 0
" let g:deoplete#enable_at_startup = 1

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

   set tabstop=2         " Softtabs or die! use 2 spaces for tabs.
   set shiftwidth=2      " Number of spaces to use for each step of (auto)indent.
   set expandtab         " insert tab with right amount of spacing
   set shiftround        " Round indent to multiple of 'shiftwidth'
   " set termguicolors     " enable true colors
   set hidden            " enable hidden unsaved buffers
   set autoread          " make Vim automatically refresh any files that haven't been edited by Vim
   if !has('nvim')             " does not work on neovim
     set emoji                 " treat emojis 😄  as full width characters
     set cryptmethod=blowfish2 " set encryption to use blowfish2 (vim -x file.txt)
   end

   set ttyfast           " should make scrolling faster
   set lazyredraw        " should make scrolling faster

   " visual bell for errors
     set visualbell

   " text appearance
     set textwidth=120
     set nowrap                          " nowrap by default
     set list                            " show invisible characters
     set listchars=tab:»·,trail:·,nbsp:· " Display extra whitespace

   " Numbers
     set number
     set numberwidth=1
    
    " turn relative line numbers on
    set relativenumber
    
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
"     set spellfile=$HOME/.vim-spell-en.utf-8.add
    " NCM2
    " enable ncm2 for all buffers
    autocmd BufEnter * call ncm2#enable_for_buffer()

    " IMPORTANT: :help Ncm2PopupOpen for more information
    set completeopt=noinsert,menuone,noselect

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
"++++++++++++++++++++ support python highlight syntax
hi semshiLocal           ctermfg=209 guifg=#ff875f
hi semshiGlobal          ctermfg=214 guifg=#ffaf00
hi semshiImported        ctermfg=214 guifg=#ffaf00 cterm=bold gui=bold
hi semshiParameter       ctermfg=75  guifg=#5fafff
hi semshiParameterUnused ctermfg=117 guifg=#87d7ff cterm=underline gui=underline
hi semshiFree            ctermfg=218 guifg=#ffafd7
hi semshiBuiltin         ctermfg=207 guifg=#ff5fff
hi semshiAttribute       ctermfg=49  guifg=#00ffaf
hi semshiSelf            ctermfg=249 guifg=#b2b2b2
hi semshiUnresolved      ctermfg=226 guifg=#ffff00 cterm=underline gui=underline
hi semshiSelected        ctermfg=231 guifg=#ffffff ctermbg=161 guibg=#d7005f

hi semshiErrorSign       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
hi semshiErrorChar       ctermfg=231 guifg=#ffffff ctermbg=160 guibg=#d70000
sign define semshiError text=E> texthl=semshiErrorSign
" +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
" default semshi mapping
nmap <silent> <leader>rr :Semshi rename<CR>

nmap <silent> <Tab> :Semshi goto name next<CR>
nmap <silent> <S-Tab> :Semshi goto name prev<CR>

nmap <silent> <leader>c :Semshi goto class next<CR>
nmap <silent> <leader>C :Semshi goto class prev<CR>

nmap <silent> <leader>f :Semshi goto function next<CR>
nmap <silent> <leader>F :Semshi goto function prev<CR>

nmap <silent> <leader>gu :Semshi goto unresolved first<CR>
nmap <silent> <leader>gp :Semshi goto parameterUnused first<CR>

nmap <silent> <leader>ee :Semshi error<CR>
nmap <silent> <leader>ge :Semshi goto error<CR>

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

" macOS clipboard connected Vi
set clipboard=unnamed
" Quicker window movement
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
" --------------- Search ----------------------------------
set hlsearch

" read/write file when moving buffer
set autowrite
set autoread

set undofile
set undodir=/tmp

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

" Languague Client config
" let g:LanguageClient_serverCommands = {
"     \ 'python': ['/Users/hung/.pyenv/shims/pyls'],
"     \ }

" if executable('pyls')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'pyls',
"         \ 'cmd': {server_info->['pyls']},
"         \ 'whitelist': ['python'],
"         \ 'workspace_config': {'pyls': {'plugins': {'pydocstyle': {'enabled': v:true}}}}
"         \ })
" endif
" let g:lsp_signs_enabled = 1         " enable signs
" let g:lsp_diagnostics_echo_cursor = 1 " enable echo under cursor when in normal mode
let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/Users/hung/.pyenv/shims/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" ====================================================================
" Load all plugins ------------------------------- {{{
if filereadable(expand('~/.config/nvim/vimrc.bundles'))
  source ~/.config/nvim/vimrc.bundles
endif
" }}}
