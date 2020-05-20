call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'jceb/vim-orgmode'
Plug 'tpope/vim-surround'
Plug 'mcchrish/nnn.vim'
Plug 'airblade/vim-gitgutter' 
Plug 'rakr/vim-one'
Plug 'arcticicestudio/nord-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'valloric/youcompleteme'
Plug 'vim-scripts/vim-auto-save'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'Badacadabra/vim-archery'
Plug 'wadackel/vim-dogrun'
Plug 'cocopon/iceberg.vim'
Plug 'kristijanhusak/vim-hybrid-material'
Plug 'mhartington/oceanic-next'
Plug 'kyoz/purify'
Plug 'rakr/vim-colors-rakr'
Plug 'liuchengxu/space-vim-dark'
Plug 'rakr/vim-two-firewatch'
"Plug ''
call plug#end()

let g:auto_save = 1
let g:auto_save_no_updatetime = 1
let g:auto_save_silent = 1
let g:airline_theme='one'
"'bubblegum'

syntax enable
colorscheme one

set expandtab
set shiftwidth=4
set tabstop=4

set ignorecase smartcase
set clipboard=unnamed
set t_Co=256
set cursorline
if exists('+termguicolors')
  set termguicolors
endif

augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set nu rnu

set splitbelow splitright
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

noremap <silent> <C-Left> :vertical resize -3<CR>
noremap <silent> <C-Right> :vertical resize +3<CR>
noremap <silent> <C-Up> :resize +3<CR>
noremap <silent> <C-Down> :resize -3<CR>

" move line up and down c. s. up , down
function! s:swap_lines(n1, n2)
    let line1 = getline(a:n1)
    let line2 = getline(a:n2)
    call setline(a:n1, line2)
    call setline(a:n2, line1)
endfunction

function! s:swap_up()
    let n = line('.')
    if n == 1
        return
    endif

    call s:swap_lines(n, n - 1)
    exec n - 1
endfunction

function! s:swap_down()
    let n = line('.')
    if n == line('$')
        return
    endif

    call s:swap_lines(n, n + 1)
    exec n + 1
endfunction

"noremap <silent> <c-k> :call <SID>swap_up()<CR>
"noremap <silent> <c-j> :call <SID>swap_down()<CR>

command! WipeReg for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor
