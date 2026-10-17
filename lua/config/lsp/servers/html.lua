return function(handlers)
  local config = {
    filetypes = { "html" },
    root_markers = { ".git" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
  }
  vim.lsp.config("html", config)
  vim.lsp.enable("html")
end
