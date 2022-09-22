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

set runtimepath+=~/.config/nvim

" Required:
set runtimepath+=~/.config/nvim/plugged

set runtimepath+=~/.config/nvim/lua

source ~/.config/nvim/osc52.vim
vmap <C-c> y:call SendViaOSC52(getreg('"'))<cr>

" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin(stdpath('data') . '/plugged')
" Make sure you use single quotes
 " Unicode completion and characters
 Plug 'chrisbra/unicode.vim' 

 " Statusline and color theme
 Plug 'vim-airline/vim-airline'
 Plug 'vim-airline/vim-airline-themes'
 Plug 'flazz/vim-colorschemes'
 Plug 'joshdick/onedark.vim'
 Plug 'lambdalisue/battery.vim' 
 "By being commented out you can have different statusline in vim
 "Plug 'edkolev/tmuxline.vim' 
 
 "Better grep
 Plug 'jremmen/vim-ripgrep'
 
 Plug 'honza/vim-snippets'
 Plug 'preservim/tagbar'

 "Git in vim
 Plug 'tpope/vim-fugitive'
 
 " Add right tags
 "Plug 'lyuts/vim-rtags'

 "Used with undofile
 Plug 'mbbill/undotree'
 
 Plug 'sjl/gundo.vim'
 Plug 'wincent/terminus'
 Plug 'edkolev/promptline.vim'
 Plug 'adelarsq/vim-matchit'
 Plug 'jiangmiao/auto-pairs'

 "Better change
 Plug 'tpope/vim-surround'
 Plug 'mattn/emmet-vim'
 Plug 'junegunn/vim-easy-align'
 Plug 'alvan/vim-closetag'
 Plug 'tpope/vim-abolish'
 Plug 'Yggdroot/indentLine'

" IMPORTANT!: REQUIRES A NERD FONT
 Plug 'ryanoasis/vim-devicons'

" On-demand loading
 Plug 'scrooloose/nerdtree'
 Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

 Plug 'kyazdani42/nvim-web-devicons' " for file icons

" Language server setup
 "Plug 'neovim/nvim-lspconfig'
 "Plug 'nvim-lua/completion-nvim'
 "Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
 "Plug 'Shougo/neosnippet.vim'
 "Plug 'Shougo/neosnippet-snippets'



 Plug 'neoclide/coc.nvim', {'branch': 'release'} 
 Plug 'nvim-lua/plenary.nvim'
 Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
 Plug 'nvim-treesitter/nvim-treesitter-refactor', {'do': ':TSUpdate'} 
 Plug 'David-Kunz/treesitter-unit'
 Plug 'BurntSushi/ripgrep'

 Plug 'nvim-telescope/telescope.nvim'
 Plug 'fannheyward/telescope-coc.nvim'
 Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

 "Better clipboard
 Plug 'MattesGroeger/vim-bookmarks'
 Plug 'tom-anders/telescope-vim-bookmarks.nvim'
 
 "Plug 'RishabhRD/nvim-finder'
 "Plug 'RishabhRD/nvim-lsputils'

 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
 Plug 'junegunn/fzf.vim'

" For window pop-ups
 Plug 'voldikss/vim-floaterm'
 Plug 'voldikss/fzf-floaterm'

 Plug 'mhinz/vim-signify'

 " IMPORTANT: requires sqlite3 for the persistent history  
 Plug 'tami5/sqlite.lua'
 Plug 'AckslD/nvim-neoclip.lua'
 
 " Sessions
 Plug 'rmagatti/auto-session'
 Plug 'rmagatti/session-lens'
 
 " Useful csv functions
 Plug 'chrisbra/csv.vim'

 " Scroller on the side
 Plug 'dstein64/nvim-scrollview'
 
 " Initialize plugin system
call plug#end()

lua require('telescope').load_extension('coc')
lua require('telescope').load_extension('neoclip')
lua require('telescope').load_extension('vim_bookmarks')
lua require('telescope').load_extension('session-lens')
lua require('telescope.builtin')

"lua require"treesitter-unit".disable_highlighting()

nnoremap <leader>rc :tabnew $MYVIMRC<CR>
nnoremap <leader>sp :source %<CR>

xnoremap iu :lua require"treesitter-unit".select()<CR>
xnoremap au :lua require"treesitter-unit".select(true)<CR>
onoremap iu :<c-u>lua require"treesitter-unit".select()<CR>
onoremap au :<c-u>lua require"treesitter-unit".select(true)<CR>

" Make language plugins useful
filetype plugin indent on
syntax enable


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

" Enable airline tabline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

" Use powerline fonts in vim-airline statusline
let g:airline_powerline_fonts=1

set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm

" Use a specific airline theme - these are nice
"let g:airline_theme='ayu_dark'
"let g:airline_theme='badwolf'
"let g:airline_theme='base16_atelier_cave'
"let g:airline_theme='base16_black_metal_gorgoroth'
"let g:airline_theme='deus'
let g:airline_theme='distinguished'
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

" Use a colorscheme, 
" colorscheme spartan
" colorscheme janah
" colorscheme luna
" colorscheme zazen
" colorscheme jellyx
" colorscheme distill
" these ones also have corresponding airline themes in the
" previous list
"colorscheme onedark
"colorscheme ayu
colorscheme distinguished

" Change color of background to what I prefer
highlight Normal ctermbg=232 guibg=#131313
highlight Visual term=reverse guifg=none guibg=#AAAAAA

" Change color of cursorline and column
highlight CursorLine cterm=none ctermbg=235 guibg=#2F2F2F
highlight CursorColumn cterm=none ctermbg=235 guibg=#2F2F2F


" Change color of the line number field
highlight LineNr ctermfg=white guifg=#E06C75 
"highlight LineNr ctermfg=white guifg=#B05050 

" Change color of the scroll
"highlight link ScrollView Pmenu
highlight ScrollView ctermbg=235 guibg=#2F2F2F

" ?
set exrc

" Enable error column to the left of line numbers
set signcolumn=yes

set updatetime=50
set shortmess+=c

" Enable line numbering(relative+current line instead of 0)
set number relativenumber

" Enable partial searching 
set incsearch


" Set how many spaces tab should look like
set tabstop=2 
set softtabstop=2
set shiftwidth=2

" Make tabs spaces
set expandtab

" Indentation
set smartindent

" Matches brackets
set showmatch

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
set undodir=~/.local/share/nvim/undo
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

" Ease moving through windows
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l
nnoremap <leader>w <C-w>w
nnoremap <leader>W <C-w>W
nnoremap <leader>- <C-w>s
nnoremap <leader>v <C-w>v

" Ease moving through buffers
nnoremap <nowait> <leader>b :bn<CR>
nnoremap <nowait> <leader>B :bN<CR>

" Key combinations to help NERDtree
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
"nnoremap <C-h> :let NERDTreeShowHidden=1-NERDTreeShowHidden<CR>

"nnoremap <leader>n :NvimTreeFocus<CR>
"nnoremap <C-n> :NvimTreeToggle<CR>
"nnoremap <C-f> :NvimTreeFind<CR>     

" Used in undotree
nnoremap <F5> :UndotreeToggle<CR>
nnoremap <leader>u :UndotreeToggle <bar> UndotreeFocus<CR>


" Quick surrond with quotes/parenthesis/etc
nnoremap <leader>' ciw''<Esc>P
nnoremap <leader>" ciw""<Esc>P
nnoremap <leader>( ciw()<Esc>P
nnoremap <leader>) ciw()<Esc>P
nnoremap <leader>[ ciw[]<Esc>P
nnoremap <leader>] ciw[]<Esc>P
nnoremap <leader>{ ciw{}<Esc>P
nnoremap <leader>} ciw{}<Esc>P

augroup MYAUTOCMDS
    autocmd!
    " Start NERDtree with vim unless reading with vimpager and switch cursor to
    " file buffer
    autocmd VimEnter * if &filetype !=#	'man' && &filetype !=# '' && &filetype !=# 'conf' | NERDTree | wincmd p | endif

    " Close NERDtree buffer when it is the last remaining in a tab (so tab is closed too)
    autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

    " Synchronises NERDtree between the tabs
    autocmd BufWinEnter * if getcmdwintype() == '' | silent NERDTreeMirror | endif

    " Enable case sensitivity when typing commands
    autocmd CmdlineEnter / :setlocal ignorecase smartcase
    autocmd CmdlineEnter : :setlocal noignorecase nosmartcase
augroup END

" Enable deoplete on startup
"let g:deoplete#enable_at_startup = 1

" Enable snipMate compatibility feature.
"let g:neosnippet#enable_snipmate_compatibility = 1

" Tell Neosnippet about the other snippets
"let g:neosnippet#snippets_directory='~/.vim/bundle/vim-snippets/snippets'


"lua require('lsp_config')

"set foldmethod=expr
  "\ foldexpr=lsp#ui#vim#folding#foldexpr()
  "\ foldtext=lsp#ui#vim#folding#foldtext()

"if executable('pyls')
    "" pip install python-language-server
    "au User lsp_setup call lsp#register_server({
        "\ 'name': 'pyls',
        "\ 'cmd': {server_info->['pyls']},
        "\ 'allowlist': ['python'],
        "\ })
"endif

"function! s:on_lsp_buffer_enabled() abort
"    setlocal omnifunc=lsp#complete
"    setlocal signcolumn=yes
"    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
"    nmap <buffer> gd <plug>(lsp-definition)
"    nmap <buffer> gs <plug>(lsp-document-symbol-search)
"    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
"    nmap <buffer> gr <plug>(lsp-references)
"    nmap <buffer> gi <plug>(lsp-implementation)
"    nmap <buffer> gt <plug>(lsp-type-definition)
"    nmap <buffer> <leader>rn <plug>(lsp-rename)
"    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
"    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
"    nmap <buffer> K <plug>(lsp-hover)
"    inoremap <buffer> <expr><c-f> lsp#scroll(+4)
"    inoremap <buffer> <expr><c-d> lsp#scroll(-4)
"
"    let g:lsp_format_sync_timeout = 1000
"    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')
"    
"    " refer to doc to add more commands
"endfunction

"augroup lsp_install
"    au!
"    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
"    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
"augroup END


" SNIPPETS
"imap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"
"smap <expr> <Tab> neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" : "\<Tab>"

"if executable('clangd')
"    augroup vim_lsp_cpp
"        autocmd!
"        autocmd User lsp_setup call lsp#register_server({
"                    \ 'name': 'clangd',
"                    \ 'cmd': {server_info->['clangd']},
"                    \ 'whitelist': ['c', 'cpp', 'objc', 'objcpp', 'cc'],
"                    \ })
"	autocmd FileType c,cpp,objc,objcpp,cc setlocal omnifunc=lsp#complete
"    augroup end
"endif
"
"if has('conceal')
"    set conceallevel=2 concealcursor=niv
"endif
"
"set completeopt+=menuone
"
"
"lua <<EOF
"vim.lsp.handlers['textDocument/codeAction'] = require'lsputil.codeAction'.code_action_handler
"vim.lsp.handlers['textDocument/references'] = require'lsputil.locations'.references_handler
"vim.lsp.handlers['textDocument/definition'] = require'lsputil.locations'.definition_handler
"vim.lsp.handlers['textDocument/declaration'] = require'lsputil.locations'.declaration_handler
"vim.lsp.handlers['textDocument/typeDefinition'] = require'lsputil.locations'.typeDefinition_handler
"vim.lsp.handlers['textDocument/implementation'] = require'lsputil.locations'.implementation_handler
"vim.lsp.handlers['textDocument/documentSymbol'] = require'lsputil.symbols'.document_handler
"vim.lsp.handlers['workspace/symbol'] = require'lsputil.symbols'.workspace_handler
"EOF
"
""lua require'popfix.sorter'.new_fzy_native_sorter(true)
""lua require'popfix.fuzzy_enigne'.new_SingleExecutionEngine()
"nnoremap <leader>p <cmd>lua require'finder'.files{}<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

nnoremap <leader>bm <cmd>Telescope vim_bookmarks<cr>

lua << EOF
require('telescope').setup({
    defaults = {
        layout_strategy = 'horizontal',
        layout_config = {
            prompt_position = 'top',
            width = 0.9
        },
        sorting_strategy='ascending',
        winblend = 20,
        prompt_prefix = '🔍',
        selection_caret = '🔍'
    },
      extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = true,  -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
    }
  }
})
EOF

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"inoremap <silent><expr> <TAB>
"      \ pumvisible() ? coc#_select_confirm() :
"      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
"      \ <SID>check_back_space() ? "\<TAB>" :
"      \ coc#refresh()
"inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_status = 1

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

lua <<EOF
require'nvim-treesitter.configs'.setup {
  refactor = {
    highlight_definitions = { enable = true },
    smart_rename = {
      enable = true,
      keymaps = {
        smart_rename = "grr",
      },
    },
  },
}
EOF

lua <<EOF
  require('neoclip').setup({
    history = 1000,
    enable_persistent_history = true,
    db_path = vim.fn.stdpath("data") .. "/databases/neoclip.sqlite3",
    filter = nil,
    preview = true,
    default_register = '"',
    content_spec_column = false,
    on_paste = {
      set_reg = false,
    },
    keys = {
      telescope = {
        i = {
          select = '<cr>',
          paste = '<c-p>',
          paste_behind = '<c-k>',
          custom = {},
        },
        n = {
          select = '<cr>',
          paste = 'p',
          paste_behind = 'P',
          custom = {},
        },
      },
    }
  })
EOF

lua <<EOF
require('scrollview').setup({
  excluded_filetypes = {'nerdtree'},
  current_only = true,
  winblend = 0,
})
EOF
