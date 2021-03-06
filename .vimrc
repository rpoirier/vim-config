" Whitespace Settings ---------------------------------------------------------
" --Use these regardles of tab vs space preference 
set tabstop=4     " sets tab width to 4 spaces
set softtabstop=4 " tab stops every 4 spaces & backspace removes 4 spaces

" --Enable for spaces, comment out for tabs
set expandtab     " tab key inserts spaces instead

" Highlights trailing whitespace
autocmd InsertEnter * syn clear EOLWS | syn match EOLWS excludenl /\s\+\%#\@!$/
autocmd InsertLeave * syn clear EOLWS | syn match EOLWS excludenl /\s\+$/
highlight EOLWS ctermbg=red guibg=red

" Indentation settings --------------------------------------------------------
set shiftwidth=4  " sets width for reindent and autoindent
set autoindent    " autoindents to same indentation as previous line
filetype plugin indent on   "indent config files at ~/.vim/after/ftplugin

" UI Tweaks -------------------------------------------------------------------
syntax on                   " enable syntax highlighting
set t_Co=256                " use 256 colors instead of default 16
set number                  " show line numbers
set background=light        " use default highlight colors for light background
set showmatch               " highlight matching [{()}]
set hlsearch                " highlight search matches
hi Search ctermfg=Black     " search highlight color
set ignorecase              " prerequisite for smartcase to work as desired
set smartcase               " searching in all one case is case insensitive
set scrolloff=10            " keep the cursor centered when scrolling 
set visualbell              " use visual bell instead of beeping
set t_vb=                   " disable visual bell, so no beep or flash
set lazyredraw              " only redraw when necessary, for colorcolumn
set mouse=a                 " enables scrolling and cursor placement with mouse

" Statusline settings
set laststatus=2
set statusline=%F               " displays file name
set statusline+=%10((%l,%c)%)\  " displays line & column numbers

" Column 80 marker
"if exists('+colorcolumn')
"    highlight ColorColumn ctermbg=gray
"    set colorcolumn=80      " visually indicate column 80 if ver >= 7.3

" Syntax highlighting settings for obscure file types
autocmd BufNewFile,BufRead *.cmp set filetype=mason
autocmd BufNewFile,BufRead *.xmp set filetype=mason
autocmd BufNewFile,BufRead *.bml set filetype=mason

" Mappings & Rebinds
" --allows saving with W when you inevitably forgot to run vim with sudo
command W w !sudo tee >/dev/null %
" --allows use of ; as : to save a shift press in command mode
nore ; :
" '*' in visual mode searches for selected text
vnoremap * y/<C-r>"<CR>
" ctrl+space for autocomplete
inoremap <C-space> <C-x><C-n>
" center cursor position after paging up or down
noremap <PageUp> <PageUp>M
noremap <PageDown> <PageDown>M
" leader+p - paste in selection without replacing "-buffer
vnoremap <Leader>p "_dP

" F1 opens Vim help by default
" ----------------------------
" F2 toggles paste mode on/off
set pastetoggle=<F2>
" F3 toggles mouse on/off
map <F3> :exec &mouse!="" ? "set mouse=" : "set mouse=a"<CR>
" F4 ---------------------
" ------------------------

" F5 saves the session to be restored later with vim -S
map <F5> :mksession<CR>
" F6 ---------------------
" ------------------------
" F7 toggles spell-check
map <F7> :set spell! spelllang=en_us<CR>
" F8 clears highlighting
map <F8> :noh<CR>

" F9 toggles line numbers on/off
map <F9> :set number!<CR>
" F10 toggles relative line numbers
map <F10> :set relativenumber!<CR>
" F11 --------------------
" ------------------------
" F12 --------------------
" ------------------------

" Plugin settings ------------------------------------------------------------- 
" --github.com/airblade/vim-gitgutter
"
" --github.com/scrooloose/nerdcommenter
" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'
