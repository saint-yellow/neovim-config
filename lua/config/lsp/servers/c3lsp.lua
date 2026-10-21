return function()
  local config = {
    cmd = { "c3lsp" },
    filetypes = { "c3", "c3i" },
    root_markers = {
      "project.json",
      "c3.toml",
      ".git",
    },
  }

  vim.lsp.config("c3_lsp", config)
  vim.lsp.enable("c3_lsp")
end
