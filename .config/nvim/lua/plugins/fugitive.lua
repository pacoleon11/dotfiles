return {
  "tpope/vim-fugitive",
  keys = {
    {
      "<leader>gr",
      function()
        local word = vim.fn.expand("<cword>")
        vim.cmd('Ggrep! --quiet ' .. word)
      end,
      silent=true,
      desc="Repository-wide git grep"
    },
    {
      "<leader>gg",
      function()
        local cwd = vim.fn.getcwd() .. '/'
        local dir = vim.fn.expand("%:p:h")
        while vim.fn.filereadable(dir .. "/tags") ~= 1 and string.find(dir, cwd, 1, true) do
          dir = vim.fn.fnamemodify(dir, ":h")
        end
        dir = vim.fn.fnamemodify(dir, ":.")
        local word = vim.fn.shellescape(vim.fn.expand("<cword>"))
        vim.cmd(string.format('Ggrep! --quiet %s %s', word, dir))
      end,
      silent=true,
      desc="git grep on directory containing `tags`"
    },
  },
  cmd = { "Ggrep" },
  config = function()
    vim.api.nvim_create_user_command('Gg', 'Ggrep! --quiet <args>', { nargs = "+" })
  end,
}
