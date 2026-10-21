return function()
  local config = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml" },
    single_file_support = true,
    settings = {
      redhat = { telemetry = { enabled = true } },
      yaml = { format = { enable = true } },
      schemaStore = { enable = false },
      schemas = require("schemastore").yaml.schemas(),
    },
  }
  vim.lsp.config("yamlls", config)
  vim.lsp.enable("yamlls")
end
