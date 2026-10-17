local lsp = require("config.lsp")

return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      lsp.setup()
    end,
    -- opts = lsp.options,
  },
}
