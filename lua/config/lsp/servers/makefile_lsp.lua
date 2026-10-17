return function(handlers)
    vim.api.nvim_create_autocmd("FileType", {
        pattern = "make",
        callback = function()
            vim.lsp.start({
                name = "makefile-lsp",
                cmd = { "makefile-lsp" },
            })
        end,
    })
end
