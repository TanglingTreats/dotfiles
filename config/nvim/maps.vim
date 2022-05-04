" Description: Mappings

" Remap leader key
:let mapleader = "\<Space>"

" ---- Toggle terminal ----
let g:is_term_open=0
function! ToggleTerminal()
    if g:is_term_open
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&buftype") == "terminal")
                silent exe "bdelete! " . i
            endif
            let i-=1
        endwhile
        let g:is_term_open=0
    else
        let g:is_term_open=1
        silent :split
        silent :terminal
    endif
endfunction

" Terminal toggle shortcut
tnoremap <leader>` <C-\><C-n><bar> :call ToggleTerminal() <CR>
nnoremap <leader>` :call ToggleTerminal() <CR>

" Fugitive shortcuts
nmap <leader>gs :G<CR>
nmap <leader>gu :diffget //2<CR>
nmap <leader>gh :diffget //3<CR>

" File explorer with Netrw
let g:netrw_is_open=0

function! ToggleNetrw()
    if g:netrw_is_open
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Lexplore
    endif
endfunction
nnoremap <leader>e :call ToggleNetrw()  <CR>


map <F6> :setlocal spell! spelllang=en_gb<CR>
:nnoremap <silent> <Bslash> :nohlsearch<Bar>:echo<CR>

" Live Server behaviour
autocmd BufWriteCmd *.html,*.css,*.gtpl :call Refresh_firefox()
function! Refresh_firefox()
  if &modified
    write
    silent !echo  'vimYo = content.window.pageYOffset;
          \ vimXo = content.window.pageXOffset;
          \ BrowserReload();
          \ content.window.scrollTo(vimXo,vimYo);
          \ repl.quit();'  |
          \ nc -w 1 localhost 4242 2>&1 > /dev/null
  endif
endfunction

" Show files in directory
nnoremap <C-p> :GFiles<CR>
