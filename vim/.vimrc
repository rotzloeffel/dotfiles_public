set nocompatible " this is redundant, but I prefer explicit settings over implicit/default behavior

"""""""""""""""""
"Encoding & Font"
"""""""""""""""""
set encoding=utf-8

"""""""""
"Plugins"
"""""""""
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()

Plug 'arcticicestudio/nord-vim'

Plug 'https://github.com/ackyshake/VimCompletesMe.git'

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }

Plug 'itchyny/lightline.vim'

Plug 'yuttie/comfortable-motion.vim'

Plug 'https://github.com/lilydjwg/colorizer'

Plug 'vimwiki/vimwiki'

Plug 'jiangmiao/auto-pairs'

Plug 'mbbill/undotree'

Plug 'preservim/nerdcommenter'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -l -g ""'

Plug 'dense-analysis/ale'

Plug 'sheerun/vim-polyglot'

Plug 'mhinz/vim-startify'

Plug 'https://github.com/nathanaelkane/vim-indent-guides'
let g:indent_guides_enable_on_vim_startup = 0
let g:indent_guides_auto_colors = 0

Plug 'junegunn/goyo.vim'
let g:goyo_width = 100   " (default: 80)
"let g:goyo_height       " (default: 85%)
let g:goyo_linenr = 0    " (default: 0)

Plug 'voldikss/vim-floaterm'

Plug 'https://github.com/frazrepo/vim-rainbow'
let g:rainbow_active = 1

Plug 'https://tpope.io/vim/fugitive.git'

if has('nvim') || has('patch-8.0.902')
  Plug 'mhinz/vim-signify'
else
  Plug 'mhinz/vim-signify', { 'branch': 'legacy' }
endif
" default updatetime 4000ms is not good for async update
set updatetime=100

Plug 'liuchengxu/vim-which-key'

Plug 'godlygeek/tabular'

Plug 'ptzz/lf.vim'

call plug#end()

""""""""""""""""""
" Cursor & Mouse "
""""""""""""""""""
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set mouse-=a                      " Disable visual-mode mouse select
set ttymouse=sgr
set guicursor+=a:blinkon0         " Enable blinking cursor
"""""""""""""
" Clipboard "
"""""""""""""
set clipboard=unnamedplus
"for OSX & Windows users
"set clipboard=unnamed

""""""""""""""
"Autocommands"
""""""""""""""

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif

" Stop commenting the next line
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Set filetypes
au BufRead,BufNewFile Vagrantfile set filetype=Vagrant
au FileType Vagrant setl syntax=ruby
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
au BufNewFile,BufRead .gitconfig.* setf gitconfig
au BufRead,BufNewFile *mutt-* setfiletype mail
au BufRead,BufNewFile *.md set filetype=vimwiki

"""""""""""""""
" Options "
"""""""""""""""
set modifiable
set autoread                    " reload files when changed on disk, i.e. via `git checkout`
set cmdheight=1
set nofoldenable                "makes sure that files are not folded when opening
set foldmethod=manual
" Search down into subfolders
set path+=**
set ic
" Print syntax highlighting.
set printoptions+=syntax:y
set lazyredraw
set noerrorbells
set novisualbell
set t_vb=
set noeb vb t_vb=
set number relativenumber
set nocursorline                " when enabled scolling gets slow
set nocursorcolumn              " when enabled scolling gets slow
set colorcolumn=80              " show right margin
set noswapfile                  " disable creating swapfiles
set backup                      " keep a backup
set backupskip=/tmp/*,/private/tmp/*" " Do not back up temporary files.
if !isdirectory($HOME."/backup/vim")
    silent! execute "!mkdir $HOME/backup/vim"
endif
set backupdir=$HOME/backup/vim
"not generate .swap
set noswapfile

" Let's save undo info!
if !isdirectory($HOME."/.vim")
    call mkdir($HOME."/.vim", "", 0770)
endif
if !isdirectory($HOME."/.vim/undo-dir")
    call mkdir($HOME."/.vim/undo-dir", "", 0700)
endif
set undodir=~/.vim/undo-dir
set undofile

" stop complaints about switching buffer with changes
set hidden

" always show signcolumns
set signcolumn=yes

set wildmode=longest,list,full

" Disable automatically wrap text that extends beyond the screen length.
set nowrap

" Uncomment below to set the max textwidth. Use a value corresponding to the width of your screen.
set textwidth=100
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround
set autoindent

" Display 5 lines above/below the cursor when scrolling with a mouse.
set scrolloff=5
set sidescrolloff=5

" Helps force plug-ins to load correctly when it is turned back on below.
filetype on

" Turn on syntax highlighting.
syntax on

" For plug-ins to load correctly.
filetype plugin indent on

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Disable showing unvisible character like carriage return or end of line
set listchars=tab:►\ ,trail:·,precedes:«,extends:»,eol:¶
set nolist
set laststatus=2
set noshowmode
set background=dark

" Do not jump to first character with page commands.
set nostartofline

" Reduce timeout
set timeoutlen=500

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch

" Enable incremental search
set incsearch

" Include matching uppercase words with lowercase search term
set ignorecase

" Include only uppercase words with uppercase search term
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data. Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Clear the last search pattern (temporarily disable search highlighting)
let @/ = ""

"""""""
"Theme"
"""""""
" Inspect $TERM instad of t_Co
if &term =~ '256color'
  " Enable true (24-bit) colors instead of (8-bit) 256 colors.
  if has('termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
  endif
  colorscheme nord
endif

"""""""""""""""""""""""""
"  lightline status bar "
"""""""""""""""""""""""""
"minimal info on narrow splits
let g:lightline = {
      \'component_function': { 'lineinfo': 'LightlineLineinfo', }
      \}

function! LightlineLineinfo() abort
    if winwidth(0) < 86
        return ''
    endif
    let l:current_line = printf('%-3s', line('.'))
    let l:max_line = printf('%-3s', line('$'))
    let l:lineinfo = ' ' . l:current_line . '/' . l:max_line
    return l:lineinfo
endfunction

"remove readonly in help window
let g:lightline = {
      \ 'component_function': {
      \   'readonly': 'LightlineReadonly',
      \ },
      \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" no statusline in nerdtree window
augroup filetype_nerdtree
    au!
    au FileType nerdtree call s:disable_lightline_on_nerdtree()
    au WinEnter,BufWinEnter,TabEnter * call s:disable_lightline_on_nerdtree()
augroup END

fu s:disable_lightline_on_nerdtree() abort
    let nerdtree_winnr = index(map(range(1, winnr('$')), {_,v -> getbufvar(winbufnr(v), '&ft')}), 'nerdtree') + 1
    call timer_start(0, {-> nerdtree_winnr && setwinvar(nerdtree_winnr, '&stl', '%#Normal#')})
endfu

" Available colors are: one solarized wombat papercolor everforest gruvbox || Each has a dark and
" light version according to the set background option. || default is powerline
let g:lightline = {
      \ 'colorscheme': 'one',
      \ 'active': {
      \ 'left': [ [ 'mode' ], [ 'readonly', 'absolutepath', 'modified' ] ],
      \ 'right': [ [ 'lineinfo' ],[ 'percent' ],[ 'filetype'] ] },
      \ 'component': {
      \ 'charvaluehex': '0x%B'
      \ },
      \ }

""""""""""""""""""""""""
"Settings for syntastic"
""""""""""""""""""""""""
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_auto_jump = 3
highlight SyntasticErrorSign ctermfg=red ctermbg=yellow
highlight SyntasticErrorLine ctermbg=black

"lf file manager
let g:lf_map_keys = 0
let g:lf_width = 50
let g:lf_height = 50

"""""""""""""""""""
" Custom Mappings "
"""""""""""""""""""
let mapleader =" "
nnoremap <silent> <leader>n :NERDTreeToggle <CR>
nnoremap <silent> <leader>r :FloatermNew lf <CR>
nnoremap <leader>. :source % <CR>
nnoremap <silent> <leader>t :tabnew file <CR>
nnoremap <silent> <leader>d :g/^\(.*\)$\n\1/d<CR>
nnoremap <silent> <leader>i :IndentGuidesToggle <CR>
nnoremap <silent> <leader>s :Startify <CR>
nnoremap <silent> <leader>g :Goyo <CR>
nnoremap <silent> <leader>u :UndotreeToggle <CR>
nnoremap <silent> <leader>a= :Tabularize /= <CR>
nnoremap <silent> <leader>a- :Tabularize /- <CR>
nnoremap <silent> <leader>a: :Tabularize /: <CR>
nnoremap <silent> <leader>a# :Tabularize /# <CR>
" Horizontal split then move to bottom window.
nnoremap <Leader>- <C-w>s
" Vertical split then move to right window.
nnoremap <Leader>\| <C-w>v<C-w>l
" Cycle tabs with Tab and Shift+Tab
nnoremap <silent> <Tab> :bnext<CR>
nnoremap <silent> <S-Tab> :bprevious<CR>
" Kill buffer with Space+bk
nnoremap <silent> <Space>bk :bdelete<CR>
inoremap jj <esc>

" Reselect text ater indent/unindent.
vnoremap < <gv
vnoremap > >gv
" Tab to indent in visual mode.
vnoremap <Tab> >gv
" Shift+Tab to unindent in visual mode.
vnoremap <S-Tab> <gv

" Text alignment
nnoremap <Leader>al :left<CR>
nnoremap <Leader>ac :center<CR>
nnoremap <Leader>ar :right<CR>
vnoremap <Leader>al :left<CR>
vnoremap <Leader>ac :center<CR>
vnoremap <Leader>ar :right<CR>

" 'W' to write readonly files
command! W execute 'w !doas -- tee % > /dev/null' <bar> edit!

" Exit vim
nmap <Leader>q :q<CR>

" Quickly remove highlights
map <silent> <esc> :noh<CR>

" Copy whole file
nnoremap <Leader>y :%y<CR>

" Quick save
nmap <leader>w :w!<CR>

" Copy and paste text to wayland clipboard. wl-clipboard is needed
xnoremap <silent> <C-y> y:call system("wl-copy", @")<cr>
nnoremap <silent> <C-p> :let @"=substitute(system("wl-paste --no-newline"), '<C-v><C-m>', '', 'g')<cr>p
nnoremap <silent> <C-P> :let @"=substitute(system("wl-paste --no-newline --primary"), '<C-v><C-m>', '', 'g')<cr>p

" Easy window splits
nnoremap <silent> vv <C-w>v
nnoremap <silent> ss <C-w>s

" Quickly open a new file
nnoremap <silent> vn :vnew<CR>
nnoremap <silent> sn :new<CR>

"""""""""""""""
" Keybindings "
"""""""""""""""
set splitbelow splitright
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <C-LEFT> <C-w>h
map <C-DOWN> <C-w>j
map <C-UP> <C-w>k
map <C-RIGHT> <C-w>l

map <s-LEFT> :vertical resize +5 <Cr>
map <s-RIGHT> :vertical resize -5 <Cr>
map <s-UP> :resize +5 <Cr>
map <s-DOWN> :resize -5 <Cr>

nnoremap <M-Left> :tabprevious<CR>
nnoremap <M-Right> :tabnext<CR>

"Keybindings for tab navigation with leader and number
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt
noremap <leader>5 5gt
noremap <leader>6 6gt
noremap <leader>7 7gt
noremap <leader>8 8gt
noremap <leader>9 9gt
noremap <leader>0 :tablast<cr>
nnoremap <leader>x :tabclose<Cr>
map <leader>tm :tabmove<Cr>
map <leader>c :Colors<Cr>
map <leader>b :Buffers<Cr>
map <leader>f :Files<Cr>
map <leader>W :Windows<Cr>
map <leader>H :History<Cr>
map <leader>l :set list!<Cr>
map <leader>C :History:<Cr>
map <leader>M :Maps<Cr>
map <silent> <leader>h :WhichKey! g:dict<Cr>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

"Change" without buffering.
nnoremap c "_c
vnoremap c "_c

"Delete" without buffering.
nnoremap d "_d
vnoremap d "_d
nnoremap D "_D
vnoremap D "_D

" Insert empty line without input mode
nmap oo o<Esc>k
nmap OO O<Esc>j
nnoremap <CR> o<Esc>
nnoremap <S-CR> i<CR><Esc> " Needed for GVIm
nnoremap  i<CR><Esc>   " Needed for CLI VIm (Note: ^[0M was created with Ctrl+V Shift+Enter, don't type it directly)

" VimCompletesMe
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Vimwiki
let g:vimwiki_list = [{
            \ 'auto_header' : 1,
            \ 'automatic_nested_syntaxes':1,
            \ 'path_html': '~/nextcloud/Dokumente/vimwiki/html/',
            \ 'path': '~/nextcloud/Dokumente/vimwiki/',
            \ 'template_path': '~/nextcloud/Dokumente/vimwiki/templates/',
            \ 'syntax': 'markdown',
            \ 'ext':'.md',
            \ 'autotags': 1,
            \ 'list_margin': 0,
            \ 'links_space_char' : '_',
            \}]
let g:vimwiki_folding='expr'
let g:vimwiki_hl_headers = 1
let g:vimwiki_use_calendar=0
let g:vimwiki_html_header_numbering=2
let g:vimwiki_hl_cb_checked=1
let g:vimwiki_makrdown_link_ext = 1
let g:markdown_folding = 1
let g:vimwiki_key_mappings = { 'table_mappings': 0, }
let g:vimwiki_folding = ''
let g:taskwiki_markup_syntax = 'markdown'
let g:vimwiki_ext2syntax = {'.md': 'markdown',
            \ '.mkd': 'markdown',
            \ '.wiki': 'markdown'}

"""""""""""
"NERDTree "
"""""""""""

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Exit Vim if NERDTree is the only window remaining in the only tab.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

"nerdtree width
let g:NERDTreeWinSize=20

"remove press ? for help on top of nerdtree
let NERDTreeMinimalUI=1
"disable 80 extentions of nerdtree for less lag

let g:NERDTreeLimitedSyntax = 1

" Create default mappings
let g:NERDCreateDefaultMappings = 1

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Show hidden files by default
let g:NERDTreeShowHidden=1

"""""""""""""""""""""""""""""""""
" NERDTree Functions and colors "
"""""""""""""""""""""""""""""""""
let g:NERDTreeDirArrowExpandable = ''
let g:NERDTreeDirArrowCollapsible = ''
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule


"""""""""""""""""""""""""""""""
"Options For The Startify Menu"
"""""""""""""""""""""""""""""""

let g:startify_custom_header = [
\ '    ▒█░░▒█ ▀█▀ ▒█▀▄▀█  ▒█▀▀▀ ▒█▀▀▄ ▀█▀ ▀▀█▀▀ ▒█▀▀▀█ ▒█▀▀█ ',
\ '    ░▒█▒█░ ▒█░ ▒█▒█▒█  ▒█▀▀▀ ▒█░▒█ ▒█░ ░▒█░░ ▒█░░▒█ ▒█▄▄▀ ',
\ '    ░░▀▄▀░ ▄█▄ ▒█░░▒█  ▒█▄▄▄ ▒█▄▄▀ ▄█▄ ░▒█░░ ▒█▄▄▄█ ▒█░▒█ ',
\'',
\'',
\'',
\'',
\ ]

"Incase you are insane and want to open a new tab with Goyo enabled
 autocmd BufEnter *
       \ if !exists('t:startify_new_tab') && empty(expand('%')) && !exists('t:goyo_master') |
       \   let t:startify_new_tab = 1 |
       \   Startify |
       \ endif
"Bookmarks. Syntax is clear.add yours
let g:startify_bookmarks = [ {'a': '~/.config/shell/aliases'},{'A': '~/.config/alacritty/alacritty.yml'},{'b': '~/.bashrc'},{'p': '~/.bash_profile'},{'s': '~/.config/sway/config'},{'v': '~/.vimrc'},{'z': '~/.config/zsh/.zshrc'},{'Z': '~/.config/zsh/aliases.zsh'}]
    let g:startify_lists = [
          \ { 'type': 'bookmarks' , 'header': ['   Bookmarks']      } ,
          \ { 'type': 'files'     , 'header': ['   Recent'   ]      } ,
          \ { 'type': 'sessions'  , 'header': ['   Sessions' ]      } ,
          \ { 'type': 'commands'  , 'header': ['   Commands' ]      } ,
          \ ]

hi StartifyBracket ctermfg=240
hi StartifyFile    ctermfg=147
hi StartifyFooter  ctermfg=240
hi StartifyHeader  ctermfg=114
hi StartifyNumber  ctermfg=215
hi StartifyPath    ctermfg=245
hi StartifySlash   ctermfg=240
hi StartifySpecial ctermfg=240

""""""""""
"UndoTree"
""""""""""

" if set, let undotree window get focus after being opened, otherwise
" focus will stay in current window.
if !exists('g:undotree_SetFocusWhenToggle')
    let g:undotree_SetFocusWhenToggle = 1
endif

" Change window layout
if !exists('g:undotree_WindowLayout')
    let g:undotree_WindowLayout = 4
endif

" Show cursorline
if !exists('g:undotree_CursorLine')
    let g:undotree_CursorLine = 1
endif

""""""""""""""""
"FloatermToggle"
""""""""""""""""
let g:floaterm_autohide = 0
let g:floaterm_autoclose = 2
let g:floaterm_height = 30
let g:floaterm_width  = 120

"""""""""""""""""""""""""""""""""
"Dictionary Setting For WhichKey"
"""""""""""""""""""""""""""""""""
let g:which_key_hspace = 5
let g:which_key_centered = 1
let g:which_key_flatten = 1
let g:which_key_max_size = 1
let g:which_key_disable_default_offset = 1
let g:which_key_align_by_seperator = 1
let g:which_key_exit = ["q", "\<Esc>", "\<Space>"]
let g:which_key_display_names = {'<CR>': '↵', '<TAB>': '⇆'}

" Change the colors if you want
highlight default link WhichKey          Operator
highlight default link WhichKeySeperator DiffAdded
highlight default link WhichKeyGroup     Identifier
highlight default link WhichKeyDesc      Function

let g:dict= {
      \ 'a-'               : ['Tabularize'                          , 'tabularize /-']                   ,
      \ 'a='               : ['Tabularize'                          , 'tabularize /=']                   ,
      \ 'a:'               : ['Tabularize'                          , 'tabularize /:']                   ,
      \ 'a#'               : ['Tabularize'                          , 'tabularize /#']                   ,
      \ 'n'                : ['NERDTree'                            , 'nerdtree']                        ,
      \ 'i'                : ['IndentLine'                          , 'indentline']                      ,
      \ 's'                : ['Startify'                            , 'Startify']                        ,
      \ 'g'                : ['Goyo'                                , 'goyo']                            ,
      \ 'r'                : ['lf'                                  , 'lf']                              ,
      \ 'l'                : ['List special characters'             , 'view special chars']              ,
      \ 't'                : ['NewTab'                              , 'tab open new']                    ,
      \ 'u'                : ['UndoTree'                            , 'undotree']                        ,
      \ 'cc'               : ['Comment Out'                         , 'comment']                         ,
      \ 'cu'               : ['Uncomment'                           , 'uncomment']                       ,
      \ '1-9'              : ['Go to tab by number'                 , 'tab switch 1-9']                  ,
      \ 'f12'              : ['Floaterm'                            , 'floaterm']                        ,
      \ '<ctrl>  + hjkl'   : ['Move between splits'                 , 'splits move']                     ,
      \ '<shift> + <-> '   : ['Resize splits'                       , 'splits resize']                   ,
      \ '<ctrl>  + <-> '   : ['Tab right or left'                   , 'tab cycle']                       ,
      \ 'c'                : ['Colors'                              , 'colors']                          ,
      \ 'b'                : ['Buffers'                             , 'buffers']                         ,
      \ 'f'                : ['Files'                               , 'files']                           ,
      \ 'W'                : ['Windows'                             , 'windows']                         ,
      \ 'H'                : ['History'                             , 'history']                         ,
      \ 'C'                : ['History commands'                    , 'history commands']                ,
      \ 'M'                : ['Key mapping'                         , 'show key mappings']               ,
      \ 'w'                : ['Quick save'                          , 'quick save']                      ,
      \ 'tm'               : ['Tab Move'                            , 'tab Move']                        ,
      \ '.'                : ['Source vimrc'                        , 'source vimrc']                    ,
      \ }


"""""""""""""""""""""""
" Plugin Ale Settings "
"""""""""""""""""""""""

" don't check syntax immediately on open or on quit
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'
let g:ale_echo_msg_error_str = 'Error'
let g:ale_echo_msg_warning_str = 'Warning'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_sign_column_always = 1
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_open_list = 1
let g:ale_list_window_size = 5
" let g:ale_sign_error = '" '
" let g:ale_sign_warning = ''

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'ansible': ['ansible-lint'],
\}

"""""""""""""""""
"Comfy-Scroll   "
"""""""""""""""""
noremap <silent> <ScrollWheelDown> :call comfortable_motion#flick(40)<CR>
noremap <silent> <ScrollWheelUp>   :call comfortable_motion#flick(-40)<CR>
let g:comfortable_motion_friction = 50.0
let g:comfortable_motion_air_drag = 1.0

"""""""""""""
"Autopairs  "
"""""""""""""
let g:AutoPairsFlyMode = 0
