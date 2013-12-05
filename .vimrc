let mapleader = ","

set tabstop=4      " tabs defualt to 4 spaces
set softtabstop=4  " tabs default to 4 spaces
set expandtab      " make them spaces
"set noexpandtab    " don't make them spaces
set shiftwidth=4   " indent level
set textwidth=72   " for text files, wrap here
set hlsearch       " hilight search matches
set backup         " backup files are good
set number         " line numbers
set numberwidth=5  " line number gutter width
set autoindent     " testing
set cindent        " testing
"set smartindent    " indent intelligently
set hidden         " make buffers stick around
set showmode       " tell me what mode I'm in
set wildmenu       " completion of commands at :
set smartcase      " search case senitively if caps in search string
set ttyfast        " because I'm not on dialup
set ruler          " to know where I am
set modeline
set modelines=5
set cursorline     " show the line I'm on

" make sure tab compltion isn't overly agressive
set wildmode=longest,full

" fix indenting of comments, see http://stackoverflow.com/questions/191201/indenting-comments-
filetype plugin indent on
syntax enable

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

" pathogen
execute pathogen#infect()

" some vim aliases
nnoremap <leader>gs :Gstatus<cr>
nnoremap <leader>gd :Gdiff<cr>
nnoremap <leader>gcf :Gcommit<cr>
nnoremap <leader>gca :Gcommit -a<cr>
nnoremap <leader>gg :!git pull origin master<cr>
nnoremap <leader>gf :!git fetch<cr>
nnoremap <leader>gp :!git push<cr>
nnoremap <leader>pt :%!perltidy -pt=2 -sot -q<cr>
nnoremap <leader>pz :%!perltidy -pt=2 -sot -et=4 -q<cr>
nnoremap <leader>, :b#<cr>
nnoremap <leader>d :NERDTreeToggle<cr>

set guioptions-=T  "remove toolbar

" buffer list via F5
nnoremap <F5> :buffers<CR>:buffer<Space>

if has('gui_running')
    "set background=light
    "set background=dark
    set guifont=Monaco:h12
    "set guifont=Monaco:h14
    "set guifont=Source\ Code\ Pro:h16
    colorscheme torte
    "colorscheme zellner
else
    set t_Co=256       " force 256 color mode(s)
    set background=dark
    "colorscheme darkblue
    highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
endif

highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
" e scp://user@vmdev/git/clol/lib/perl/CLOL/Indexer/LiveSphinx.pm
