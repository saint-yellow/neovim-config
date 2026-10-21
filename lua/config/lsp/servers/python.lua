-- 1. Configuration of Ty, a Python type checker
local ty_config = {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = {
    "ty.toml",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    ".git",
  },
}

-- 2. Configuration of Ruff, a Python LSP Server + Formatter + Linter
local ruff_config = {
  cmd = { "ruff", "server" },
  filetypes = { "python" },
  root_makers = {
    "pyproject.toml",
    "setup.py",
    ".git",
    ".venv",
    ".ruff.toml",
    "ruff.toml",
  },
  settings = {
    init_options = {
      settings = {
        lint = {
          select = {
            -- enable: pycodestyle
            "E",
            -- enable: pyflakes
            "F",
          },
          extendSelect = {
            -- enable: isort
            "I",
          },
          -- the same line length as black
          lineLength = 80,
        },
        configurationPreference = "filesystemFirst",
      },
    },
  },
}

return function()
  vim.lsp.config("ty", ty_config)
  vim.lsp.config("ruff", ruff_config)
  vim.lsp.enable({ "ty", "ruff" })
end
