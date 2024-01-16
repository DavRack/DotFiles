return {
	'nvim-lualine/lualine.nvim',
	dependencies = {
		'kyazdani42/nvim-web-devicons',
	},
	config = function()
		require('lualine').setup({
			options = {
				theme = bubbles_theme,
				component_separators = '|',
				section_separators = { left = '', right = '' },
			},
			sections = {
				lualine_a = {
					{ 'mode', separator = { left = '' }, right_padding = 2 },
				},
				lualine_b = { 'branch', 'diff', 'diagnostics' },
				lualine_c = { {'filename', path = 1} },
				lualine_x = {},
				lualine_y = { 'filetype' },
				lualine_z = {
					{ 'location', separator = { right = '' }, left_padding = 2 },
				},
			},
			tabline = {
				lualine_a = {},
				lualine_b = {},
				lualine_c = { require'tabline'.tabline_buffers },
				lualine_x = { require'tabline'.tabline_tabs },
				lualine_y = {},
				lualine_z = {},
			},
		})
	end
}
