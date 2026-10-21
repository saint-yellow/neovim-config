local M = {}

function M.setup()
  require("config.lsp.keymaps").setup()

  local server_dir = vim.fn.stdpath("config") .. "/lua/config/lsp/servers"

  local files = vim.fn.glob(server_dir .. "/*.lua", false, true)

  for _, file in ipairs(files) do
    local name = vim.fn.fnamemodify(file, ":t:r")
    local ok, setup = pcall(require, "config.lsp.servers." .. name)

    if not ok then
      vim.notify(("Failed to load LSP config '%s': %s"):format(name, setup), vim.log.levels.ERROR)
    elseif type(setup) == "function" then
      local success, err = pcall(setup)

      if not success then
        vim.notify(("Failed to configure LSP '%s': %s"):format(name, err), vim.log.levels.ERROR)
      end
    end
  end
end

return M
