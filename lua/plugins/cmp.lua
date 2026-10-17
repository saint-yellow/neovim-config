return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp", -- Source for LSP
    "hrsh7th/cmp-buffer", -- Source for text in buffer
    "hrsh7th/cmp-path", -- Source for file system paths
    { "L3MON4D3/LuaSnip", build = "make install_jsregexp" }, -- Snippet engine
    "saadparwaiz1/cmp_luasnip", -- Snippet completions
    "rafamadriz/friendly-snippets", -- Source for snippets
  },
  config = function()
    require("config.cmp").setup()
  end,
}
