local M = {}

M.setup = function()
  local config = {
    flavour = "mocha",
    transparent_background = true,
    term_colors = true,
    styles = {
      comments = { "italic" }, -- Italicize comments for better visual separation
      conditionals = { "italic" }, -- "if", "else"
      loops = { "bold" }, -- "for", "while"
      functions = { "bold" }, -- Function names
      keywords = { "italic" }, -- "type", "struct", "func", "return"
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "bold", "italic" },
      properties = {},
      types = { "italic" }, -- Go types like "uint64", "bool"
      operators = {},
    },
    integrations = {
      cmp = true,
      treesitter = true,
      telescope = { enabled = true },
      lsp_trouble = true,
      which_key = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
        },
      },
      underlines = {
        errors = { "undercurl" },
        hints = { "undercurl" },
        warnings = { "undercurl" },
        information = { "undercurl" },
      },
    },
  }
  require("catppuccin").setup(config)

  require("config.colorscheme").register_colorscheme("catppuccin")
end

return M
