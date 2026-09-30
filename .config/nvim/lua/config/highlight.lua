
local hl = vim.api.nvim_set_hl

hl(0, "@punctuation.delimiter", {})
hl(0, "@operator", {})
hl(0, "@variable.parameter", {})
hl(0, "@lsp.typemod.variable.defaultLibrary", { link = "Constant" })
hl(0, "@lsp.typemod.enumMember.defaultLibrary", { link = "Constant" })
hl(0, "@keyword", { link = "Statement" })

hl(0, "TrailingWhitespace", { bg = "#f7768e" })

vim.api.nvim_create_autocmd({ "BufWinEnter", "InsertLeave", "TextChanged" }, {
  callback = function()
    if vim.w.trailing_whitespace_match then
      pcall(vim.fn.matchdelete, vim.w.trailing_whitespace_match)
    end
    vim.w.trailing_whitespace_match = vim.fn.matchadd("TrailingWhitespace", [[\s\+$]])
  end,
})
