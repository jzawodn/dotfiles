let mapleader = ","

set tabstop=4      " tabs defualt to 4 spaces
set softtabstop=4  " tabs default to 4 spaces
set expandtab      " and make them spaces
set shiftwidth=4   " indent level
set textwidth=72   " for text files, wrap here
set hlsearch       " hilight search matches
set backup         " backup files are good
set bg=dark        " specify light or dark so colo scheme works
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
nnoremap <leader>pz :%!perltidy -pt=2 -sot -et=4 -q<cr>
nnoremap <leader>, :b#<cr>

set guioptions-=T  "remove toolbar

" buffer list via F5
nnoremap <F5> :buffers<CR>:buffer<Space>

" colorscheme 256-jungle
" colorscheme ir_black
" colorscheme desert
colorscheme darkblue
" colorscheme torte
" colorscheme darktango
" colorscheme tango

if has('gui_running')
    set background=light
    set guifont=Monaco:h12
    " colorscheme solarized
else
    " set t_Co=256       " force 256 color mode(s)
    set background=dark
    colorscheme darkblue
    highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
endif

" See: http://vim.wikia.com/wiki/Modeline_magic
"
" Append modeline after last line in buffer.
" Use substitute() instead of printf() to handle '%%s' modeline in LaTeX
" files.
function! AppendModeline()
  let l:modeline = printf(" vim: set ts=%d sw=%d tw=%d expandtab :",
        \ &tabstop, &shiftwidth, &textwidth)
  let l:modeline = substitute(&commentstring, "%s", l:modeline, "")
  call append(line("$"), l:modeline)
endfunction
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>
