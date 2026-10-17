local lsp_utils = require("utils.lsp")

return function(handlers)
  -- 1. Configure Ty, a Python type checker
  vim.lsp.config("ty", {
    cmd = { "ty", "server" },
    filetypes = { "python" },
    root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
  })
  vim.lsp.enable("ty")

  -- 2. Configure Ruff, a Python LSP Server + Formatter + Linter
  vim.lsp.config("ruff", {
    cmd = { "ruff", "server" },
    filetypes = { "python" },
    root_makers = { "pyproject.toml", "setup.py", ".git", ".venv" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    on_init = function(client)
      client.server_capabilities.hoverProvider = true
    end,
  })
  vim.lsp.enable("ruff")

  -- 3. Auto-format on save
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.py",
    group = vim.api.nvim_create_augroup("PythonOnSave", { clear = true }),
    callback = function(args)
      lsp_utils.on_save({
        name = "ruff",
        kind = { "source.fixAll.ruff" },
        bufnr = args.buf,
      })
      vim.lsp.buf.format({ async = false })
    end,
  })
end
