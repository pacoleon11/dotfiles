return {
  'nvim-lualine/lualine.nvim',
  -- I don't use nerdfonts
  -- dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = false,
      component_separators = "",
      section_separators = "",
      disabled_filetypes = { "NvimTree" },
    },
    sections = {
      lualine_a = {
        { 'mode', fmt = function(str) return str:sub(1,1) end }
      },
      lualine_b = {'branch'},
      lualine_c = {
        { 'filename', path = 1 }, -- relative path
        'diff',
      },
      lualine_x = {'lsp_status', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    always_show_tabline = false,
    tabline = {
      lualine_a = {
        { 'buffers', max_length = vim.o.columns },
      },
    },
  },
}
