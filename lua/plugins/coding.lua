-- Plugins about programming in certain language.
return {
  {
    "ray-x/go.nvim",
    dependencies = { -- optional packages
      "ray-x/guihua.lua",
      "neovim/nvim-lspconfig",
      "nvim-treesitter/nvim-treesitter",
    },
    opts = {},
    config = function(opts)
      require("config.coding.go").setup(opts)
    end,
    event = { "CmdlineEnter" },
    filetypes = { "go", "gomod" },
    build = function()
      require("go.install").update_all_sync()
    end,
  },
}
