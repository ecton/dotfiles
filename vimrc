" Setup NeoBundle
if !1 | finish | endif

if has('vim_starting')
  set nocompatible

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Package List
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'kien/ctrlp.vim'
NeoBundle 'scrooloose/nerdtree'
NeoBundle 'bling/vim-airline'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundle 'scrooloose/nerdcommenter'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'ervandew/supertab'
NeoBundle 'Rip-Rip/clang_complete'

call neobundle#end()

filetype plugin indent on

NeoBundleCheck

" Enable syntax highlighting and colorscheme
syntax enable
set background=dark
let g:solarized_termcolors=256
colorscheme solarized

" Configure indent-guides
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1
set ts=2 sw=2 et
let g:indent_guides_auto_colors=0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd ctermbg=7
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven ctermbg=8

" Make the status line always visible
set laststatus=2

" Configure easy motion keys and settings
let g:EasyMotion_smartcase = 1
map / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)
map s <Plug>(easymotion-s2)
map t <Plug>(easymotion-t2)
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>h <Plug>(easymotion-linebackward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

let g:syntastic_scss_checkers = ['sass']


" Make insert mode toggleable with F2
set pastetoggle=<F2>

" Open NERDTree and shift focus to the main window again
"autocmd VimEnter * NERDTree
"autocmd VimEnter * wincmd l
" Close NERDTree if it's the only thing left open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q 
"
" Make vim rename the tmux window descriptively
autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " .  expand("%:t"))
