return function(handlers)
  vim.lsp.config("lua_ls", {
    cmd = { "lua-language-server" },
    capabilities = handlers.capabilities,
    on_attach = handlers.on_attach,
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          library = vim.api.nvim_get_runtime_file("", true),
          checkThirdParty = false,
        },
      },
    },
  })

  vim.lsp.enable("lua_ls")

  -- Autocmd for Lua
  vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*.lua",
    callback = function()
      handlers.smart_format()
    end,
  })
end
