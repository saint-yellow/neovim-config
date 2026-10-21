return function()
  vim.lsp.config("kdl_lsp", {
    cmd = { "kdl-lsp" },
    filetypes = { "kdl" },
  })
  vim.lsp.enable("kdl_lsp")
end
