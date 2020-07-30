set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin('~/.config/nvim/plugged')

"languages
"go
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"julia
Plug 'JuliaEditorSupport/julia-vim'

"python
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}              " py highlighting
Plug 'Vimjas/vim-python-pep8-indent'                                " indentation rules

"scala
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" tools
Plug 'junegunn/vim-easy-align'                                      " easy allign
Plug 'kien/rainbow_parentheses.vim'                               	" for nested parentheses
Plug 'tpope/vim-surround'                                         	" quickly edit surroundings (brackets, html tags, etc)
Plug 'iamcco/markdown-preview.vim'                                  " markdown prev
Plug 'ekalinin/dockerfile.vim'
Plug 'aolab/vim-avro'
Plug 'easymotion/vim-easymotion'
Plug 'tpope/vim-repeat'
Plug 'chun-yang/auto-pairs'
Plug 'tpope/vim-surround'                                           " quickly edit surroundings (brackets, html tags, etc)
Plug 'tpope/vim-fugitive'                                           " git plugin
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' } 	" fuzzy finder conf
Plug 'junegunn/fzf.vim'                                           	" fuzzy finder
Plug 'jremmen/vim-ripgrep'                                        	" blazing fast search using ripgrep
Plug 'scrooloose/nerdtree'						                              " folders tree
Plug 'Xuyuanp/nerdtree-git-plugin'                                	" shows files git status on the NerdTree
Plug 'liuchengxu/vista.vim'                                         " initialize tags of the current file
Plug 'dense-analysis/ale'                                           " async syntax check
Plug 'cespare/vim-toml'                                             " toml syntax hl
Plug 'GEverding/vim-hocon'                                          " hocon plug
Plug 'pearofducks/ansible-vim'

" visual
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'itchyny/lightline.vim'                                        " configurable status line (can be used by coc)
Plug 'chrisbra/vim-commentary'                                      " commenting out lines with gc & gcc & gcgc

call plug#end()
filetype plugin indent on

autocmd InsertLeave * write

"" custom
set hidden
let mapleader=','
set clipboard+=unnamedplus
set nobackup
set nowritebackup

set mouse=a
set number
set numberwidth=1           " Minimum line number column width.
set encoding=utf-8
set backspace=indent,eol,start
set cursorline
set nobackup
set nowritebackup
set formatoptions=jtcrq     " Sensible default line auto cutting and formatting.
set clipboard=unnamedplus   " Copy/Paste to/from clipboard
set laststatus=2
set backspace=2
set noshowmode

"" set guioptions=
syntax on
set guicursor=

"" set cmdline ui
set cmdheight=2
set colorcolumn=100
set updatetime=300
set shortmess+=c
set signcolumn=yes
set linebreak               " Don't cut lines in the middle of a word .
set showmatch               " Shows matching parenthesis.
set matchtime=2             " Time during which the matching parenthesis is shown.

"" indent for global
set expandtab
set shiftwidth=2
set autoindent
set tabstop=2
set softtabstop=2

" Toggle display of tabs and EOF
nnoremap <leader>l :set list!<CR>

"" search
set incsearch  " Incremental search.
set ignorecase " Case insensitive.
set smartcase  " Case insensitive if no uppercase letter in pattern, case sensitive otherwise.
set nowrapscan " Don't go back to first match after the last match is found.

" Fuzzy finder shortcut
nnoremap <leader>p :FZF<CR>

" airline: status bar at the bottom
let g:airline_powerline_fonts=1
" if you want to disable auto detect, comment out those two lines (COC)
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']
let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

"" NERDTree
filetype plugin on
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

" Nerdtree git plugin symbols
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "ᵐ",
    \ "Staged"    : "ˢ",
    \ "Untracked" : "ᵘ",
    \ "Renamed"   : "ʳ",
    \ "Unmerged"  : "ᶴ",
    \ "Deleted"   : "ˣ",
    \ "Dirty"     : "˜",
    \ "Clean"     : "ᵅ",
    \ "Unknown"   : "?"
    \ }

" Vista tag management
function! NearestMethodOrFunction() abort
  return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}

" If you want to show the nearest function in your statusline automatically,
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()


" whitespace
function! TrimWhitespace()
    let l:save_cursor = getpos('.')
    %s/\s\+$//e
    call setpos('.', l:save_cursor)
endfun

command! TrimWhitespace call TrimWhitespace() " Trim whitespace with command
autocmd BufWritePre * :call TrimWhitespace()  " Trim whitespace on every save

" Non-mapped function for tab toggles
function! TabToggle()
  if &expandtab
    set noexpandtab
  else
    set expandtab
  endif
endfunc

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign

" Nerdtree
map <C-a> :NERDTreeToggle<CR>
map <C-S> :NERDTreeFind<CR>


let g:NERDTreeDirArrowExpandable = '▸'
let g:NERDTreeDirArrowCollapsible = '▾'

let g:NERDTreeMinimalUI = 1
let g:NERDTreeDirArrows = 1

"" gruvbox
set t_Co=256
colorscheme gruvbox
let g:gruvbox_contrast_dark = 'soft'
hi Normal guibg=NONE ctermbg=NONE

"" search
" ripgrep smartcase (search with case insensitive)
let g:rg_command = 'rg --vimgrep -S'

"" line autocomplete
let g:indentLine_char = '│'
silent! call repeat#set("\<Plug>MyWonderfulMap", v:count)

"" coc
nnoremap <M->> <C-w>>

" Clear search highlighting
nnoremap <C-z> :nohlsearch<CR>

" Terminal mode exit shortcut
nnoremap <Esc> <C-\><C-n>

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" if you want to disable auto detect, comment out those two lines (COC)
let g:airline#extensions#disable_rtp_load = 1
let g:airline_extensions = ['branch', 'hunks', 'coc']

let g:airline_section_error = '%{airline#util#wrap(airline#extensions#coc#get_error(),0)}'
let g:airline_section_warning = '%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

"" Matkdown
" for normal mode
nmap <silent> <F8> <Plug>MarkdownPreview
" for insert mode
imap <silent> <F8> <Plug>MarkdownPreview
" for normal mode
nmap <silent> <F9> <Plug>StopMarkdownPreview
" for insert mode
imap <silent> <F9> <Plug>StopMarkdownPreview

let g:ale_linters_explicit = 1
let g:ale_sign_column_always = 1
let b:ale_linters = ['flake8', 'pylint', 'luac', 'luacheck']
let g:ale_sign_error = 'x'
let g:ale_sign_warning = '!'
let g:ale_set_highlights = 0
let g:airline#extensions#ale#enabled = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_lint_on_enter = 0
let b:ale_warn_about_trailing_whitespace = 0
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)

let g:ale_fixers = {
      \    'python': ['yapf'],
      \}
nmap <F10> :ALEFix<CR>
let g:ale_fix_on_save = 1

"" Python"
"semshi highlight
let g:semshi#filetypes = ['python']
let g:semshi#tolerate_syntax_errors = v:true
let g:semshi#always_update_all_highlight = v:false
let g:semshi#update_delay_factor = 0.001
let g:semshi#self_to_attribute = v:true

" pep8 indent
let python_pep8_indent_hang_closing = 1

au BufNewFile,BufRead *.py
    \ set expandtab       |" replace tabs with spaces
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4

au BufNewFile,BufRead *.py
    \ set foldmethod=indent

nnoremap <space> za

"" JSON
" Highlighting for jsonc filetype
autocmd FileType json syntax match Comment +\/\/.\+$+

"" July
runtime macros/matchit.vim

""coc
au BufRead,BufNewFile *.sbt,*.sc set filetype=scala

let g:coc_global_extensions = [
      \ 'coc-python',
      \ 'coc-jedi',
      \ 'coc-json',
      \ 'coc-yaml'
      \]

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Used in the tab autocompletion for coc
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)
"
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
   if (index(['vim','help'], &filetype) >= 0)
       execute 'h '.expand('<cword>')
   else
       call CocAction('doHover')
   endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType scala setl formatexpr=CocAction('formatSelected')
    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call CocAction('fold',<f-args>)

" Trigger for code actions
" Make sure `"codeLens.enable": true` is set in your coc config
nnoremap <leader>cl :<C-u>call CocActionAsync('codeLensAction')<CR>

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Reveal current current class (trait or object) in Tree View 'metalsBuild'
nnoremap <silent> <space>tf :<C-u>CocCommand m
