"" ============================================================================
""                             All Mode Mappings
"" ============================================================================
" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

"" =============================================================================
""                             Fix Tmux Mappings
"" =============================================================================
if &term =~ '^screen' && exists('$TMUX')
    set mouse+=a
    " tmux knows the extended mouse mode
    set ttymouse=xterm2
    " tmux will send xterm-style keys when xterm-keys is on
    execute "set <xUp>=\e[1;*A"
    execute "set <xDown>=\e[1;*B"
    execute "set <xRight>=\e[1;*C"
    execute "set <xLeft>=\e[1;*D"
    execute "set <xHome>=\e[1;*H"
    execute "set <xEnd>=\e[1;*F"
    execute "set <Insert>=\e[2;*~"
    execute "set <Delete>=\e[3;*~"
    execute "set <PageUp>=\e[5;*~"
    execute "set <PageDown>=\e[6;*~"
    execute "set <xF1>=\e[1;*P"
    execute "set <xF2>=\e[1;*Q"
    execute "set <xF3>=\e[1;*R"
    execute "set <xF4>=\e[1;*S"
    execute "set <F5>=\e[15;*~"
    execute "set <F6>=\e[17;*~"
    execute "set <F7>=\e[18;*~"
    execute "set <F8>=\e[19;*~"
    execute "set <F9>=\e[20;*~"
    execute "set <F10>=\e[21;*~"
    execute "set <F11>=\e[23;*~"
    execute "set <F12>=\e[24;*~"
endif

"" ============================================================================
""                           Insert Mode Mappings
"" ============================================================================
" Leaving insert mode with some ups and downs
inoremap jj <Esc><Right>
inoremap jk <Esc><Right>
inoremap kj <Esc><Right>
inoremap kk <Esc><Right>

inoremap {<CR> {<CR>}<Esc>O

"" ============================================================================
""                        Normal/Visual Mode Mappings
"" ============================================================================
" If hl search is off, starting a new search or moving enables it
" remove zz if the jumps are too much
nnoremap * :set hlsearch<CR>*zz
nnoremap # :set hlsearch<CR>#zz
nnoremap n :set hlsearch<CR>nzz
nnoremap N :set hlsearch<CR>Nzz

" Basically you press * or # to search for the current selection
vnoremap <silent> * y:let @/ = @"<CR>n:set hlsearch<CR>
vnoremap <silent> # y:let @? = @"<CR>n:set hlsearch<CR>

" select everything
nmap <C-A> ggVG

" Swap to last buffer
nnoremap <silent> <F8> :b#<CR>

" rerun last command (space is important for zsh to expand)
noremap <F5> :w<CR>:call VimuxRunCommand("!! \t")<CR>

" yank from cursor to end of line
nnoremap Y y$

" replay @q macro for each line of a visual selection
vnoremap @q :normal @q<CR>

" Compilation and testing
nnoremap <F2> :w<CR>:call Cdroot()<CR>:call VimuxRunCommand("clear; make clean -j")<CR>
nnoremap <F3> :w<CR>:call Cdroot()<CR>:call VimuxRunCommand("clear; make gtest -j")<CR>
nnoremap <F4> :w<CR>:call Cdroot()<CR>:call VimuxRunCommand("clear; make -j")<CR>

"" =============================================================================
""                           Command Mode Mappings
"" =============================================================================
" Now we don't have to move our fingers so far when we want to scroll through
" the command history; also, don't forget the q: command (see :h q: for more
" info)
cnoremap <c-j> <down>
cnoremap <c-k> <up>
cnoremap <c-h> <left>
cnoremap <c-l> <right>

"" ============================================================================
""                         Leader Mappings (Sorted)
"" ============================================================================
" Also use spacebar as a leader
let mapleader = "\<Space>"

nnoremap <Leader><Space> :CtrlPBuffer<CR>
nnoremap <Leader>bl :Gblame!<CR>
nnoremap <Leader>cmt :call CmtSection("")<Left><Left>
nnoremap <Leader>cx :!chmod a+x %<CR>
nnoremap <Leader>df :Gdiff<CR>
nnoremap <Leader>do :windo diffoff<CR>
nnoremap <Leader>dom :Gdiff origin/master<CR>
nnoremap <Leader>dt :windo diffthis<CR>
nnoremap <Leader>dum :Gdiff upstream/master<CR>
nnoremap <Leader>ff :FSHere<CR>
nnoremap <Leader>fh :FSSplitLeft<CR>
nnoremap <Leader>fj :FSSplitBelow<CR>
nnoremap <Leader>fk :FSSplitAbove<CR>
nnoremap <Leader>fl :FSSplitRight<CR>
nnoremap <Leader>gb :call Cdroot()<CR>:Grepper -buffer<CR>
nnoremap <Leader>ft :FSTab<CR>
nnoremap <Leader>gg :call Cdroot()<CR>:Grepper<CR>
nnoremap <Leader>glg :GV<CR>
nnoremap <Leader>h :set hlsearch! hlsearch?<CR>
nnoremap <Leader>jc :YcmCompleter GoToDeclaration<CR>
nnoremap <Leader>jf :YcmCompleter GoToDefinition<CR>
nnoremap <Leader>ji :YcmCompleter GoToImprecise<CR>
nnoremap <Leader>jj :YcmCompleter GoTo<CR>
nnoremap <Leader>so :so %<CR>
nnoremap <Leader>sp :setlocal spell! spelllang=en_us<CR>
nnoremap <Leader>ss :call SortSection()<CR>
nnoremap <Leader>st :SyntasticToggleMode<CR>
nnoremap <Leader>sw :call WindowSwap#EasyWindowSwap()<CR>
nnoremap <Leader>tm :Tabmerge right<CR>
nnoremap <Leader>tt :TagbarToggle<CR>
nnoremap <Leader>ut :UndotreeToggle<CR>
nnoremap <Leader>uu :PlugUpgrade<CR>:PlugUpdate<CR>
nnoremap <Leader>ve :vsp<CR>:e %:h<CR>
nnoremap <Leader>vv :w<CR>:VimuxPromptCommand<CR>
nnoremap <Leader>vx :VimuxInterruptRunner<CR>
nnoremap <Leader>w :call StripTabsAndTrailingWhitespaces()<CR>:w<CR>
nnoremap <Leader>xe :sp<CR>:e %:h<CR>

nmap <Leader>e <Plug>(easymotion-overwin-f)

xmap <Leader>ga <Plug>(EasyAlign)
nmap <Leader>ga <Plug>(EasyAlign)

" incsearch (no fuzz)
" nmap <Leader>/ :set hlsearch<CR><Plug>(incsearch-forward)
" nmap <Leader>? :set hlsearch<CR><Plug>(incsearch-backward)
