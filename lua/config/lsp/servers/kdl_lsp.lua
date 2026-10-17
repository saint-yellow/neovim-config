return function(handlers)
  vim.lsp.config("kdl_lsp", {
    cmd = { "kdl-lsp" },
    filetypes = { "kdl" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
  })
  vim.lsp.enable("kdl_lsp")
end
