----
HOME = os.getenv("HOME")

-- precompile lua to make openin nvim faster
-- random things
local set = vim.opt
set.wrap = false
set.number = true
set.relativenumber = true
set.signcolumn = "yes"
set.expandtab = false
set.shiftwidth = 2
set.cursorline = true
set.mouse="a"
set.tabstop=2
set.clipboard = "unnamedplus"
set.swapfile = false
vim.opt.completeopt = 'menu,menuone,noselect'
vim.opt.scrolloff = 10
vim.opt.incsearch = true

-- show buffer tabs
set.showtabline=2

set.foldmethod = "expr"
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")
set.foldlevel=99

-- Helper functional wrapper for mapping custom keybindings
function Map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- remaps
-- set space key as leader key
vim.g.mapleader = ' '

-- tlescope finders
-- search file name in project
Map('n', '<leader>a', ':lua CustomFinders.search_project()<cr>', { silent = true })
-- search file name in buffer path directory
Map('n', '<leader>l', ':lua CustomFinders.search_local()<cr>', { silent = true })
-- search inside files in project
Map('n', '<leader><Space>', ':lua CustomFinders.grep_project()<cr>', { silent = true })
-- search inside current buffer
Map('n', '<leader>s', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { silent = true })
-- goto definitions
Map('n', '<leader>r', ':lua CustomFinders.goto_references()<cr>', { silent = true })

-- dont show history list on command mode (:)
Map('n', 'q:', '<nop>', { silent = true })

Map('n', '<leader>x', ':bd<CR>', { silent = true })
Map('n', '<leader>u', ':bp<CR>', { silent = true })
Map('n', '<leader>i', ':bn<CR>', { silent = true })
Map('n', '<leader>j', ':%!jq<CR>:set filetype=json<CR>:set foldmethod=expr<CR>:set foldexpr=nvim_treesitter#foldexpr()<CR>:set foldlevel=1<CR>', { silent = true })

Map('n', '<leader>w', ':w<CR>', { silent = true })
Map('n', '<leader>o', 'O<Esc>', { silent = true })

Map('x', '<leader>p', "\"_dP")
Map('v', 'J', ":m '>+1<CR>gv=gv")
Map('v', 'K', ":m '<-2<CR>gv=gv")
Map('v', '<leader>c', '"hy:%s/<C-r>h//g<left><left>')
Map('v', '<leader>s', '"hy:%s/<C-r>h//gc<left><left><left>')

Map('n', '<leader>n', ':!nohup $TERMINAL -e nvim % &<CR><CR>', { silent = true })


require("david.core")
require("david.lazy")

--
-- enable lsp
vim.lsp.enable({'go'})
vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client:supports_method('textDocument/completion') then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

keymap = vim.keymap
opts = { noremap = true, silent = true }
opts.desc = "show lsp references"
keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

opts.desc = "Go to declaration"
keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

opts.desc = "show lsp definitions"
keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

opts.desc = "show lsp implementations"
keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

opts.desc = "show lsp type definitions"
keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

opts.desc = "see lsp code actions"
keymap.set({"n", "v"}, "<leader>ca", vim.lsp.buf.code_action, opts)

opts.desc = "smart rename"
keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

opts.desc = "show buffer diagnostics"
keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

opts.desc = "show line diagnostics"
keymap.set("n", "<leader>D", vim.diagnostic.open_float, opts)

opts.desc = "show documentation"
keymap.set("n", "<leader>k", vim.lsp.buf.hover, opts)

opts.desc = "format file"
keymap.set("n", "<leader>f", vim.lsp.buf.format, opts)
