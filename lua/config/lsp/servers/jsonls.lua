return function(handlers)
  local capabilities = handlers.capabilities
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  local config = {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
      provideFormatter = true,
    },
    single_file_support = true,
    capabilities = capabilities,
    on_attach = handlers.on_attach,
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  }
  vim.lsp.config("jsonls", config)
  vim.lsp.enable("jsonls")
end
