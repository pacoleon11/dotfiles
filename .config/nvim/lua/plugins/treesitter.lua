return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  lazy = false,
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({ "python", "bash" })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "python", "bash", "sh" },
      callback = function() vim.treesitter.start() end,
    })
  end,
}
