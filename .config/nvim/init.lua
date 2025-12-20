-- From nvim-tree: It is strongly advised to eagerly
-- disable netrw, due to race conditions
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

require("config.lazy")

require("config.options")
require("config.keymaps")
require("config.autocmd")
require("config.command")
