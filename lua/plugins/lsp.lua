return {
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      -- "mason-org/mason.nvim",
      -- "mason-org/mason-lspconfig.nvim",
      -- "WhoIsSethDaniel/mason-tool-installer.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "b0o/schemastore.nvim",
    },
    config = function()
      --[[  require("mason-lspconfig").setup({
        ensure_installed = {},
        automatic_enable = false,
      }) ]]

      require("config.lsp").setup()
    end,
  },
}
