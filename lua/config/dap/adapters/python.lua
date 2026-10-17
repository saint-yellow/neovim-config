local M = {}
M.setup = function(dap)
  local function get_python_path()
    local cwd = vim.fn.getcwd()
    local venv_names = { ".venv", "venv", "env" }

    for _, name in ipairs(venv_names) do
      local python_bin = cwd .. "/" .. name .. "/bin/python"
      if vim.fn.executable(python_bin) == 1 then
        return python_bin
      end
    end

    if os.getenv("VIRTUAL_ENV") then
      return os.getenv("VIRTUAL_ENV") .. "/bin/python"
    end

    return "python"
  end

  dap.adapters.python = {
    type = "executable",
    command = "python",
    args = { "-m", "debugpy.adapter" },
  }
  dap.configurations.python = {
    {
      type = "python",
      request = "launch",
      name = "Launch file",
      program = "${file}",
    },
    {
      type = "python",
      request = "launch",
      name = "Launch Flask App \r",
      module = "flask",
      env = {
        FLASK_APP = "app.py",
        FLASK_DEBUG = "1",
      },
      args = {
        "run",
        "--no-debugger",
        "--no-reload",
      },
      jinja = true,
      pythonPath = get_python_path(),
    },
  }
end

return M
