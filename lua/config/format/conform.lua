local M = {}

M.setup = function()
  local config = {
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff_format" },
      javascript = { "biome" },
      typescript = { "biome" },
      go = { "gofumpt" },
      c = { "clang_format" },
      cpp = { "clang_format" },
    },
    format_on_save = {
      timeout_ms = 10000,
      lsp_format = "never",
    },
  }
  require("conform").setup(config)
end

return M
