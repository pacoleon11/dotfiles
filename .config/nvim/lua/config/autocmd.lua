
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "TextChanged", "TextChangedI" }, { command = "silent! update" })
autocmd({ "TermEnter" }, { command = "startinsert" })
