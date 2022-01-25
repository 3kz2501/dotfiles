set number
syntax on
set title
set encoding=UTF-8
let mapleader="\<space>"
inoremap jj <ESC>
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>
nnoremap <silent> <Leader>+ :exe "resize " . (winheight(0) * 3/2)<CR>
nnoremap <silent> <Leader>- :exe "resize " . (winheight(0) * 2/3)<CR>
" set clipboard&
" set clipboard^=unnamedplus
set tabstop=4
set shiftwidth=4
set expandtab
set incsearch
set hlsearch
set termwinsize=12x0
set splitbelow
set mouse=a
set ignorecase
set smartcase

set nocompatible
filetype off
" NOTE: this config must be let before loading fzf.
" let g:fzf_layout = { 'window': {
"   \ 'width': 0.6,
"   \ 'height': 0.6,
"   \ 'border': 'ascii'
"   \ } }

" START - Setting up Vundle - the vim plugin bundler
" let iCanHazVundle=1
" let vundle_readme=expand('~/.vim/bundle/Vundle.vim/README.md')
" if !filereadable(vundle_readme)
"   silent !mkdir -p ~/.vim/bundle
"   silent !git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
"   let iCanHazVundle=0
" endif
let iCanHazPlugVim=1
let vim_plug_file=expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_file)
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let iCanHazPlugVim=0
endif 

" Set the runtime path to include Vundle and initialize
" set rtp+=~/.vim/bundle/Vundle.vim

" Download plug-ins to the ~/.vim/plugged/ directory
" call vundle#begin('~/.vim/plugged')

call plug#begin('~/.vim/plugged')

Plug 'VundleVim/Vundle.vim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-commentary'
Plug 'iamcco/markdown-preview.nvim'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'jiangmiao/auto-pairs'
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/tagbar'
Plug 'Shougo/unite.vim'
Plug 'Shougo/unite-outline'
Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
" Plugin 'prabirshrestha/vim-lsp'
" Plugin 'mattn/vim-lsp-settings'
" Plugin 'mattn/vim-lsp-icons'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'mattn/vim-goimports'
Plug 'Dimercel/todo-vim'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'cespare/vim-toml'
Plug 'previm/previm'
Plug 'skanehira/translate.vim'
Plug 'tomlion/vim-solidity'
Plug 'rust-lang/rust.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'} 
call plug#end()
" call vundle#end()

" let Vundle manage Vundle, required
if iCanHazPlugVim == 0
  echo "Installing Bundles, please ignore key map error messages"
  echo ""
  :PlugInstall
endif
" END - Setting up Vundle - the vim plugin bundler

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

" Set Option for coc.nvim
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
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
let g:previm_open_cmd = 'open -a Firefox'
