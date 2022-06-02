set number
syntax on
set title
let mapleader="\<space>"
inoremap jj <ESC>
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set hlsearch
set splitbelow
set mouse=a
set ignorecase
set smartcase

"clipboard
" set clipboard&
" set clipboard^=unnamedplus
set clipboard=unnamed
let g:clipboard = {
      \   'name': 'win32yank-wsl',
      \   'copy': {
      \      '+': '/home/kawakami/win_cmd/win32yank.exe -i --crlf',
      \      '*': '/home/kawakami/win_cmd/win32yank.exe -i --crlf',
      \    },
      \   'paste': {
      \      '+': '/home/kawakami/win_cmd/win32yank.exe -o --lf',
      \      '*': '/home/kawakami/win_cmd/win32yank.exe -o --lf',
      \   },
      \   'cache_enabled': 0,
      \ }
set nocompatible

filetype off
let iCanHazPlugVim=1
let vim_plug_file=expand('~/.local/share/nvim/autoload/plug.vim')
if !filereadable(vim_plug_file)
    silent !mkdir -p ~/.local/share/nvim/autoload
    silent !curl -fLo ~/.local/share/nvim//autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let iCanHazPlugVim=0
endif 

call plug#begin('~/.local/share/nvim/plugged')

Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'terryma/vim-multiple-cursors'
Plug 'iamcco/markdown-preview.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'preservim/tagbar'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'mattn/vim-goimports'
Plug 'Dimercel/todo-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'yuezk/vim-js'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'cespare/vim-toml'
Plug 'previm/previm'
Plug 'skanehira/translate.vim'
Plug 'tomlion/vim-solidity'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
Plug 'yazgoo/yank-history'
Plug 'vim-python/python-syntax'
Plug 'evanleck/vim-svelte'
Plug 'pangloss/vim-javascript'
Plug 'jparise/vim-graphql'
Plug 'nathanaelkane/vim-indent-guides'
call plug#end()

set encoding=UTF-8

if iCanHazPlugVim == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PlugInstall
endif

syntax enable
filetype plugin indent on

" Set options for colorscheme
set t_Co=256
set background=dark
colorscheme PaperColor 

" Set options for airline
let g:airline_theme = 'badwolf'
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

" Set options for gitgutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)

" Set Option for auto-pairs
let g:AutoPairsShortcutToggle = '<C-P>'

" Set Option for NERDTree
let NERDTreeShowBookmarks = 1   " Show the bookmarks table
let NERDTreeShowHidden = 1      " Show hidden files
let NERDTreeShowLineNumbers = 0 " Hide line numbers
let NERDTreeMinimalMenu = 1     " Use the minimal menu (m)
let NERDTreeWinSize = 31        " Set panel width to 31 columns
nmap <F2> :NERDTreeToggle<CR>

" Set options for NERDTree-git-Plugins
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

" Set Option for tagber
 " Focus the panel when opening it
let g:tagbar_autofocus = 1
 " Highlight the active tag
let g:tagbar_autoshowtag = 1
 " Make panel vertical and place on the right
let g:tagbar_position = 'botright vertical'
 " Mapping to open and close the panel
nmap <F8> :TagbarToggle<CR>
" tagbar setting for golang
let g:tagbar_type_go = {
        \ 'ctagstype' : 'go',
        \ 'kinds'     : [
                \ 'p:package',
                \ 'i:imports:1',
                \ 'c:constants',
                \ 'v:variables',
                \ 't:types',
                \ 'n:interfaces',
                \ 'w:fields',
                \ 'e:embedded',
                \ 'm:methods',
                \ 'r:constructor',
                \ 'f:functions'
        \ ],
        \ 'sro' : '.',
        \ 'kind2scope' : {
                \ 't' : 'ctype',
                \ 'n' : 'ntype'
        \ },
        \ 'scope2kind' : {
                \ 'ctype' : 't',
                \ 'ntype' : 'n'
        \ },
        \ 'ctagsbin'  : 'gotags',
        \ 'ctagsargs' : '-sort -silent'
\ }
let g:tagbar_type_rust = {
\ 'ctagstype' : 'rust',
\ 'kinds' : [
    \'T:types,type definitions',
    \'f:functions,function definitions',
    \'g:enum,enumeration names',
    \'s:structure names',
    \'m:modules,module names',
    \'c:consts,static constants',
    \'t:traits',
    \'i:impls,trait implementations',
\]
\}
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }
" let g:rust_use_custom_ctags_defs = 1  " if using rust.vim
" let g:tagbar_type_rust = {
"   \ 'ctagsbin' : '/path/to/your/universal/ctags',
"   \ 'ctagstype' : 'rust',
"   \ 'kinds' : [
"       \ 'n:modules',
"       \ 's:structures:1',
"       \ 'i:interfaces',
"       \ 'c:implementations',
"       \ 'f:functions:1',
"       \ 'g:enumerations:1',
"       \ 't:type aliases:1:0',
"       \ 'v:constants:1:0',
"       \ 'M:macros:1',
"       \ 'm:fields:1:0',
"       \ 'e:enum variants:1:0',
"       \ 'P:methods:1',
"   \ ],
"   \ 'sro': '::',
"   \ 'kind2scope' : {
"       \ 'n': 'module',
"       \ 's': 'struct',
"       \ 'i': 'interface',
"       \ 'c': 'implementation',
"       \ 'f': 'function',
"       \ 'g': 'enum',
"       \ 't': 'typedef',
"       \ 'v': 'variable',
"       \ 'M': 'macro',
"       \ 'm': 'field',
"       \ 'e': 'enumerator',
"       \ 'P': 'method',
"   \ },
" \ }
" Set Option for coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> <Leader>p :call CocAction('diagnosticPrevious')<CR>
nmap <silent> <Leader>n :call CocAction('diagnosticNext')<CR>
nnoremap <silent> <Leader>F :Files<CR>
nnoremap <silent> <Leader>f :Rg<CR>
command! -bang -nargs=* Rg call fzf#vim#grep("rg --column --line-number --no-heading --color=always --smart-case ".shellescape(<q-args>), 1, {'options': '--delimiter : --nth 4..'}, <bang>0)

" Golang settings
" nmap <silent> gd :LspDefinition<CR>
" nmap <silent> <Leader><f2> :LspRename<CR>
" nmap <silent> <F5> :LspNextError<CR> 
" nmap <silent> <F6> :LspPreviousError<CR> 
" nmap <silent> <Leader>d :LspTypeDefinition<CR>
" nmap <silent> <Leader>r :LspReferences<CR>
" nmap <silent> <Leader>i :LspImplementation<CR>
" let g:lsp_diagnostics_enabled = 1
" let g:lsp_diagnostics_echo_cursor = 1
" let g:asyncomplete_auto_popup = 1
" let g:asyncomplete_popup_delay = 200
" let g:lsp_text_edit_enabled = 0

" set Option for previm
let g:previm_open_cmd = 'brave'
let g:previm_wsl_mode = 1

"set Option for yank-history
nmap <silent> <Leader>h :YankHistoryRgPaste

"set Option for python syntax
let g:python_highlight_all = 1

"set Option for vim-indent-guides
let g:indent_guides_enable_on_vim_startup = 0

"Set Options for vim-go Syntax highlight
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions =1
let g:go_highlight_function_calls = 1

