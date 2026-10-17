local M = {}

-- Define shared capabilities
M.capabilities = vim.lsp.protocol.make_client_capabilities()
M.capabilities.general.positionEncodings = { "utf-16" }

-- Shared keymaps to be applied when any LSP attaches to a buffer
M.on_attach = function(_, bufnr)
  local opts = { buffer = bufnr, silent = true }
  local keymap = vim.keymap.set

  keymap("n", "gd", vim.lsp.buf.definition, opts)
  keymap("n", "K", vim.lsp.buf.hover, opts)
  keymap("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  keymap("n", "<leader>rn", vim.lsp.buf.rename, opts)
  keymap("n", "gr", vim.lsp.buf.references, opts)
  keymap("n", "<leader>d", vim.diagnostic.open_float, opts)
end

-- Advanced synchronous formatting wrapper
M.smart_format = function()
  -- Trigger the actual formatting
  local conform = require("conform")
  local opts = {
    async = false,
    lsp_fallback = true,
  }
  conform.format(opts)
end

return M
