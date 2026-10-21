return function()
  local config = {
    cmd = { "typescript-language-server" },
    filetypes = { "js", "jsx", "ts", "tsx" },
    root_markers = { ".git", "package.json", "bun.lock" },
    settings = {},
  }
  vim.lsp.config("ts_ls", config)
  vim.lsp.enable("ts_ls")
end
