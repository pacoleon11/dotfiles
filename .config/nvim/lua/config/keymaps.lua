
local map = vim.keymap.set

map('n', '<leader>i', ":Inspect<cr>", { silent = true })

-- Copy
map('n', '<leader>yw', ':let @+ = expand("<cword>")<cr>', { silent = true })
map('n', '<leader>yW', ':let @+ = expand("<CWORD>")<cr>', { silent = true })
map('n', '<leader>yf', ':let @+ = expand("%")<cr>', { silent = true })
map('n', '<leader>yg', ':let @+ = expand("%:p")<cr>', { silent = true })
map('n', '<leader>yh', ':let @+ = expand("%:t")<cr>', { silent = true })
map('n', '<leader>yl', ":let @+ = trim(getline('.'))<cr>", { silent = true })
