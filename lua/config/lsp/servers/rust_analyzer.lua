return function(handlers)
  local config = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", "Cargo.toml" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {},
  }
  vim.lsp.config("rust_analyzer", config)
  vim.lsp.enable("rust_analyzer")
end
