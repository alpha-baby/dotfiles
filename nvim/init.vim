let mapleader=" "

set number                 " 显示行号
set relativenumber       " 显示动态行号
set cursorline             " 显示下划线
set wrap		   " 自动折行
set showcmd                " 显示执行的命令
set wildmenu               " tap 补全vim命令
set hlsearch               " 搜索高亮的字符串
exec "nohlsearch"        
" 防止一进入vim就高亮以前的搜索内容
set incsearch              " 搜索 边输入边高亮
set ignorecase             " 收缩忽略大小写
set smartcase              " 智能大小写搜索
set mouse=a                     "启用鼠标"

set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a                 " 开启vim的鼠标操作
set encoding=utf-8
let &t_ut=''
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
set scrolloff=9               " 保持光标在屏幕上下端的行数
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

" 键位绑定 上下左右
noremap i k
noremap j h
noremap k j
noremap l l

noremap I 7k
noremap J 5h
noremap K 7j
noremap L 5l


noremap h i
noremap H I

noremap = nzz
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
map s <nop>
" 保存和推出快捷键
map <C-s> :w<CR>
map <C-q> :q<CR>
map U <C-r>
"map <C-r> :source $MYVIMRC<CR>
map ; :
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
map <C-e> <C-[>
map <C-f> :?

" 分屏快捷键绑定
map sl :set splitright<CR>:vsplit<CR>
map sj :set nosplitright<CR>:vsplit<CR>
map si :set nosplitbelow<CR>:split<CR>
map sk :set splitbelow<CR>:split<CR>
" 快速切换分屏窗口快捷键
map <LEADER>i <C-w>k
map <LEADER>j <C-w>h
map <LEADER>k <C-w>j
map <LEADER>l <C-w>l
" 调整分屏大小快捷键
map <up> :res +5<CR>
map <down> :res -5<CR>
map <left> :vertical resize+5<CR>
map <right> :vertical resize-5<CR>
map <Esc> :w<CR>  " esc 映设为保存
" 快速调整tab 切换
map tu :tabe<CR>
map tl :+tabnext<CR>
map tj :-tabnext<CR>

"
" ==
" == System
" ==
"set clipboard=unnamedplus

" vim 插件
call plug#begin('~/.config/nvim/plugged')
Plug 'vim-airline/vim-airline'

" colorschech
Plug 'KeitaNakamura/neodark.vim'
Plug 'connorholyday/vim-snazzy'
Plug 'arcticicestudio/nord-vim'
Plug 'theniceboy/vim-deus'
Plug 'dracula/vim', { 'as': 'dracula' }

" devlop tool
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mhinz/vim-startify'
" File navigation
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'
" Auto Complete
"Plug 'Valloric/YouCompleteMe'

" Undo Tree
Plug 'mbbill/undotree/'

" Other visual enhancement
Plug 'nathanaelkane/vim-indent-guides'
Plug 'Yggdroot/indentLine'

" Git
Plug 'rhysd/conflict-marker.vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'gisphm/vim-gitignore', { 'for': ['gitignore', 'vim-plug'] }

" Python
Plug 'vim-scripts/indentpython.vim'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install_sync() }, 'for' :['markdown', 'vim-plug'] }
Plug 'dhruvasagar/vim-table-mode', { 'on': 'TableModeToggle' }
Plug 'vimwiki/vimwiki'

" Bookmarks
Plug 'kshenoy/vim-signature'
Plug 'lambdalisue/suda.vim'
" Other useful utilities
"Plug 'terryma/vim-multiple-cursors'
"Plug 'junegunn/goyo.vim' " distraction free writing mode
"Plug 'tpope/vim-surround' " type ysks' to wrap the word with '' or type cs'` to change 'word' to `word`
"Plug 'godlygeek/tabular' " type ;Tabularize /= to align the =
"Plug 'gcmt/wildfire.vim' " in Visual mode, type i' to select all text in '', or type i) i] i} ip
"Plug 'scrooloose/nerdcommenter' " in <space>cc to comment a line

" Dependencies
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'kana/vim-textobj-user'
"Plug 'fadein/vim-FIGlet'
call plug#end()


let g:SnazzyTransparent = 1
color snazzy
let g:neodark#background = '#202020'
let g:neodark#use_256color = 0 " default: 0
let g:neodark#terminal_transparent = 0 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0
let g:lightline = {}
let g:lightline.colorscheme = 'nord'
" colorscheme nord
" colorscheme dracula

" vim-plug 加入插件 defx, defx-icons
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
let g:maplocalleader=';'
nnoremap <silent> <localleader>e
\ :<c-u>defx -resume -toggle -buffer-name=tab`tabpagenr()`<cr>
nnoremap <silent> <localleader>a
\ :<c-u>defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<cr>


" ===
" === NERDTree
" ===
map tt :NERDTreeToggle<CR>
let NERDTreeMapOpenExpl = "e"
"let NERDTreeMapUpdir = ""
" let NERDTreeMapUpdirKeepOpen = "l"
let NERDTreeMapOpenSplit = "b"
" let NERDTreeOpenVSplit = ""
"let NERDTreeMapActivateNode = "o"
"" let NERDTreeMapOpenInTab = ""
"" let NERDTreeMapPreview = ""
"let NERDTreeMapCloseDir = "n"
"" let NERDTreeMapChangeRoot = "y"
"" let g:NERDTreeHidden=0

" ==
" == indentLine
" ==
let g:indentLine_char_list = ['|', '¦', '┆', '┊']
let g:indent_guides_enable_on_vim_startup = 1
" hi IndentGuidesOdd  ctermbg=white
" hi IndentGuidesEven ctermbg=lightgrey

" ==
" == NERDTree-git
" ==
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ "Unknown"   : "?"
    \ }


" ===
" === You Complete ME
" ===
" nnoremap gd :YcmCompleter GoToDefinitionElseDeclaration<CR>
" nnoremap g/ :YcmCompleter GetDoc<CR>
" nnoremap gt :YcmCompleter GetType<CR>
" nnoremap gr :YcmCompleter GoToReferences<CR>
" let g:ycm_autoclose_preview_window_after_completion=0
" let g:ycm_autoclose_preview_window_after_insertion=1
" let g:ycm_use_clangd = 0
" let g:ycm_python_interpreter_path = "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6"
" let g:ycm_python_binary_path = "/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6"
" let g:ycm_server_python_interpreter='/Library/Frameworks/Python.framework/Versions/3.6/bin/python3.6'
" let g:ycm_global_ycm_extra_conf='~/.config/nvim/plugged/YouCompleteMe/third_party/ycmd/examples/.ycm_extra_conf.py'
