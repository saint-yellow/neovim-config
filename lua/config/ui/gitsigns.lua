local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  return
end

local config = {
  signs = {
    add = { text = "▎" },
    change = { text = "▎" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "▎" },
  },
}
gitsigns.setup(config)
