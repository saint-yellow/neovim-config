return {
    {
        "catppuccin/nvim",
        enabled = false,
        name = "catppuccin",
        config = function()
            require("config.colorschema.catppuccin")
        end,
    },
    {
        "rebelot/kanagawa.nvim",
        enabled = false,
        config = function()
            require("config.colorschema.kanagawa")
        end,
    },
    {
        "ellisonleao/gruvbox.nvim",
        enabled = true,
        config = function()
            require("config.colorschema.gruvbox")
        end,
        opts = {},
    },
    {
        "zaldih/themery.nvim",
        lazy = false,
        config = function()
            require("config.colorschema.themery")
        end,
    },
}
