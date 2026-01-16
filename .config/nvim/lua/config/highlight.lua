
local hl = vim.api.nvim_set_hl

hl(0, "@punctuation.delimiter", {})
hl(0, "@operator", {})
hl(0, "@variable.parameter", {})
hl(0, "@lsp.typemod.variable.defaultLibrary", { link = "Constant" })
hl(0, "@lsp.typemod.enumMember.defaultLibrary", { link = "Constant" })
hl(0, "@keyword", { link = "Statement" })
