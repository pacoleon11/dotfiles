
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

-- Completion
opt.completeopt = "menu,popup,longest"
opt.wildmenu = true
opt.wildoptions = "pum,tagfile"
opt.wildmode = "longest:full,full"

-- Misc
opt.splitright = true
opt.cursorline = true
opt.colorcolumn = "151"
opt.clipboard = "unnamedplus"

-- Expand ${VAR} / $VAR in paths for gf (e.g. "${ROOT_PATH}/tools/bin/rcm/gen_rcm_spec_files.sh")
opt.isfname:append("$,{,}")
opt.includeexpr = "v:lua.require'config.options'.expand_env_path(v:fname)"

local M = {}
function M.expand_env_path(fname)
  return (fname:gsub("%$%b{}", function(s)
    return vim.env[s:sub(3, -2)] or s
  end):gsub("%$([%w_]+)", function(name)
    return vim.env[name] or ("$" .. name)
  end))
end

return M
