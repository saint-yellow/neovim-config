return function(handlers)
  local config = {
    cmd = { "markdown-oxide" },
    filetypes = { "markdown" },
    single_file_support = true,
    capabilities = vim.tbl_deep_extend("force", handlers.capabilities, {
      workspace = {
        didChangeWatchedFiles = {
          dynamicRegistration = true,
        },
      },
    }),
    on_attach = handlers.on_attach,
    root_markers = { ".git", ".obsidian", "rumdl.toml" },
  }
  vim.lsp.config("markdown_oxide", config)
  vim.lsp.enable("markdown_oxide")
end
