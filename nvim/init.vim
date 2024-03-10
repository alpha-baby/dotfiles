" alphababy nvim config
" 
"
"
"
" ==================== Auto load for first time uses ====================
if empty(glob($HOME.'/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo $HOME/.config/nvim/autoload/plug.vim --create-dirs
				\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let g:nvim_plugins_installation_completed=1
if empty(glob($HOME.'/.config/nvim/plugged/coc.nvim/plugin/coc.vim'))
	let g:nvim_plugins_installation_completed=0
	autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader=" "

set number                 " 显示行号
set relativenumber       " 显示动态行号
set cursorline             " 显示下划线
set cursorcolumn             " 显式光标所在竖线
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
set conceallevel=1
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
" 防止 indentline 创建影响打开 json markdown 文件的时候屏蔽显示双引号
" indentLine 
autocmd FileType json,markdown let g:indentLine_conceallevel = 0
" vim-json
autocmd FileType json,markdown let g:vim_json_syntax_conceal = 0

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
" 插入模式下 ctrl + s 保存
imap <C-q> <Esc> " in insert mode, use CTRL + e replace CTRL + [, means ESC
map <C-q> :q<CR>
map U <C-r>
"map <C-r> :source $MYVIMRC<CR>
"map ; :
map S :w<CR>
map Q :q<CR>
map R :source $MYVIMRC<CR>
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
map tu :tabe<CR>       " 新增一个 tab
map tl :+tabnext<CR>   " 移动到右边的一个 tab
map tj :-tabnext<CR>   " 移动到左边的一个 tab
map tc :tabc<CR>       " 关闭当前的 tab

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
Plug 'joshdick/onedark.vim'
" Treesitter
Plug 'nvim-treesitter/playground'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" devlop tool
" 默认不安装 vim go
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mhinz/vim-startify'
" File navigation
Plug 'nvim-tree/nvim-web-devicons' " optional
Plug 'nvim-tree/nvim-tree.lua'
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
" vim-plug 加入插件 defx, defx-icons
if has('nvim')
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'kristijanhusak/defx-icons'
else
  Plug 'Shougo/defx.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif

" Dependencies
"Plug 'MarcWeber/vim-addon-mw-utils'
"Plug 'kana/vim-textobj-user'
"Plug 'fadein/vim-FIGlet'
" Use release branch (recommended)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" terminal
" https://zhuanlan.zhihu.com/p/102287909
Plug 'skywind3000/vim-terminal-help'

call plug#end()


"let g:SnazzyTransparent = 1
"color snazzy
syntax on
colorscheme onedark
let g:neodark#background = '#202020'
let g:neodark#use_256color = 0 " default: 0
let g:neodark#terminal_transparent = 0 " default: 0
let g:neodark#solid_vertsplit = 1 " default: 0
let g:lightline = {}
let g:lightline.colorscheme = 'nord'
" colorscheme nord
" colorscheme dracula


" 使用 ;e 切换显示文件浏览，使用 ;a 查找到当前文件位置
let g:maplocalleader=';'
nnoremap <silent> <localleader>e
\ :<c-u>defx -resume -toggle -buffer-name=tab`tabpagenr()`<cr>
nnoremap <silent> <localleader>a
\ :<c-u>defx -resume -buffer-name=tab`tabpagenr()` -search=`expand('%:p')`<cr>

" =======
" ==================== nvim-treesitter ====================
" =======
if g:nvim_plugins_installation_completed == 1
lua <<EOF
require'nvim-treesitter.configs'.setup {
	-- one of "all", "language", or a list of languages
	ensure_installed = {"cpp", "c", "bash", "go"},
	highlight = {
		enable = true,              -- false will disable the whole extension
		disable = { "rust","vim","nvim" },  -- list of language that will be disabled
	},
}
EOF
endif


" =======
" ==================== nvim-treesitter ====================
" =======
if g:nvim_plugins_installation_completed == 1
lua <<EOF
-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- set termguicolors to enable highlight groups
vim.opt.termguicolors = true
require'nvim-tree'.setup {
  sort = {
    sorter = "case_sensitive",
  },
  view = {
    width = 30,
  },
  renderer = {
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
}
EOF
endif

noremap tt :NvimTreeToggle<CR>


"" ===
"" === NERDTree
"" ===
"map tt :NERDTreeToggle<CR>
"let NERDTreeMapOpenExpl = "e"
""let NERDTreeMapUpdir = ""
"" let NERDTreeMapUpdirKeepOpen = "l"
"let NERDTreeMapOpenSplit = "b"
"" let NERDTreeOpenVSplit = ""
""let NERDTreeMapActivateNode = "o"
""" let NERDTreeMapOpenInTab = ""
""" let NERDTreeMapPreview = ""
""let NERDTreeMapCloseDir = "n"
""" let NERDTreeMapChangeRoot = "y"
""" let g:NERDTreeHidden=0
"
"" ==
"" == indentLine
"" ==
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
"let g:indent_guides_enable_on_vim_startup = 1
"" hi IndentGuidesOdd  ctermbg=white
"" hi IndentGuidesEven ctermbg=lightgrey
"
"" ==
"" == NERDTree-git
"" ==
"let g:NERDTreeIndicatorMapCustom = {
"    \ "Modified"  : "✹",
"    \ "Staged"    : "✚",
"    \ "Untracked" : "✭",
"    \ "Renamed"   : "➜",
"    \ "Unmerged"  : "═",
"    \ "Deleted"   : "✖",
"    \ "Dirty"     : "✗",
"    \ "Clean"     : "✔︎",
"    \ "Unknown"   : "?"
"    \ }

" terminal-help
let g:terminal_key = '<C-=>'
"tnoremap <C-K> <c-\><c-n>"0pa

" ==
" == coc.nvim
" ==
" coc-snippets 是代码片段补全工具
let g:coc_global_extensions = [
    \ 'coc-json', 
    \ 'coc-git',
	\ 'coc-snippets', 
    \ 'coc-vimlsp']
" May need for Vim (not Neovim) since coc.nvim calculates byte offset by count
" utf-8 byte sequence
set encoding=utf-8
" Some servers have issues with backup files, see #649
"set nobackup
"set nowritebackup

" Having longer updatetime (default is 4000 ms = 4s) leads to noticeable
" delays and poor user experience
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion
if has('nvim')
  inoremap <silent><expr> <c-o> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

"" Use `[g` and `]g` to navigate diagnostics
"" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list
"nmap <silent> [g <Plug>(coc-diagnostic-prev)
"nmap <silent> ]g <Plug>(coc-diagnostic-next)
nmap <silent> <LEADER>- <Plug>(coc-diagnostic-prev) " 查找上一处报错的位置
nmap <silent> <LEADER>= <Plug>(coc-diagnostic-next) " 查找下一处报错的位置

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)      " 跳转到代码定义的地方
nmap <silent> gy <Plug>(coc-type-definition) " 跳转到类型定义的地方
nmap <silent> gi <Plug>(coc-implementation)  " 跳转到实现的地方
nmap <silent> gr <Plug>(coc-references)      " 跳转到代码引用的地方

" Use K to show documentation in preview window
" <LEADER>+h 快速查看文档
nnoremap <silent> <LEADER>h :call ShowDocumentation()<CR>
"nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
" 相同词或者变量高亮
autocmd CursorHold * silent call CocActionAsync('highlight')

"" Symbol renaming
"nmap <leader>rn <Plug>(coc-rename)
"
" Formatting selected code
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

"" 代码折叠
augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s)
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying code actions to the selected code block
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>aw  <Plug>(coc-codeaction-selected)

"" Remap keys for applying code actions at the cursor position
"nmap <leader>ac  <Plug>(coc-codeaction-cursor)
"" Remap keys for apply code actions affect whole buffer
"nmap <leader>as  <Plug>(coc-codeaction-source)
"" Apply the most preferred quickfix action to fix diagnostic on the current line
"nmap <leader>qf  <Plug>(coc-fix-current)
"
"" Remap keys for applying refactor code actions
"nmap <silent> <leader>re <Plug>(coc-codeaction-refactor)
"xmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"nmap <silent> <leader>r  <Plug>(coc-codeaction-refactor-selected)
"
"" Run the Code Lens action on the current line
"nmap <leader>cl  <Plug>(coc-codelens-action)
"
"" Map function and class text objects
"" NOTE: Requires 'textDocument.documentSymbol' support from the language server
"xmap if <Plug>(coc-funcobj-i)
"omap if <Plug>(coc-funcobj-i)
"xmap af <Plug>(coc-funcobj-a)
"omap af <Plug>(coc-funcobj-a)
"xmap ic <Plug>(coc-classobj-i)
"omap ic <Plug>(coc-classobj-i)
"xmap ac <Plug>(coc-classobj-a)
"omap ac <Plug>(coc-classobj-a)

"" Remap <C-f> and <C-b> to scroll float windows/popups
"if has('nvim-0.4.0') || has('patch-8.2.0750')
"  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
"  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
"  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
"  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
"endif

"" Use CTRL-S for selections ranges
"" Requires 'textDocument/selectionRange' support of language server
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)
"
" Add `:Format` command to format current buffer
command! -nargs=0 Format :call CocActionAsync('format')

"" Add `:Fold` command to fold current buffer
"command! -nargs=? Fold :call     CocAction('fold', <f-args>)
"
"" Add `:OR` command for organize imports of the current buffer
"command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
"
" Add (Neo)Vim's native statusline support
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

"" Mappings for CoCList
"" Show all diagnostics
"nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
"" Manage extensions
"nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
"" Show commands
"nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
"" Find symbol of current document
"nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
"" Search workspace symbols
"nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
"" Do default action for next item
"nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
"" Do default action for previous item
"nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
"" Resume latest coc list
"nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>


if executable('clipboard-provider')
    let g:clipboard = {
          \ 'name': 'myClipboard',
          \     'copy': {
          \         '+': 'clipboard-provider copy',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider copy',
          \     },
          \     'paste': {
          \         '+': 'clipboard-provider paste',
          \         '*': 'env COPY_PROVIDERS=tmux clipboard-provider paste',
          \     },
          \ }
endif

