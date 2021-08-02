"by Cpointerz

"set
set rtp+='~/.config/nvim/autoload'
let mapleader="\<CR>"
set number
set tabstop=4
set shiftwidth=4
syntax enable
filetype plugin indent on
nnoremap <SPACE>u<LEADER> :!curl https://gitee.com/Cpointerz/develop-configuration/raw/master/NeoVim/init.vim > ~/.config/nvim/init.vim<CR>

"Install_plug
call plug#begin()

Plug 'glepnir/dashboard-nvim'
Plug 'liuchengxu/vim-clap'
Plug 'preservim/tagbar'
Plug 'rust-lang/rust.vim'
Plug 'vim-syntastic/syntastic'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

"==========key=========

"set Tagbar
nmap e :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
let g:tagbar_right = 1

"set themes
let g:airline_theme="serene"

" Compile function
nmap <SPACE>r :call Compile_Run()<CR>
function! Compile_Run()
  execute "w"
  if &filetype == 'rust'
	execute "!cargo run"
  elseif &filetype == 'java'
    execute "!java %"
  elseif &filetype == 'python'
    execute "!python3 %"
endif
endfunction

"vim-clap
let g:clap_layout = { 'relative': 'editor' }
let g:clap_provider_alias = {'hist:': 'command_history'}
let g:clap_theme = 'material_design_dark'

" air-line
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"buffer up
nmap p :bn <CR>

"buffer down
nmap o :bp <CR>

"buffer number
nnoremap ba<LEADER> :b 1<CR>
nnoremap bs<LEADER> :b 2<CR>
nnoremap bd<LEADER> :b 3<CR>
nnoremap bf<LEADER> :b 4<CR>
nnoremap bg<LEADER> :b 5<CR>
nnoremap bh<LEADER> :b 6<CR>
nnoremap bj<LEADER> :b 7<CR>
nnoremap bk<LEADER> :b 8<CR>
nnoremap bl<LEADER> :b 9<CR>
nnoremap b;<LEADER> :b 0<CR>

"C-W C-W maps to space f
nmap f <C-w><C-w>

"Install_plug function
nmap <SPACE>pi :PlugInstall<CR>

nmap <SPACE>ci :CocInstall coc-explorer coc-java coc-pyright coc-tsserver<CR>

"update_plug function
nmap <SPACE>pu :call dein#update()<CR>

nmap <SPACE>cu :CocUpdate<CR>

"set explorer
nmap t :CocCommand explorer<CR>

":w
nmap w :w<CR>
":q
nmap q :q<CR>

"search
nmap , N
nmap . n


"==========set dashboard-nvim==========

let g:dashboard_custom_header = [
     \ '',
     \ '    .::                                   .::                            ',
     \ ' .::   .::                   .:           .::                            ',
     \ '.::       .: .::     .::       .:: .::  .:.: .:   .::    .: .::: ::::::::',
     \ '.::       .:  .::  .::  .:: .:: .::  .::  .::   .:   .::  .::        .:: ',
     \ '.::       .:   .::.::    .::.:: .::  .::  .::  .::::: .:: .::      .::   ',
     \ '.::   .:: :: .::   .::  .:: .:: .::  .::  .::  .:         .::     .::    ',
     \ '   .::::  .::        .::    .::.:::  .::   .::   .::::   .:::   .::::::::',
     \ '          .::                                                            ',
     \ '                               V2.9.4                                    ',
     \ '',
     \ ]

let g:dashboard_custom_shortcut={
      \ 'last_session' : 's l CR',
      \ 'find_history' : 'f h CR',
      \ 'find_file' : 'f f CR',
      \ 'new_file' : 'c n CR',
      \ 'change_colorscheme' : 't c CR',
      \ 'find_word' : 'f a CR',
      \ 'book_marks' : 'f b CR',
      \ }
     
nnoremap <silent> fh<Leader> :<C-u>Clap history<CR>
nnoremap <silent> ff<Leader> :<C-u>Clap files<cr>
nnoremap <silent> tc<Leader> :<C-u>Clap colors<CR>
nnoremap <silent> fa<Leader> :<C-u>Clap blines<CR>
nnoremap <silent> fb<Leader> :<C-u>Clap marks<CR>

let g:dashboard_default_executive ='clap'

nmap ss<Leader> :<C-u>SessionSave<CR>
nmap sl<Leader> :<C-u>SessionLoad<CR>