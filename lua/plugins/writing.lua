-- Plugins for writing in files like markdown, latex, org, .etc.
return {
  {
    "folke/zen-mode.nvim",
    keys = {
      { "<leader>z", "<cmd>ZenMode<cr>", desc = "Toogle Zen Mode" },
    },
    config = function()
      require("config.writing.zen-mode").setup()
    end,
  },
  {
    "folke/twilight.nvim",
    opts = {},
  },
  {
    "OXY2DEV/markview.nvim",
    -- Completion for `blink.cmp`
    -- dependencies = { "saghen/blink.cmp" },
  },
  {
    "delphinus/md-render.nvim",
    version = "*",
    dependencies = {
      { "nvim-tree/nvim-web-devicons", version = "*" },
      { "delphinus/budoux.lua", version = "*" },
    },
    keys = {
      { "<leader>mp", "<Plug>(md-render-preview)" },
      { "<leader>mt", "<Plug>(md-render-preview-tab)" },
      { "<leader>md", "<Plug>(md-render-demo)" },
    },
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = "cd app && yarn install",
    init = function()
      vim.g.mkdp_filetypes = { "markdown" }
    end,
    ft = { "markdown" },
  },
  {
    "nvim-neorg/neorg",
    dependencies = {
      "nvim-neorg/tree-sitter-norg",
      "nvim-neorg/tree-sitter-norg-meta",
    },
    lazy = false,
    version = false,
    config = function()
      require("config.writing.neorg").setup()
    end,
  },
}
