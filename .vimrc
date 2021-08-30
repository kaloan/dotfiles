" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2019 Jan 26
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" THE FOLLOWING BLOCK IS FOR DEIN PLUGIN MANAGER
"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=/home/kstoilov/.vim/bundles/repos/github.com/Shougo/dein.vim

" Required:
call dein#begin('/home/kstoilov/.vim/bundles')

" Let dein manage dein
" Required:
call dein#add('/home/kstoilov/.vim/bundles/repos/github.com/Shougo/dein.vim')

" Add or remove your plugins here like this:
"call dein#add('Shougo/neosnippet.vim')
"call dein#add('Shougo/neosnippet-snippets')
call dein#add('vim-airline/vim-airline')
call dein#add('vim-airline/vim-airline-themes')
call dein#add('joshdick/onedark.vim')
call dein#add('jremmen/vim-ripgrep')
call dein#add('tpope/vim-fugitive')
call dein#add('lyuts/vim-rtags')
call dein#add('scrooloose/nerdtree')
call dein#add('mbbill/undotree')
call dein#add('sjl/gundo.vim')
call dein#add('wincent/terminus')
call dein#add('edkolev/promptline.vim')

" IMPORTANT!: REQUIRES A NERD FONT
call dein#add('ryanoasis/vim-devicons')

" Required:
call dein#end()

" Required:
filetype plugin indent on
syntax enable

" If you want to install not installed plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------



" THE FOLLOWING BLOCK IS FOR COLORSCHEMING
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif



" When started as "evim", evim.vim will already have done these settings, bail
" out.
if v:progname =~? "evim"
  finish
endif

" Get the defaults that most users want.
" source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif

" Set encoding to UTF8
set encoding=utf8

" Use powerline fonts in vim-airline statusline
let g:airline_powerline_fonts=1

set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

" Use a specific airline theme
let g:airline_theme='ayu_dark'
"let g:airline_theme='badwolf'
"let g:airline_theme='base16_atelier_cave'
"let g:airline_theme='base16_black_metal_gorgoroth'
"let g:airline_theme='deus'
"let g:airline_theme='distinguished'
"let g:airline_theme='lighthaus'
"let g:airline_theme='murmur'
"let g:airline_theme='night_owl'
"let g:airline_theme='onedark'
"let g:airline_theme='ouo'
"let g:airline_theme='raven'

" Set font
set guifont=SauceCodePro\ Nerd\ Font\ Mono\ Semibold\ 16

" Enable syntax coloring
syntax on

" Use one-dark colorscheme
colorscheme onedark

" Change color of background to what I prefer
highlight Normal ctermbg=232 guibg=#202020

" Change color of cursorline and column
highlight CursorLine cterm=none ctermbg=235 guibg=#2F2F2F
highlight CursorColumn cterm=none ctermbg=235 guibg=#2F2F2F


" Change color of the line number field
highlight LineNr ctermfg=white guifg=white 


set exrc

" Enable error column to the left of line numbers
set signcolumn=yes

set updatetime=50

" Enable line numbering(relative+current line instead of 0)
set number relativenumber

" Enable partial searching 
set incsearch


" Set how many spaces tab should look like
set tabstop=4 softtabstop=4

" 
set shiftwidth=4

" Make tabs spaces
set expandtab

" Indentation
set smartindent

" Disable case sensitivity during search
set ignorecase

" Makes case insensitive search switch to sensitive when using capital letters
set smartcase

" Makes screen scroll down when cursor is N lines from the bottom
set scrolloff=6

" Buffer
set hidden

" Set up undofile used in undo tree which makes swap files and backups
" pointless
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile

" Allow highlighting of the line and column of the cursor
set cursorline
set cursorcolumn

" Use the same clipboard as stadtard OS clipboard
set clipboard=unnamedplus

" Set <Space> as the leader key
let mapleader = " "

if executable('rg')
  let g:rg_derive_root='true'
endif

let g:ctrlp_use_caching = 0

" Ease moving through buffers
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w <C-w>w
nnoremap <leader>W <C-w>W

" Key combinations to help NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" Used in undotree
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>u :UndotreeToggle <bar> UndotreeFocus<CR>

" Start NERDtree with vim unless reading with vimpager and switch cursor to
" file buffer
autocmd VimEnter * if &filetype !=#	'man'| NERDTree | wincmd p | endif

" Close NERDtree buffer when it is the last remaining in a tab (so tab is closed too)
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" Synchronises NERDtree between the tabs
autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

" Enable case sensitivity when typing commands
autocmd CmdlineEnter / :setlocal ignorecase smartcase
autocmd CmdlineEnter : :setlocal noignorecase nosmartcase
