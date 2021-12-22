set nocompatible

filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-scripts/a.vim'
Plugin 'Raimondi/delimitMate'
Plugin 'vim-latex/vim-latex'
Plugin 'Yggdroot/indentLine'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'webdevel/tabulous'
Plugin 'rhysd/vim-clang-format'
Plugin 'szw/vim-tags'
Plugin 'majutsushi/tagbar'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

call vundle#end()

filetype plugin indent on

" --- General Settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
syntax on
set mouse=a
hi clear SignColumn
set shiftwidth=4
set tabstop=4
set expandtab
set nofoldenable
set splitbelow
set splitright
let g:tex_conceal=''

" --- Plugin Settings ---
"vim-colors-solarized
set background=light
let g:solarized_termcolors=256
colorscheme solarized

"vim-airline
set laststatus=2
let g:airline_detect_paste=1
let g:airline#extensions#tabline#enables=1
let g:airline_theme='solarized'

"vim-nerdtree-tabs
nmap <silent> <leader>t :NERDTreeTabsToggle<CR>
let NERDTreeShowLineNumbers=1
autocmd FileType nerdtree setlocal relativenumber
"let g:nerdtree_tabs_open_on_console_startup = 1


""syntastic settings
"let g:syntastic_error_symbol = '✘'
"let g:syntastic_warning_symbol = "▲"
"augroup mySyntastic
"  au!
"  au FileType tex let b:syntastic_mode = "passive"
"augroup END


"delimitMate
let delimitMate_expand_cr = 1
augroup mydelimitMate
    au!
    au FileType markdown let b:delimitMate_nesting_quotes = ["`"]
    au FileType tex let b:delimitMate_quotes = ""
    au FileType tex let b:delimitMate_matchpairs = "(:),[:],{:},`:'"
    au FileType python let b:delimitMate_nesting_quotes = ['"',"'"]
augroup END

"vim-latex
:let Tex_FoldedSections=""
:let Tex_FoldedEnvironments=""
:let Tex_FoldedMisc=""

"clang-format
autocmd FileType h,hpp,c,cpp nnoremap <buffer><Leader>cf :<C-u>ClangFormat<CR>
autocmd FileType h,hpp,c,cpp vnoremap <buffer><Leader>cf :ClangFormat<CR>
nmap <Leader>C :ClangFormatAutoToggle<CR>

"tagbar
nmap <F8> :TagbarToggle<CR>

"fix for ctags
nnoremap <c-]> g<c-]> 
vnoremap <c-]> g<c-]> 

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   "rg --column --line-number --no-heading --color=always --smart-case -- ".shellescape(<q-args>), 1,
  \   fzf#vim#with_preview('up', 'ctrl-/'), <bang>0)
