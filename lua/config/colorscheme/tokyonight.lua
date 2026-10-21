local M = {}
M.setup = function()
  local config = {
    transparent = true, -- Enable this to disable setting the background color
    styles = {
      sidebars = "transparent", -- Set sidebars style to transparent
      floats = "transparent", -- Set floating windows style to transparent
    },
  }
  require("tokyonight").setup(config)
  require("config.colorscheme").register_colorscheme("tokyonight")
end
return M
