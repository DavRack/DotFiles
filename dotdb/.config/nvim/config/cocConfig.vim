
""auto instalar extenciones COC
let g:coc_global_extensions = ['coc-tsserver',
            \ 'coc-pyright',
            \ 'coc-json',
            \ 'coc-html',
            \ 'coc-css',
            \ 'coc-go',
            \ 'coc-rls',
            \ 'coc-texlab',
            \ 'coc-sh',
            \ 'coc-markdownlint',
            \ 'coc-svelte',
            \ 'coc-flutter']

nmap <leader>d :call CocAction('jumpDefinition', 'tab drop')<CR>
nmap <leader>r :call CocAction('jumpReferences', 'tab drop')<CR>
