local M = {}

M.setup = function()
  local config = {
    load = {
      ["core.integrations.treesitter"] = {
        config = {
          configure_parsers = true,
        },
      },
      ["core.defaults"] = {},
      ["core.concealer"] = {},
      ["core.dirman"] = {
        config = {
          workspaces = {
            note = "~/document/",
            journal = "~/document/",
            wiki = "~/document/",
          },
          default_workspace = "journal",
        },
      },
    },
  }
  require("neorg").setup(config)
end

return M
