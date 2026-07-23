
local autocmd = vim.api.nvim_create_autocmd

autocmd({ "TextChanged", "TextChangedI" }, {
  callback = function()
    if vim.bo.modified
      and vim.bo.modifiable
      and not vim.bo.readonly
      and vim.fn.expand("%") ~= "" then
      vim.cmd("silent update")
    end
  end,
})
autocmd({ "TermOpen", "TermEnter" }, { command = "startinsert" })
