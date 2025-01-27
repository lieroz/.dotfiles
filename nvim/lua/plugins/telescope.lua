local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff',
	"<Cmd>lua require('telescope.builtin').find_files({ find_command = {'rg', '--files', '--hidden', '-g', '!.git' }})<CR>",
	{ desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })

local actions = require('telescope.actions')
require('telescope').setup({
	defaults = {
		mappings = {
			n = {
				["q"] = actions.close
			},
		},
		file_ignore_patterns = { "build" }
	},
})
