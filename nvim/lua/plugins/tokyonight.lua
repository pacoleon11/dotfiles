return {
  "folke/tokyonight.nvim",
  lazy = false,
  priority = 1000,
  config = function()

    -- Setup colorscheme
    require("tokyonight").setup({
      style = "night",
      styles = {
        keywords = { italic = false },
      },
    })

    -- Set colorscheme
    vim.cmd.colorscheme("tokyonight")

  end
}
