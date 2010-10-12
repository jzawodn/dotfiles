set tabstop=4      " tabs
set softtabstop=4  " tabs
set shiftwidth=4   " indent level
set textwidth=72   " for text files, wrap here
set hlsearch       " hilight search matches
set backup         " backup files are good
set bg=dark        " I like dark terms, to pick a good color scheme
set number         " line numbers
set numberwidth=5  " line number gutter width
set autoindent     " testing
set cindent        " testing
set smartindent    " testing
set hidden         " make buffers stick around
syntax on

set t_Co=256       " force 256 color mode(s)

" make line number dimmer
highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
nnoremap <F5> :buffers<CR>:buffer<Space>

" colorscheme 256-jungle
" colorscheme ir_black
" colorscheme desert
colorscheme darkblue
