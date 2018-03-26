set rtp+=~/.config/nvim/bundle/Vundle.vim

call vundle#begin()

Plugin 'vim-syntastic/syntastic'
Plugin 'VundleVim/Vundle.vim'
Plugin 'pangloss/vim-javascript'
Plugin 'MaxMEllon/vim-jsx-pretty'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'wakatime/vim-wakatime'
Plugin 'rafi/awesome-vim-colorschemes'
Plugin 'lambdatoast/elm.vim'
Plugin 'godlygeek/tabular'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kien/ctrlp.vim'
Plugin 'maralla/completor.vim'
Plugin 'raimondi/delimitmate'
Plugin 'ternjs/tern_for_vim'
Plugin 'mattn/emmet-vim'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'mileszs/ack.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'yegappan/mru'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'kana/vim-textobj-user'
Plugin 'whatyouhide/vim-textobj-xmlattr'

call vundle#end() 
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"

filetype plugin indent on
nnoremap th  :tabfirst<CR>
nnoremap tj  :tabnext<CR>
nnoremap tk  :tabprev<CR>
nnoremap tl  :tablast<CR>
nnoremap <C-T> :NERDTreeToggle<CR>
set nocompatible
set nobackup
set nowritebackup
set noswapfile
set ruler
set ignorecase
set smartcase
set autoread
set number
let g:javascript_plugin_jsdoc = 1 
set foldmethod=syntax
set shiftwidth=2
set expandtab
set softtabstop=2
:syntax on
set autoindent
:colorscheme alex
"set shortmess+=I
filetype on
let g:closetag_filenames = "*.jsx,*.js,*.html,*.xhtml,*.phtml" 
set wildignore+=**/node_modules/**
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\node_modules$\|\.svn$\|\.yardoc$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
let g:ctrlp_prompt_mappings = {
    \ 'AcceptSelection("e")': ['<2-LeftMouse>'],
    \ 'AcceptSelection("t")': ['<cr>'],
    \ }
set mouse=a
"let g:jsx_ext_required = 0
let g:airline_theme="materialbox"
set fillchars+=vert:\ 
set encoding=utf8

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2

" Use 256 colours (Use this setting only if your terminal supports 256 colours)
set t_Co=256
set mmp=5000
set guifont=DroidSansMono\ Nerd\ Font\ 11
let g:airline_powerline_fonts = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:DevIconsEnableFoldersOpenClose = 1
let g:WebDevIconsNerdTreeAfterGlyphPadding = ' '
let g:NERDTreeIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

"DiffRev
let s:git_status_dictionary = {
            \ "A": "Added",
            \ "B": "Broken",
            \ "C": "Copied",
            \ "D": "Deleted",
            \ "M": "Modified",
            \ "R": "Renamed",
            \ "T": "Changed",
            \ "U": "Unmerged",
            \ "X": "Unknown"
            \ }
function! s:get_diff_files(rev)
  let list = map(split(system(
              \ 'git diff --name-status '.a:rev), '\n'),
              \ '{"filename":matchstr(v:val, "\\S\\+$"),"text":s:git_status_dictionary[matchstr(v:val, "^\\w")]}'
              \ )
  call setqflist(list)
  copen
endfunction

command! -nargs=1 DiffRev call s:get_diff_files(<q-args>)
:highlight ExtraWhitespace ctermbg=015 ctermfg=015 guibg=white
:match ExtraWhitespace /\s\+$/

