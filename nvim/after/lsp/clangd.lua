return {
  cmd = {
    "clangd",
    "--log=error",
    "--compile-commands-dir=build/fw/hostvp",
    "--background-index",
    "-j=8",
    --
    "--header-insertion=never",
    "--all-scopes-completion",
  },
  capabilities = {
    textDocument = {
      semanticTokens = { requests = { full = true } },
    },
  },
  on_attach = function(client, bufnr)
    -- Disable LSP tagfunc, use ctags instead
    vim.bo[bufnr].tagfunc = nil
  end,
}
