HOME = os.getenv("HOME")

-- precompile lua to make openin nvim faster
require("impatient")

require("packerConfig")
require("lspConfig")
require("telescopeConfig")
require("treesitterConfig")
require("statusBarConfig")
require("colorSchemeConfig")
require("indentConfig")
require("dapConfig")
require("gitsignsConfig")

-- random things
local set = vim.opt
set.wrap = false
set.number = true
set.relativenumber = true
set.signcolumn = "yes"
set.tabstop = 2
set.expandtab = true
set.shiftwidth = 2
set.cursorline = true
set.mouse="a"
set.clipboard = "unnamedplus"
set.swapfile = false
vim.opt.completeopt = 'menu,menuone,noselect'

-- show buffer tabs
set.showtabline=2

set.foldmethod = "expr"
vim.cmd("set foldexpr=nvim_treesitter#foldexpr()")

-- Helper functional wrapper for mapping custom keybindings
function map(mode, lhs, rhs, opts)
    local options = { noremap = true }
    if opts then
        options = vim.tbl_extend("force", options, opts)
    end
    vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

-- remaps
-- set space key as leader key
vim.g.mapleader = ' '

-- dont show history list on command mode (:)
map('n', 'q:', '<nop>', { silent = true })

-- telescope finders
finders = require('telescopeFinders')
-- search file name in project
map('n', '<leader>a', ':lua finders.search_project()<cr>', { silent = true })
-- search file name in buffer path directory
map('n', '<leader>l', ':lua finders.search_local()<cr>', { silent = true })
-- search inside files in project
map('n', '<leader><Space>', ':lua finders.grep_project()<cr>', { silent = true })
-- search inside current buffer
map('n', '<leader>s', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { silent = true })

-- goto definitions
map('n', '<leader>r', ':lua finders.goto_references()<cr>', { silent = true })


map('n', '<leader>x', ':bd<CR>', { silent = true })
map('n', '<leader>u', ':bp<CR>', { silent = true })
map('n', '<leader>i', ':bn<CR>', { silent = true })
map('n', '<leader>j', ':%!jq<CR>:set filetype=json<CR>:set foldmethod=expr<CR>:set foldexpr=nvim_treesitter#foldexpr()<CR>:set foldlevel=1<CR>', { silent = true })

map('n', '<leader>w', ':w<CR>', { silent = true })
map('n', '<leader>o', 'O<Esc>', { silent = true })

map('x', '<leader>p', "\"_dP")
map('v', 'J', ":m '>+1<CR>gv=gv")
map('v', 'K', ":m '<-2<CR>gv=gv")
map('v', '<leader>c', '"hy:%s/<C-r>h//g<left><left>')
map('v', '<leader>s', '"hy:%s/<C-r>h//gc<left><left><left>')

local nvim_lsp = require'lspconfig'

local on_attach = function(client)
    require'completion'.on_attach(client)
end

