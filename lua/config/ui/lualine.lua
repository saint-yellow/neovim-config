local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  return
end

-- Helper function to show active LSP clients
local function lsp_status()
  local buf_clients = vim.lsp.get_clients({ bufnr = 0 })
  if #buf_clients == 0 then
    return "No LSP"
  end
  local client_names = {}
  for _, client in ipairs(buf_clients) do
    table.insert(client_names, client.name)
  end
  return table.concat(client_names, ",")
end

local config = {
  options = {
    theme = "auto",
    component_separators = { left = "|", right = "|" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline" },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff", "diagnostics" },
    lualine_c = { { "filename", path = 1 } },
    lualine_x = { lsp_status, "encoding", "fileformat", "filetype" },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
}
lualine.setup(config)
