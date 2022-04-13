" ### Plugins

" Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'morhetz/gruvbox'              " Farbschema Alternative
  Plug 'junegunn/limelight.vim'       " Fokus auf aktuellen Absatz
  Plug 'junegunn/goyo.vim'            " Alles ausblenden
  Plug '9mm/vim-closer'               " Intelligente Klammern und co.
  Plug 'preservim/nerdtree'           " Erweiterter Filebrowser
  Plug 'liuchengxu/vista.vim'         " Functions, Variablen anzeigen
  Plug 'reewr/vim-monokai-phoenix'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make' }
call plug#end() " Plugins aktivieren

" Automatisch fehlende Plugins installieren
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif


" ### Darstellungsoptionen
syntax on           " Syntax Highlighting aktiveren
set number          " Line Numbers anzeigen
set relativenumber  " Relative Nummerierung anzeigen
set linebreak       " Ganze W√∂rter in neue Zeile umbrechen
set showmode        " Aktuellen Modus in Statuszeile anzeigen
set scrolloff=5     " Cursor bei Scroll weiter oben halten
set mouse=a         " Scrollen mit der Mouse in Console und tmux
set lazyredraw      " Weniger Redraws bei Macros und co.
set cursorline      " Aktive Zeile markieren
set updatetime=300  " Schellere Darstellung	/ Refresh
set laststatus=2    " Statuszeile immer anzeigen
set cmdheight=2     " Mehr Platz f√ºr Statusmeldungen
set shortmess+=c    " Don't pass messages to |ins-completion-menu|
set nowrap          " Wrap standardm√§√üig abschalten. Mit Leader w an-/abschalten
set nohlsearch
colorscheme gruvbox

" ##  Optik und Farben
if has('termguicolors')
    set termguicolors     " Wenn Farben nicht passen, dann die Zeile auskommentieren (z.B. macOS Terminal)
endif


" ### Suche
set path+=**      " Damit kann mit :find alles, auch in Subfolder gefunden werden
set ignorecase    " Suche nicht Case-Sensentiv
set smartcase     " Aber wenn Gro√übuchstaben verwenden werden dann schon


" ### Sprache und Rechtschreibkorrektur
set helplang=de             " Deutsche Hilfe
set spelllang=de_de,en_us   " Deutsche und englische Rechtschreibung


set tabstop=4 softtabstop=4	shiftwidth=4    " Nur zwei Tab-Stopp einf√ºgen
set expandtab           " Tabs in Spaces wandeln
set formatoptions+=j    " Immer Spaces anstatt Tabs

lua require('namespace/telescope')


nnoremap <C-p> <cmd>Telescope find_files<cr>
" copy, cut and paste direkt in Zwischenablage
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>
