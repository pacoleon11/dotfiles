local M = {}

function M.expand_env_path(fname)
  return (fname:gsub("%$%b{}", function(s)
    return vim.env[s:sub(3, -2)] or s
  end):gsub("%$([%w_]+)", function(name)
    return vim.env[name] or ("$" .. name)
  end))
end

return M
