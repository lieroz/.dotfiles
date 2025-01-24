local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<A-1>', '<Cmd>lua require("harpoon.ui").nav_prev()<CR>', opts)
map('n', '<A-2>', '<Cmd>lua require("harpoon.ui").nav_next()<CR>', opts)
map('n', '<A-q>', '<Cmd>lua require("harpoon.mark").add_file()<CR>', opts)
map('n', '<A-w>', '<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)
