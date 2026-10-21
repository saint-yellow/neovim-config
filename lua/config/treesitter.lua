local M = {}

M.setup = function()
  local config = {
    ensure_installed = {},
    sync_install = true,
    highlight = { enbale = true },
    indent = { enable = true },
  }
  require("nvim-treesitter.config").setup(config)
end

return M
