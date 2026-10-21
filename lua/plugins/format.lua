return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("config.format.conform").setup()
    end,
  },
}
