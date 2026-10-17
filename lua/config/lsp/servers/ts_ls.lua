return function(handlers)
  local config = {
    cmd = { "typescript-language-server" },
    filetypes = { "js", "jsx", "ts", "tsx" },
    root_markers = { ".git", "package.json", "bun.lock" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {},
  }
  vim.lsp.config("ts_ls", config)
  vim.lsp.enable("ts_ls")
end
