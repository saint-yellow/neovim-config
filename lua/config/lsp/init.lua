local M = {}

M.setup = function()
  local handlers = require("config.lsp.handlers")
  local servers_dir = vim.fn.stdpath("config") .. "/lua/config/lsp/servers"
  local files = vim.fn.glob(servers_dir .. "/*.lua", false, true)
  for _, file_path in pairs(files) do
    local server_name = vim.fn.fnamemodify(file_path, ":t:r")
    local module_path = "config.lsp.servers." .. server_name
    local status_ok, server_config = pcall(require, module_path)
    if status_ok then
      server_config(handlers)
    else
      vim.notify("LSP: failed to auto-load config for " .. server_name, vim.log.levels.ERROR)
    end
  end
end

M.opts = {
    servers = {
        ["*"] = {
            keys = {
                {"gd", "<cmd>vim.lsp.buf.definition<cr>", desc = "Go to Definition" },
                { "K", "<cmd>vim.lsp.buf.hover<cr>", desc = "Hover" },
                { "<leader>ca", "<cmd>vim.lsp.buf.code_action<cr>", desc = "Code Action"},
                { "<leader>rn", "<cmd>vim.lsp.buf.rename<cr>", desc = "Rename" },
                { "gr", "<cmd>vim.lsp.buf.references<cr>", desc = "Go to References" },
                { "<leader>d", "<cmd>vim.diagnostic.open_float<cr>", desc = "Open Diagnostic"}
            },
        },
    },
}

return M
