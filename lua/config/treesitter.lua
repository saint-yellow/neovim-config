local status_ok, _ = pcall(require, "nvim-treesitter")
if not status_ok then
  return
end

local config = require("nvim-treesitter.config")

config.setup({
  sync_install = true,
  highlight = { enable = true },
  indent = { enable = true },
})
