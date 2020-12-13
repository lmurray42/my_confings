
set number "show string id
set tabstop=4 "spaces in one tab
set shiftwidth=4 "spaces on new line
set backspace=indent,eol,start "used for highlighting and deleting through backspace [<::x::]
syntax on "syntax highlighting
set t_Co=256 "for corret colors
set encoding=utf-8 
set cul

set mouse=a "mouse scrolling
if has("mouse_sgr")
    set ttymouse=sgr
else
    set ttymouse=xterm2
end

"Tree for use Ctrl + N
map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"nice cursor
if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif

set runtimepath^=~/.vim/bundle/ctrlp.vim

set nocompatible              " be iMp
" PLUGINS
"________________________________________________________________________________________
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive' "github
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
"snippetse core and configs
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
"tree CTRL + N
Plugin 'preservim/nerdtree'
"
Plugin 'inside/vim-search-pulse'
"hightlighting varible on your cursor
Plugin 'RRethy/vim-illuminate'
"code color themes 
Plugin 'morhetz/gruvbox'
"syntax checking and semantic errors
Plugin 'dense-analysis/ale'
"fast finder filse CTRL + P
Plugin 'kien/ctrlp.vim'
"TAB to use CTRL + Y for close
Plugin 'ycm-core/YouCompleteMe'
"refactoring (core and other)
Plugin 'LucHermitte/lh-vim-lib'
Plugin 'LucHermitte/lh-tags'
Plugin 'LucHermitte/lh-dev'
Plugin 'LucHermitte/lh-style'
Plugin 'LucHermitte/lh-brackets'
Plugin 'LucHermitte/vim-refactor'
"hightlighting code 
"Plugin 'jeaye/color_coded'
call vundle#end()
filetype plugin indent on
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"refactor Ctrl + X, V - for varible 
let b:usemarks=0
let b:cb_jump_on_close=1

"let g:color_coded_enabled = 1
"let g:color_coded_filetypes = ['c', 'cs', 'cpp', 'objc']

let g:ycm_language_server = 
  \ [ 
  \   {
  \     'name': 'yaml',
  \     'cmdline': [ '/path/to/yaml/server/yaml-language-server', '--stdio' ],
  \     'filetypes': [ 'yaml' ]
  \   },
  \   {
  \     'name': 'rust',
  \     'cmdline': [ 'ra_lsp_server' ],
  \     'filetypes': [ 'rust' ],
  \     'project_root_files': [ 'Cargo.toml' ]
  \   },
  \   {
  \     'name': 'godot',
  \     'filetypes': [ 'gdscript' ],
  \     'port': 6008,
  \     'project_root_files': [ 'project.godot' ]
  \    }
  \ ]

let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

let g:ycm_key_list_stop_completion = ['<C-y>']
let g:UltiSnipsRemoveSelectModeMappings = 0
let g:UltiSnipsExpandTrigger = '<C-l>l'
let g:UltiSnipsJumpForwardTrigger = '<C-g>'
let g:UltiSnipsJumpBackwardTrigger = '<C-t>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"color theme :colorscheme in vim for preview
colorscheme gruvbox "codedark
set background=dark

set laststatus=2
set statusline=%f%m

imap <F3> <esc>
map <F3> <esc>

"выделенный блок остается выделенным после сдвига
"vnoremap < <gv vnoremap=""> >gv
vnoremap < <gv
vnoremap > >gv

"служебные символы
set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<
set list

set autoread
set noswapfile

"НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ ТЕКСТА (фолдинг)
set foldenable " включить фолдинг
set foldmethod=syntax " определять блоки на основе синтаксиса
"файла
set foldmethod=indent " определять блоки на основе отступов
set foldcolumn=1 " показать полосу для управления сворачиванием
set foldlevel=1 " Первый уровень вложенности открыт, остальные
"закрыты
"set foldopen=all " автоматическое открытие сверток при заходе в
"них
set tags=tags\ $VIMRUNTIME/systags " искать теги в текущй
"директории и в указанной (теги генерируются ctags)

set visualbell " вместо писка бипером мигать курсором при ошибках ввода

