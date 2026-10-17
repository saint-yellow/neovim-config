return function(handlers)
    local config = {
        root_markers = { "Makefile" },
        capabilities = handlers.capabilities,
        on_attach = handlers.on_attach,
    }

    vim.lsp.config("clangd", config)
    vim.lsp.enable("clangd")
end
