scriptencoding utf-8
set encoding=utf-8

set nocompatible              " be iMproved, required
filetype off                  " required
syntax on
let mapleader = "\<Space>"

" git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
set rtp+=~/.fzf
" git clone -depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#rc()


Plugin 'VundleVim/Vundle.vim'
Plugin 'xolox/vim-misc'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Konfekt/FastFold'
Plugin 'tmhedberg/SimpylFold'
Plugin 'jiangmiao/auto-pairs'
Plugin 'dyng/ctrlsf.vim'
Plugin 'junegunn/fzf.vim'
Plugin 'flazz/vim-colorschemes'
Plugin 'majutsushi/tagbar'
Plugin 'kannokanno/previm'
Plugin 'Chiel92/vim-autoformat'
Plugin 'fatih/vim-go'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'

Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'prettier/vim-prettier'
Plugin 'elzr/vim-json'
Plugin 'vim-syntastic/syntastic'
Plugin 'mattn/emmet-vim'
Plugin 'schickling/vim-bufonly'
Plugin 'rbgrouleff/bclose.vim'
Plugin 'cakebaker/scss-syntax.vim'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'derekwyatt/vim-scala'

Plugin 'rust-lang/rust.vim'
Plugin 'prabirshrestha/async.vim'
Plugin 'prabirshrestha/vim-lsp'
Plugin 'prabirshrestha/asyncomplete.vim'
Plugin 'prabirshrestha/asyncomplete-lsp.vim'

Plugin 'dense-analysis/ale'

Plugin 'dart-lang/dart-vim-plugin'
Plugin 'tpope/vim-abolish'
" Plugin 'davidhalter/jedi-vim'

Plugin 'mzlogin/vim-markdown-toc'

Plugin 'godlygeek/tabular'              " required by vim-markdown
Plugin 'plasticboy/vim-markdown'

Plugin 'tpope/vim-fugitive'
Plugin 'easymotion/vim-easymotion'

Bundle 'vim-scripts/matchit.zip'


"""""""""""""""""""""""""""""""""""""""
""""""""
""""""""   Settings for Plugins
""""""""
"""""""""""""""""""""""""""""""""""""""


autocmd vimenter * if !argc() | NERDTree | endif
let NERDTreeIgnore=['CVS','\.dSYM$', '.git', '.pyc', '.DS_Store', '\.swp$', '\.swo$']
let NERDTreeChDirMode=2
noremap <silent> <Leader>n :NERDTreeToggle<CR>
noremap <silent> <Leader>m :NERDTreeFocus<CR>
noremap <silent> <Leader>M :NERDTreeFind<CR>
autocmd FileType nerdtree noremap <buffer> <c-left> <nop>
autocmd FileType nerdtree noremap <buffer> <c-h> <nop>
autocmd FileType nerdtree noremap <buffer> <c-right> <nop>
autocmd FileType nerdtree noremap <buffer> <c-l> <nop>
autocmd FileType nerdtree noremap <buffer> <Leader>L <nop>

let NERDTreeMinimalUI=1
let g:NERDTreeShowHidden=1

let g:airline_left_sep=''
let g:airline_right_sep=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = ' '

function! AirlineInit()
    let g:airline#extensions#default#layout = ['a', 'b', 'c', 'x', 'y', 'z']
endfunction
autocmd VimEnter * call AirlineInit()
let g:airline_section_x = ''
let g:airline_section_z = '%3p%% %3l/%L:%3v'
let g:airline_skip_empty_sections = 1



let g:fzf_layout = { 'down': '~40%'  }
map <silent> <expr> <C-g> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
map <silent> <expr> <C-p> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":FZF\<cr>"
map <silent> <expr> <C-j> (expand('%') =~ 'NERD_tree' ? "\<c-w>\<c-w>" : '').":Buffers\<cr>"

let g:NERDSpaceDelims=1
" useless
let g:NERDTreeMapJumpPrevSibling='<C-909>q'

nnoremap <leader>a :CtrlSF
nnoremap <leader>s :CtrlSFOpen <CR>
vnoremap <Leader>a y<ESC> :CtrlSF "<C-R>""

let g:ctrlsf_auto_focus = {
    \ "at": "start"
    \ }
let g:ctrlsf_search_mode = 'async'

let g:go_metalinter_command = "golangci-lint"

command! -nargs=? -complete=buffer -bang BL :call BufOnly('<args>', '<bang>')

command! -nargs=0 BB call tagbar#ToggleWindow()
noremap <silent> <Leader>o :TagbarToggle<CR>

" see https://github.com/majutsushi/tagbar/wiki#google-go
let g:tagbar_type_go = {
    \ 'ctagstype' : 'go',
    \ 'kinds'     : [
        \ 'p:package',
        \ 'i:imports:1',
        \ 'c:constants',
        \ 'v:variables',
        \ 't:types',
        \ 'n:interfaces',
        \ 'w:fields',
        \ 'e:embedded',
        \ 'm:methods',
        \ 'r:constructor',
        \ 'f:functions'
    \ ],
    \ 'sro' : '.',
    \ 'kind2scope' : {
        \ 't' : 'ctype',
        \ 'n' : 'ntype'
    \ },
    \ 'scope2kind' : {
        \ 'ctype' : 't',
        \ 'ntype' : 'n'
    \ },
    \ 'ctagsbin'  : 'gotags',
    \ 'ctagsargs' : '-sort -silent'
\ }

let g:tagbar_type_scala = {
    \ 'ctagstype' : 'scala',
    \ 'sro'       : '.',
    \ 'kinds'     : [
      \ 'p:packages',
      \ 'T:types:1',
      \ 't:traits',
      \ 'o:objects',
      \ 'O:case objects',
      \ 'c:classes',
      \ 'C:case classes',
      \ 'm:methods',
      \ 'V:values:1',
      \ 'v:variables:1'
    \ ]
\ }


let g:lsp_text_edit_enabled = 0
let g:lsp_highlight_references_enabled = 1

if executable('rls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'rls',
        \ 'cmd': {server_info->['rustup', 'run', 'stable', 'rls']},
        \ 'whitelist': ['rust'],
        \ })
endif

if executable('gopls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'gopls',
        \ 'cmd': {server_info->['gopls', '-mode', 'stdio']},
        \ 'whitelist': ['go'],
        \ })
    " autocmd BufWritePre *.go LspDocumentFormatSync
endif
" if executable('go-langserver')
"     au User lsp_setup call lsp#register_server({
"         \ 'name': 'go-langserver',
"         \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
"         \ 'whitelist': ['go'],
"         \ })
" endif
if executable('java') && filereadable(expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar'))
    au User lsp_setup call lsp#register_server({
        \ 'name': 'eclipse.jdt.ls',
        \ 'cmd': {server_info->[
        \     'java',
        \     '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        \     '-Dosgi.bundles.defaultStartLevel=4',
        \     '-Declipse.product=org.eclipse.jdt.ls.core.product',
        \     '-Dlog.level=ALL',
        \     '-noverify',
        \     '-Dfile.encoding=UTF-8',
        \     '-Xmx1G',
        \     '-jar',
        \     expand('~/lsp/eclipse.jdt.ls/plugins/org.eclipse.equinox.launcher_1.5.500.v20190715-1310.jar'),
        \     '-configuration',
        \     expand('~/lsp/eclipse.jdt.ls/config_linux'),
        \     '-data',
        \     getcwd()
        \ ]},
        \ 'whitelist': ['java'],
        \ })
endif
if executable('metals-vim')
   au User lsp_setup call lsp#register_server({
      \ 'name': 'metals',
      \ 'cmd': {server_info->['metals-vim']},
      \ 'initialization_options': { 'rootPatterns': 'build.sbt' },
      \ 'whitelist': [ 'scala', 'sbt' ],
      \ })
endif
if executable('pyls')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'whitelist': ['python'],
        \ })
endif
autocmd FileType py,python,scala,java,go,rs,rust nnoremap gd :LspDefinition<CR>
autocmd FileType py,python,scala,java,go,rs,rust nnoremap <Leader>d :LspPeekDefinition<CR>
autocmd FileType py,python,scala,java,go,rs,rust nnoremap <Leader>t :LspPeekTypeDefinition<CR>
autocmd FileType py,python,scala,java,go,rs,rust nnoremap <Leader>i :LspPeekImplementation<CR>
autocmd FileType py,python,scala,java,go,rs,rust nnoremap <Leader>h :LspHover<CR>
let g:lsp_diagnostics_enabled = 0
let g:lsp_fold_enabled = 0


" let g:ale_linters = {'go': ['golangci-lint']}
let g:ale_linters = {'go': ['govet']}
let g:ale_fix_on_save = 1
let g:ale_fixers = {'go': ['goimports']}


let g:previm_open_cmd = 'open -a Safari'
augroup PrevimSettings
    autocmd!
    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END



let g:multi_cursor_exit_from_insert_mode=0

let g:go_fmt_autosave=0
let g:go_def_mapping_enabled=0

au BufWrite *.rs :Autoformat
" au BufWrite *.go :Autoformat
au BufWrite *.scss :Autoformat
au BufWrite *.py :Autoformat

let g:user_emmet_leader_key='<C-C>'
let g:user_emmet_settings = {
\  'javascript.jsx' : {
\      'extends' : 'jsx',
\  },
\}

let g:vim_json_syntax_conceal = 0

let g:jsx_ext_required = 0

let g:prettier#config#tab_width = 4

let g:rust_fold = 1
let g:perl_fold = 1
let g:python_fold = 1
let g:erlang_fold = 1
let g:go_fold = 1
let g:fastfold_fold_command_suffixes =  ['x','X','a','A']
let g:fastfold_savehook = 0

let g:vim_markdown_folding_disabled = 1


let g:syntastic_python_checkers = ['flake8']
let g:syntastic_always_populate_loc_list = 1

let g:indent_guides_guide_size = 1

map f <Plug>(easymotion-prefix)w

"""""""""""""""""""""""""""""""""""""""
"""""""" Settings for Mappings """""""""
"""""""""""""""""""""""""""""""""""""""

nnoremap J mzJ`z
noremap H ^
noremap L $
vnoremap L g_


noremap <silent> <C-left> :bprev<CR>
noremap <silent> <C-h> :bprev<CR>
noremap <silent> <C-right> :bnext<CR>
noremap <silent> <C-l> :bnext<CR>

nnoremap <silent> <Leader>q :Bclose<CR>
nnoremap <silent> <Leader>x <C-w>c

map <Leader>L :set invnumber<CR>

map <Leader>T :%s/\s\+$//<CR>
map <Leader>U :g/^$/d<CR>
map <Leader>R :retab<CR>
map <Leader>; %
map <Leader>. :@:<CR>
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>es :so $MYVIMRC<CR>
nnoremap <silent> <leader>b :nohlsearch<CR>
nnoremap <Leader>= :wincmd =<CR>

nmap S :%s//g<LEFT><LEFT>
" vmap <Leader>S y:%s///g<LEFT><LEFT><LEFT><C-R>"<RIGHT>
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

map <Leader>w :w<CR>

inoremap  <C-k> :
nnoremap  <C-k> :

vnoremap // y/<C-R>"<CR>"

vnoremap p "_dp
vnoremap P "_dP


nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap tt  :tabedit<Space>
nnoremap tn  :tabnext<Space>
nnoremap tm  :tabm<Space>
nnoremap td  :tabclose<CR>

set wildmenu wildmode=full
set wildchar=<Tab> wildcharm=<C-Z>
noremap <C-q> <C-y>



"""""""""""""""""""""""""""""""""""""""
"""""""""
"""""""" Settings for FileType
"""""""""
"""""""""""""""""""""""""""""""""""""""

autocmd FileType qf wincmd J

autocmd BufRead,BufNewFile *.json set filetype=json
autocmd BufNewFile,BufRead *.webapp set filetype=json
autocmd BufNewFile,BufRead *.jshintrc set filetype=json
autocmd BufNewFile,BufRead *.eslintrc set filetype=json
autocmd BufNewFile,BufReadPost *.go set shiftwidth=4 softtabstop=4
autocmd BufNewFile,BufReadPost *.coffee set shiftwidth=2 softtabstop=2 expandtab
autocmd BufNewFile,BufRead *.coffee set filetype=coffee
autocmd BufWritePost *.coffee silent make!
autocmd QuickFixCmdPost * nested cwindow | redraw!
autocmd BufNewFile,BufReadPost *.js set shiftwidth=4 softtabstop=4 expandtab
autocmd! BufEnter *.jsx let b:syntastic_checkers=['eslint']
autocmd! BufEnter *.js let b:syntastic_checkers=['eslint']
autocmd BufNewFile,BufRead *.js set filetype=javascript.jsx
autocmd BufNewFile,BufRead *.ejs set filetype=html
autocmd FileType scss set iskeyword+=-
autocmd BufNewFile,BufReadPost *.scss set shiftwidth=4 softtabstop=4 expandtab
autocmd BufNewFile,BufReadPost *.sh set shiftwidth=4 softtabstop=4 expandtab
autocmd BufNewFile,BufReadPost *.sls set shiftwidth=4 softtabstop=4 expandtab


nmap <silent>=j :%!python -m json.tool<CR>:setfiletype json<CR>


"""""""""""""""""""""""""""""""""""""""
"""""""""
"""""""" Settings for normal vi
"""""""""
"""""""""""""""""""""""""""""""""""""""

set splitbelow
set splitright

set listchars=tab:▸\ ,trail:·,extends:❯,precedes:❮,nbsp:×
set list

set number
set nomodeline
set viminfo='1000,f1,:1000,/1000
set history=1000
set foldmethod=syntax
set tabstop=4
set shiftwidth=4
set hidden
filetype indent on
filetype plugin on
set autoindent
set t_Co=256
set term=screen-256color
set mouse=
set clipboard^=unnamed,unnamedplus
cmap w!! %!sudo tee > /dev/null %
set backspace=indent,eol,start
let pair_program_mode = 0

noremap K <nop>
nnoremap Q <nop>
map q: :q

set timeoutlen=1000 ttimeoutlen=0

syntax on
set number
set nowrap
set vb
set ruler
set statusline=%<%f\ %h%m%r%=%{FugitiveStatusline()}\ \ %-14.(%l,%c%V%)\ %P
let g:buftabs_only_basename=1
let g:buftabs_marker_modified = "+"

set incsearch
set ignorecase
set smartcase
set hlsearch
set nostartofline


"""""""""""""""""""""""""""""""""""""""
"""""""""
"""""""" Settings for Custom Funcs
"""""""""
"""""""""""""""""""""""""""""""""""""""


function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
endfunc
nnoremap <F4> :call ToggleMouse() <Enter>

nnoremap <F8> *

set pastetoggle=<F2>

function! ToggleFold()
    let &foldlevel = 100 - &foldlevel
    :normal zz
endfunc
nnoremap zm :call ToggleFold() <Enter>
nnoremap zo zA

function! s:CopyToTmux()
  let [lnum1, col1] = getpos("'<")[1:2]
  let [lnum2, col2] = getpos("'>")[1:2]
  let lines = getline(lnum1, lnum2)
  let lines[-1] = lines[-1][: col2 - (&selection == 'inclusive' ? 1 : 2)]
  let lines[0] = lines[0][col1 - 1:]
  let tempfile = tempname()
  call writefile(lines, tempfile, "b")
  call system('tmux load-buffer '.tempfile)
  call delete(tempfile)
endfunction
vnoremap <silent> Y :call <sid>CopyToTmux()<cr>

colorscheme leo
hi CursorLine           cterm=none      ctermfg=10
hi Search               cterm=none      ctermfg=232     ctermbg=214     guifg=#000000   guibg=#a8a8a8
hi lspReference                         ctermfg=black   ctermbg=green   guifg=black     guibg=green

"------  Local Overrides  ------
if filereadable($HOME.'/.vimrc_local')
    source $HOME/.vimrc_local
endif


call vundle#end()
filetype plugin indent on
