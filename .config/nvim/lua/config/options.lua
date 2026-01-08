
local opt = vim.opt

-- env
opt.shellcmdflag = "-i -c"

-- Indentation
opt.shiftwidth = 2
opt.expandtab = true
opt.smartindent = true

-- File handling
opt.swapfile = false
opt.autowrite = true
opt.confirm = true
opt.updatetime = 500

-- Line number and sign column
opt.number = true
opt.signcolumn = "yes:1" -- gitsigns

-- ignore case while searching, unless pattern contains uppercase
opt.ignorecase = true
opt.smartcase = true
opt.tagcase = "match"

-- Misc
opt.splitright = true
opt.cursorline = true
opt.colorcolumn = "151"
opt.wildmode = "longest:full,full"
opt.clipboard = "unnamedplus"
