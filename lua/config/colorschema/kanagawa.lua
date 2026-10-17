local kanagawa, status_ok = require("kanagawa")
if not status_ok then
  return
end

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
  transparent = false,
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
    return {}
  end,
  theme = "wave",
  background = {
    dark = "wave",
    light = "lotus",
  },
}
kanagawa.setup(config)

vim.cmd("colorscheme kanagawa-wave")
