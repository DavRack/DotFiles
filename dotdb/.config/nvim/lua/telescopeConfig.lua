require('telescope').setup{
	defaults = {
		file_ignore_patterns = {".git/*","node_modules", "env/*"},
		color_devincons = true,
		file_sorter = require('telescope.sorters').get_fzy_sorter,
    layout_config = {
      vertical = {
        width = 0.98,
      },
      horizontal = {
        width = 0.98,
      },
    },
	},
	pickers = {
	},
	extensions = {
		fzf = {
			fuzzy = true,                    -- false will only do exact matching
			override_generic_sorter = true,  -- override the generic sorter
			override_file_sorter = true,     -- override the file sorter
			case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		}
	}
}
require('telescope').load_extension('fzf')
