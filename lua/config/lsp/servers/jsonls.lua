return function()
  local config = {
    cmd = { "vscode-json-languageserver", "--stdio" },
    filetypes = { "json", "jsonc" },
    init_options = {
      provideFormatter = true,
    },
    single_file_support = true,
    json = {
      schemas = require("schemastore").json.schemas(),
      validate = { enable = true },
    },
  }
  vim.lsp.config("jsonls", config)
  vim.lsp.enable("jsonls")
end
