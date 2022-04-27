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
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'kocha/vim-systemc'
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

" COC
"
"
" 
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <silent>rn <Plug>(coc-rename)

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

"highlight CocErrorHighlight ctermfg=Red guifg=#ff0000
