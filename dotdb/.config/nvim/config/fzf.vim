"formas de abrir archivo con fzf
let g:fzf_action = {
    \ 'return': 'tab split',
    \ 'ctrl-x': 'split',
    \ 'ctrl-v': 'vsplit' }

" abir la ventana en el 50% de la parte inferior de la pantalla
let g:fzf_layout = { 'down': '50%' }

" ripgrep splits horizontal
let g:fzf_preview_window = ['up:70%']

" match fzf with theme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" buscar string en archivos con ripgrep
nnoremap <leader>f :Rg<CR>

" buscar archivo con fzf en el dirctorio actual
nnoremap <leader><Space> :FZF<CR>

" buscar archivo con fzf en home
nnoremap <leader>s :FZF ~<CR>
