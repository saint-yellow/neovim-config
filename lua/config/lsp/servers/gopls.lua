return function(handlers)
  local config = {
    cmd = { "gopls" },
    filetypes = { "go", "gomod", "gowork" },
    root_markers = { "go.mod", "go.sum", "go.work", ".git" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      gopls = {
        completeUnimported = true,
        usePlaceholders = true,
        analyses = {
          unusedparams = true,
        },
        staticcheck = true,
        gofumpt = true,
      },
    },
  }
  vim.lsp.config("gopls", config)
  vim.lsp.enable("gopls")
end
