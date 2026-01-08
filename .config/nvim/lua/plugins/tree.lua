return {
  "nvim-tree/nvim-tree.lua",
  -- to support disabled netrw
  lazy = false,
  keys = {
    { "<leader>e", vim.cmd.NvimTreeToggle },
  },
  opts = {
    hijack_cursor = true,
    update_focused_file = { enable = true },
    view = {
      centralize_selection = true,
      signcolumn = "no",
      width = { max = 40 },
    },
    git = { timeout = 2000 },
    renderer = {
      icons = {
        symlink_arrow = " → ",
        show = {
          file = false,
          folder = false,
        },
        glyphs = {
          folder = {
            arrow_closed = "▶︎",
            arrow_open = "▼",
          },
          git = {
            staged = "*",
            unstaged = "~",
            untracked = "+",
          },
        },
      },
    },
    actions = { change_dir = { enable = false } },
    filters = {
      custom = { "^\\.DS_Store$", "__pycache__" },
    },
  },
}
