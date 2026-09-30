return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    local languages = { "python", "bash", "zsh", "yaml", "cpp" }
    require("nvim-treesitter").install(languages)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = languages,
      callback = function() vim.treesitter.start() end,
    })
  end,
}
