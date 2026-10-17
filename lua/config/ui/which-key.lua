local status_ok, wk = pcall(require, "which-key")
if not status_ok then
  return
end

local config = {
  preset = "modern",
  plugins = {
    marks = true,
    registers = true,
    spelling = {
      enabled = true,
      suggestions = 20,
    },
  },
  win = {
    border = "rounded",
    padding = { 1, 2 },
  },
}
wk.setup(config)

local keymaps = {
  { "<leader>f", group = "Find (Telescope)" },
  { "<leader>l", group = "LSP (Language Server)" },
  { "<leader>g", group = "Git (Gitsigns)" },
  { "<leader>q", group = "Quit/Session" },
}
wk.add(keymaps)
