HOME = os.getenv("HOME")

require("packerConfig")
require("colorSchemeConfig")
require("lspConfig")
require("telescopeConfig")

-- random things
local set = vim.opt
set.wrap = false
set.number = true
set.relativenumber = true
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
-- search inside files in project
map('n', '<leader><Space>', ':lua finders.grep_project<cr>', { silent = true })
-- search inside current buffer
map('n', '<leader>s', '<cmd>Telescope current_buffer_fuzzy_find<cr>', { silent = true })
