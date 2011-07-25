let mapleader = ","

set tabstop=4      " tabs defualt to 4 spaces
set softtabstop=4  " tabs default to 4 spaces
set noexpandtab    " but make them NOT spaces
set shiftwidth=4   " indent level
set textwidth=72   " for text files, wrap here
set hlsearch       " hilight search matches
set backup         " backup files are good
set bg=dark        " I like dark terms, to pick a good color scheme
set number         " line numbers
set numberwidth=5  " line number gutter width
set autoindent     " testing
set cindent        " testing
set smartindent    " indent intelligently
set hidden         " make buffers stick around
set showmode       " tell me what mode I'm in
set wildmenu       " completion of commands at :
set smartcase      " search case senitively if caps in search string
set ttyfast        " because I'm not on dialup

syntax on

" external text formatting command
"set formatprg=par

" some keymappings for split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" allow double-j to exit insert mode
inoremap jj <ESC>

" allow ; to act like :
nnoremap ; :

" F1 can blow me
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

" allow tab to jump to matching brace/paren/bracket
nnoremap <tab> %
vnoremap <tab> %

" clear out search using comma-space
nnoremap <leader><space> :noh<cr>

" some vim aliases
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gcf :Gcommit<cr>
nnoremap <leader>gca :Gcommit -a<cr>
nnoremap <leader>gg :!git pull origin master<cr>
nnoremap <leader>gf :!git fetch<cr>
nnoremap <leader>gp :!git push<cr>
nnoremap <leader>pt :%!perltidy -pt=2 -sot -q<cr>

set guioptions-=T  "remove toolbar

set t_Co=256       " force 256 color mode(s)

" make line number dimmer
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nnoremap <F5> :buffers<CR>:buffer<Space>

" colorscheme 256-jungle
" colorscheme ir_black
" colorscheme desert
colorscheme darkblue
" colorscheme torte
" colorscheme darktango
" colorscheme tango

"set gfn=Terminus\ 12 " gui font on linux
"set gfn=Monospace\ 12 " gui font on linux

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE

"set background=light
"colorscheme solarized
