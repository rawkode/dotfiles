"dein Scripts-----------------------------
if &compatible
  set nocompatible               " Be iMproved
endif

let mapleader=","
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set backspace=indent,eol,start
                    " allow backspacing over everything in insert mode
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set number        " always show line numbers
set relativenumber
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                    "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type

let g:netrw_liststyle = 3

" Required:
set runtimepath+=/home/rawkode/.dein/repos/github.com/Shougo/dein.vim

" Required:
if dein#load_state('/home/rawkode/.dein')
  call dein#begin('/home/rawkode/.dein')

  " Let dein manage dein
  " Required:
  call dein#add('/home/rawkode/.dein/repos/github.com/Shougo/dein.vim')

  " Add or remove your plugins here:
  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')
  call dein#add('Shougo/denite.nvim')

  " You can specify revision/branch/tag.
  call dein#add('Shougo/vimshell', { 'rev': '3787e5' })

  call dein#add('Shougo/deoplete.nvim')

  " UI
  call dein#add('chriskempson/base16-vim')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  " Finders
  call dein#add('junegunn/fzf', { 'build': './install --all', 'merged': 0 }) 
  call dein#add('junegunn/fzf.vim', { 'depends': 'fzf' })

  " Fluent Editing
  call dein#add('Raimondi/delimitMate')
  call dein#add('scrooloose/nerdcommenter')


  " Git
  call dein#add('airblade/vim-gitgutter')
  call dein#add('tpope/vim-fugitive')
  

  " Elixir
  call dein#add('elixir-lang/vim-elixir')
  call dein#add('slashmili/alchemist.vim')

  " SaltStack
  call dein#add('saltstack/salt-vim')

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

"End dein Scripts-------------------------

