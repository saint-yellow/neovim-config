return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate all",
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    require("config.treesitter").setup()
  end,
}
