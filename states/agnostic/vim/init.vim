if &compatible
  set nocompatible
endif

let mapleader=","

set mouse=""
set encoding=utf-8

let $NVIM_TUI_ENABLE_CURSOR_SHAPE = 0

set title
set nowrap

set cursorline
set cursorcolumn

set tabstop=2
set shiftwidth=2
set shiftround
set softtabstop=2
set expandtab

set backspace=indent,eol,start

set autoindent
set copyindent

set number
set relativenumber

set showmatch
set ignorecase
set smartcase
set smarttab
set hlsearch
set incsearch

" Stop creating backup and swap files
set noswapfile
set nobackup
set nowb

map <CR> :nohl<cr>

" Required:
set runtimepath+={{ grains.homedir }}/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('{{ grains.homedir }}/.dein')
  call dein#begin('{{ grains.homedir }}/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('{{ grains.homedir }}/.dein/repos/github.com/Shougo/dein.vim')

  " The Shougo collection
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/unite.vim')
  call dein#add('Shougo/unite-outline')
  call dein#add('Shougo/neomru.vim')
  call dein#add('Shougo/deoplete.nvim')

  " VimFiler
  " call dein#add('Shougo/vimfiler.vim')
  " let g:vimfiler_safe_mode_by_default = 0

  "
  " UI
  "
  call dein#add('mhinz/vim-startify')
  call dein#add('chriskempson/base16-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')
  call dein#add('ntpeters/vim-better-whitespace')
  call dein#add('junegunn/goyo.vim')
  call dein#add('junegunn/limelight.vim')

  call dein#add('scrooloose/nerdtree')
  
  "call dein#add('Xuyuanp/nerdtree-git-plugin')
  "robinfehr version colours the filename, instead of inserting a symbol
  call dein#add('robinfehr/nerdtree-git-plugin')

  " Finders
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 })
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Fluent Editing
  call dein#add('editorconfig/editorconfig-vim')
  call dein#add('Raimondi/delimitMate')
  call dein#add('tpope/vim-commentary')
  call dein#add('tpope/vim-surround')
  call dein#add('tpope/vim-repeat')
  call dein#add('junegunn/vim-easy-align')
  call dein#add('Yggdroot/indentLine')
  call dein#add('Valloric/MatchTagAlways')

  " Git
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  call dein#add('mattn/gist-vim')

  " Only load language files when inside a file of that language
  "   - This causes random no syntax colouring
  " call dein#add('sheerun/vim-polyglot')

  "
  call dein#add('rizzatti/dash.vim')

  "
  call dein#add('xolox/vim-misc')
  call dein#add('xolox/vim-easytags')

  " Neomake
  call dein#add('neomake/neomake')
  " Run Neomake when I save any buffer
  augroup localneomake
    autocmd! BufWritePost * Neomake
  augroup END
  let g:neomake_markdown_enabled_makers = []


  " Elixir
  let g:neomake_elixir_enabled_makers = ['dccredo']
  function! NeomakeCredoErrorType(entry)
    if a:entry.type ==# 'F'
      let l:type = 'W'
    elseif a:entry.type ==# 'D'
      let l:type = 'I'
    elseif a:entry.type ==# 'W'
      let l:type = 'W'
    elseif a:entry.type ==# 'R'
      let l:type = 'I'
    elseif a:entry.type ==# 'C'
      let l:type = 'W'
    else
      let l:type = 'M'
    endif
    let a:entry.type = l:type
  endfunction

  let g:neomake_elixir_dccredo_maker = {
        \ 'exe': 'docker-compose',
        \ 'args': ['run', '--rm', 'api', 'credo', 'list', '%:p', '--format=oneline'],
        \ 'errorformat': '[%t] %. %f:%l:%c %m,[%t] %. %f:%l %m',
        \ 'postprocess': function('NeomakeCredoErrorType')
        \ }

  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')
  call dein#add('c-brenn/phoenix.vim')
  call dein#add('tpope/vim-projectionist')

  " Docker
  call dein#add('ekalinin/dockerfile.vim')

  " GraphQL
  call dein#add('jparise/vim-graphql')

  " SaltStack
  call dein#add('saltstack/salt-vim')

  "
  call dein#add('powerman/vim-plugin-AnsiEsc')

  " Required:
  call dein#end()
  call dein#save_state()
endif

" Required:
filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif

let g:deoplete#enable_at_startup = 1
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
if !exists('g:deoplete#omni#input_patterns')
  let g:deoplete#omni#input_patterns = {}
endif

" let g:deoplete#disable_auto_complete = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" omnifuncs
augroup omnifuncs
  autocmd!
  autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
  autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
  autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
  autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
  autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup end
" tern
if exists('g:plugs["tern_for_vim"]')
  let g:tern_show_argument_hints = 'on_hold'
  let g:tern_show_signature_in_pum = 1
  autocmd FileType javascript setlocal omnifunc=tern#Complete
endif

" deoplete tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
" tern
autocmd FileType javascript nnoremap <silent> <buffer> gb :TernDef<CR>

let g:airline_powerline_fonts = 1
let g:airline_theme='base16_eighties'

" Fuzzy-find with fzf
map <C-p> :Files<cr>
nmap <C-p> :Files<cr>

map <C-e> :Unite file_mru<cr>
nmap <C-e> :Unite file_mru<cr>

map <C-r> :Unite outline<cr>
nmap <C-r> :Unite outline<cr>

nnoremap <C-/> :Unite grep:.<cr>

" View commits in fzf
nmap <Leader>c :Commits<cr>
" Complete from open tmux panes (from @junegunn)
inoremap <expr> <C-x><C-t> fzf#complete( 'tmuxwords.rb -all-but-current --scroll 499 --min 5')

" Mapping selecting mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

" Advanced customization using autoload functions
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

let base16colorspace=256
set background=dark
syntax enable
colorscheme base16-materia

" Spelling
setlocal spell spelllang=en_gb
set complete+=kspell

" VimFiler
" call vimfiler#custom#profile('default', 'context', { 'safe' : 0 })
" let g:loaded_netrwPlugin = 1
" nnoremap <leader>t :VimFilerExplorer -winwidth=60<CR>
" nnoremap <leader>f :VimFilerExplorer -find -winwidth=60<CR>

" NERDTree
nmap <leader>t :NERDTree<CR>
nmap <leader>f :NERDTreeFind<CR>
map <silent> <C-n> :NERDTreeFocus<CR>

let NERDTreeQuitOnOpen = 0
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeMapActivateNode='<space>'

" Goyo
let g:goyo_width="60%"
let g:goyo_height="80%"

