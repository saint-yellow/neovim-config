return {
  {
    "zaldih/themery.nvim",
    lazy = false,
    config = function()
      require("config.colorscheme.themery").setup()
    end,
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    config = function()
      require("config.colorscheme.catppuccin").setup()
    end,
  },

  {
    "rebelot/kanagawa.nvim",
    config = function()
      require("config.colorscheme.kanagawa").setup()
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("config.colorscheme.gruvbox").setup()
    end,
  },
  {
    "folke/tokyonight.nvim",
    opts = {},
    config = function()
      require("config.colorscheme.tokyonight").setup()
    end,
  },
}
