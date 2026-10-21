return function()
  local config = {
    cmd = { "tombi", "lsp" },
    filetypes = { "toml" },
    single_file_support = true,
  }
  vim.lsp.config("tombi", config)
  vim.lsp.enable("tombi")
end
