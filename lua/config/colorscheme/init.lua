local M = {}
M.colorschemes = {}
M.register_colorscheme = function(colorscheme_name)
  vim.cmd("colorscheme " .. colorscheme_name)
  table.insert(M.colorschemes, colorscheme_name)
end
return M
