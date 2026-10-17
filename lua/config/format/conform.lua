local M = {}

M.setup = function()
  require("conform").setup({
    formatters_by_ft = {
      lua = { "stylua" },
      python = { "ruff" },
      javascript = { "prettier" },
      typescript = { "prettier" },
      go = { "gofmt" },
    },
  })
end

return M
