return function()
  local config = {
    cmd = { "markdown-oxide" },
    filetypes = { "markdown" },
    single_file_support = true,
    root_markers = { ".git", ".obsidian", "rumdl.toml" },
  }
  vim.lsp.config("markdown_oxide", config)
  vim.lsp.enable("markdown_oxide")
end
