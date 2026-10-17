return function(handlers)
  local config = {
    cmd = { "tombi", "lsp" },
    filetypes = { "toml" },
    single_file_support = true,
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
  }
  vim.lsp.config("tombi", config)
  vim.lsp.enable("tombi")
end
