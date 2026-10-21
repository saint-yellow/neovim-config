local M = {}

M.setup = function()
  local config = {
    themes = require("config.colorscheme").colorschemes,
    livePreview = true,
  }
  require("themery").setup(config)
end

return M
