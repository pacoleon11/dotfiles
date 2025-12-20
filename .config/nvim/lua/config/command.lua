
local cmd = vim.api.nvim_create_user_command

cmd('Vh', 'vert help <args>', { nargs = "?", complete = "help" })
