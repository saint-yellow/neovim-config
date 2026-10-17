return function(handlers)
    local config = {
        single_file_support = true,
        on_attach = handlers.on_attach,
    }

    vim.lsp.config("c3_lsp", config)
    vim.lsp.enable("c3_lsp")
end
