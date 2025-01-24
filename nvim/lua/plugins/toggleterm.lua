require('toggleterm').setup({
	direction = 'float',
	shell = 'powershell'
})

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<leader>t', '<Cmd>:ToggleTerm<CR>', opts)
