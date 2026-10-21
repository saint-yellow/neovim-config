return function()
  local config = {
    filetypes = { "html" },
    root_markers = { ".git" },
  }
  vim.lsp.config("html", config)
  vim.lsp.enable("html")
end
