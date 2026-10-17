return function(handlers)
  vim.lsp.config("yamlls", {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
    single_file_support = true,
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      redhat = { telemetry = { enabled = true } },
      yaml = { format = { enable = true } },
      schemaStore = { enable = true },
      schemas = require("schemastore").yaml.schemas(),
    },
  })
  vim.lsp.enable("yamlls")
end
