" ### Plugins

" Installation Pluginmanager
if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin()
  Plug 'mbbill/undotree'              " Anzeigen von alten Revisionen
  Plug 'vim-scripts/SearchComplete'   " Autocompletion auch in der Suche aktivieren
  Plug 'morhetz/gruvbox'              " Farbschema Alternative
  Plug 'junegunn/limelight.vim'       " Fokus auf aktuellen Absatz
  Plug 'junegunn/goyo.vim'            " Alles ausblenden
  Plug '9mm/vim-closer'               " Intelligente Klammern und co.
  Plug 'jusinmk/vim-sneak'           " Sehr schnelles springen im Code
  Plug 'preservim/nerdtree'           " Erweiterter Filebrowser
  Plug 'liuchengxu/vista.vim'         " Functions, Variablen anzeigen
  Plug 'reewr/vim-monokai-phoenix'
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


" ### Verhalten f√ºr Backup, Swap und co.
if !isdirectory($HOME."/.local/share/nvim/undodir")
    call mkdir($HOME."/.local/share/nvim/undodir", "p", 0700)
endif
set undodir=~/.local/share/nvim/undodir     " Alle Ver√§nderungen werden hier aufgezeichnet
set undofile		                            " Alle √Ñnderungen werden endlos in oberen undodir protokolliert
if !isdirectory($HOME."/.local/share/nvim/swap")
    call mkdir($HOME."/.local/share/nvim/swap", "p", 0700)
endif
set directory=~/.local/share/nvim/swap      " Zentrale Ablage der Swap-Files
"set noswapfile     " Falls kein Swap-Files erstellen werden soll
set nobackup        " Backfile wird sofort wirder gel√∂scht, da Restores √ºber Undofiles m√∂glich
set hidden          " Wechsel von Buffern auch, wenn File nicht gespeichert


" ### Verhalten von TABs und Einr√ºcken bei Code
set tabstop=4 softtabstop=4	shiftwidth=4    " Nur zwei Tab-Stopp einf√ºgen
set expandtab           " Tabs in Spaces wandeln
set formatoptions+=j    " Immer Spaces anstatt Tabs
"set clipboard=unnamed  " Standard-Register (yy, dd, etc) IMMER in Zwischenablage kopieren


" ### NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__']
let NERDTreeMinimalUI = 1
let g:nerdtree_open = 0

function NERDTreeToggle()   " Toggle-Funktion
    if g:nerdtree_open == 1
        let g:nerdtree_open = 0
        NERDTreeClose
    else
        let g:nerdtree_open = 1
        NERDTree
    endif
endfunction

function! StartUp()
    if 0 == argc()
        NERDTree
        let g:nerdtree_open = 1
    end
endfunction
"autocmd VimEnter * call StartUp()    " Nerdtree anzeigen beim Start, wenn man keine Datei √∂ffnet


" ### Fokusiertes Arbeiten (Befehl :Fokus)
let g:limelight_conceal_ctermfg = 240
function FokusStart()
  Limelight
	Goyo
endfunction
command! Fokus call FokusStart()
function FokusEnde()
  Limelight!  " Beim Beenden von Goyo Limelight auch beenden
endfunction
autocmd! User GoyoLeave call FokusEnde() " Wenn Goyo beendet wird, dann Fokus auch beenden


" ### Sessions
" Automatisch letzte Session speichern
function! MakeSession()
  let b:sessiondir = $HOME . "/.config/nvim/sessions"
  if (filewritable(b:sessiondir) != 2)
    exe 'silent !mkdir -p ' b:sessiondir
    redraw!
  endif
  let b:filename = b:sessiondir . '/autosession.vim'
  exe "mksession! " . b:filename
endfunction
au VimLeave * :call MakeSession()

" Command LoadLastSession ladet die letzte gespeicherte Session
function! LoadSession()
  let b:sessiondir = $HOME . "/.config/nvim/sessions"
  let b:sessionfile = b:sessiondir . "/autosession.vim"
  if (filereadable(b:sessionfile))
    exe 'source ' b:sessionfile
  else
    echo "No session loaded."
  endif
endfunction
command! LoadLastSession call LoadSession()

" ### Allgemeine Settings

let vim_markdown_preview_github=1   " Github-Erweiterungen von Markdown auch anzeigen
let g:sneak#label = 1               " Sneak-Vimi Label zum schnellen springen aktivieren.


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>



" Wrap an-/ausschalten
nnoremap <silent> <leader>w :set wrap!<CR>

" copy, cut and paste direkt in Zwischenablage
vmap <C-c> "+y
vmap <C-x> "+c
vmap <C-v> c<ESC>"+p
imap <C-v> <ESC>"+pa
imap jk <Esc>
map <C-n> :NERDTreeToggle<CR>
