"          __
"  __  __ /\_\    ___ ___   _ __   ___
" /\ \/\ \\/\ \ /' __` __`\/\`'__\/'___\
" \ \ \_/ |\ \ \/\ \/\ \/\ \ \ \//\ \__/
"  \ \___/  \ \_\ \_\ \_\ \_\ \_\\ \____\
"   \/__/    \/_/\/_/\/_/\/_/\/_/ \/____/
"
set fileencoding=utf-8
set fileencodings=ucs-boms,utf-8,euc-jp,cp932
set fileformats=unix,dos,mac
set nobackup
set noswapfile
set autoread
set showcmd
set hidden
set list listchars=tab:\▸\-
set ambiwidth=double
let $LANG = 'en'
set clipboard+=unnamed
set tabstop=2
set softtabstop=2
set autoindent
set smartindent
set shiftwidth=2
set incsearch
set ignorecase
set smartcase
set hlsearch
set autochdir
set number
syntax enable
set nocompatible
set diffopt+=vertical
inoremap <silent> jj <ESC>
nnoremap j gj
nnoremap k gk
nnoremap <down> gj
nnoremap <up> gk
set backspace=indent,eol,start
set showmatch
source $VIMRUNTIME/macros/matchit.vim
set wildmenu
set history=100
inoremap " ""<left>
inoremap ' ''<LEFT>
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>
inoremap {<Enter> {}<Left><CR><ESC><S-o>
inoremap [<Enter> []<Left><CR><ESC><S-o>
inoremap (<Enter> ()<Left><CR><ESC><S-o>
inoremap <c-h> <LEFT>
inoremap <c-l> <RIGHT>
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
nmap <Space> <C-w>w
map s<left> <C-w>h
map s<up> <C-w>k
map s<down> <C-w>j
map s<right> <C-w>l
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
nmap <C-w><left> <C-w><
nmap <C-w><right> <C-w>>
nmap <C-w><up> <C-w>+
nmap <C-w><down> <C-w>-

if &term =~ "xterm"
    let &t_SI .= "\e[?2004h"
    let &t_EI .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")]
endif

call plug#begin()
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'airblade/vim-gitgutter'
Plug 'mattn/vim-goimports'
Plug 'itchyny/lightline.vim'
Plug 'altercation/vim-colors-solarized'
Plug 'cocopon/iceberg.vim'
Plug 'bronson/vim-trailing-whitespace'
Plug 'thinca/vim-quickrun'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

"LSP
function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> K <plug>(lsp-hover)
    nmap <buffer> <leader> <f2> <plug>(lsp-rename)
endfunction

augroup lsp_install
    au!
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:asyncomplete_auto_popup = 1
let g:asyncomplete_popup_delay = 200
let g:lsp_preview_float = 1
let g:lsp_diagnostics_float_cursor = 1
let g:lsp_text_edit_enabled = 1

let g:goimports_simplify = 1

let g:quickrun_config={'*': {'hook/time/enable': '1'},}
set splitright

set laststatus=2
set noshowmode
let g:lightline = {'colorscheme': 'iceberg'}
autocmd ColorScheme * highlight Normal ctermbg=none
autocmd ColorScheme * highlight LineNr ctermbg=none
set background=dark
colorscheme iceberg
