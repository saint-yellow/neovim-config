local M = {}
M.setup = function()
  local config = {
    complie = true,
    undercurl = true,
    commentStyel = {
      italic = true,
    },
    functionStyle = {},
    keywordStyle = {
      italic = true,
    },
    statementStyle = {
      bold = true,
    },
    tyepStyle = {},
    transparent = true,
    dimInactive = true,
    terminalColors = true,
    colors = {
      palette = {},
      theme = {
        wave = {},
        lotus = {},
        dragon = {},
        all = {},
      },
    },
    overrides = function(colors)
      return {
        NormalFloat = { bg = "none" },
        FloatBorder = { bg = "none" },
      }
    end,
    theme = "wave",
    background = {
      dark = "wave",
      light = "lotus",
    },
    dim_inactive = false,
  }
  require("kanagawa").setup(config)
  require("config.colorscheme").register_colorscheme("kanagawa")
end

return M
