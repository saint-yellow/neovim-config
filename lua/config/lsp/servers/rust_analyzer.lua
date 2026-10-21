return function()
  local config = {
    cmd = { "rust-analyzer" },
    filetypes = { "rust" },
    root_markers = { ".git", "Cargo.toml" },
    settings = {},
  }
  vim.lsp.config("rust_analyzer", config)
  vim.lsp.enable("rust_analyzer")
end
