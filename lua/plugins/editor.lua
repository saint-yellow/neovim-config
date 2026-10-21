-- Plugins for editing files.
return {
  {
    "numToStr/Comment.nvim",
    opts = {
      -- add any options here
    },
    config = function()
      require("Comment").setup({})
    end,
  },
  {
    "ellisonleao/glow.nvim",
    config = function()
      require("glow").setup({})
    end,
    cmd = "Glow",
  },
  {
    "b0o/schemastore.nvim",
  },
  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    opts = {},
  },
  {
    "hat0uma/csvview.nvim",
    ft = {
      "csv",
    },
    config = function()
      require("csvview").setup()
    end,
  },
}
