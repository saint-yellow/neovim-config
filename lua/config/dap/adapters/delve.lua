local M = {}

M.setup = function(dap)
  dap.adapters.go = {
    type = "server",
    port = "${port}",
    executable = {
      command = "dlv",
      args = { "dap", "-l", "127.0.0.1:${port}" },
      detached = vim.fn.has("win32") == 0,
    },
  }

  dap.configurations.go = {
    {
      type = "go",
      name = "Debug (Launch Package)",
      request = "launch",
      program = "${fileDirname}",
    },
    {
      type = "go",
      name = "Debug (Launch File)",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Debug (Test)",
      request = "launch",
      mode = "test",
      program = "${fileDirname}",
    },
  }
end

return M
