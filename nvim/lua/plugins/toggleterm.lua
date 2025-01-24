require('toggleterm').setup({
	direction = 'float',
	shell = 'powershell',
	on_open = function(term)
		vim.cmd('startinsert!')
		vim.api.nvim_buf_set_keymap(term.bufnr, 't', 'jj', '<Cmd>:stopinsert<CR>', { noremap = true, silent = true })
		vim.api.nvim_buf_set_keymap(term.bufnr, 'n', 'q', '<Cmd>exit<CR>', { noremap = true, silent = true })
	end,
})

vim.api.nvim_set_keymap('n', '<leader>t', '<Cmd>:ToggleTerm<CR>', { noremap = true, silent = true })
