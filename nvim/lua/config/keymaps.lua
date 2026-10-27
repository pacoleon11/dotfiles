
local map = vim.keymap.set


map('n', '<leader>q', '<cmd>cclose<cr>', { silent = true })

map('n', '<leader>i', '<cmd>Inspect<cr>', { silent = true })

-- Copy
map('n', '<leader>yw', '<cmd>let @+ = expand("<cword>")<cr>', { silent = true })
map('n', '<leader>yW', '<cmd>let @+ = expand("<CWORD>")<cr>', { silent = true })
map('n', '<leader>yf', '<cmd>let @+ = expand("%")<cr>', { silent = true })
map('n', '<leader>yg', '<cmd>let @+ = expand("%:p")<cr>', { silent = true })
map('n', '<leader>yh', '<cmd>let @+ = expand("%:t")<cr>', { silent = true })
map('n', '<leader>yl', "<cmd>let @+ = trim(getline('.'))<cr>", { silent = true })
