local M = {}

M.setup = function()
  local cmp = require("cmp")
  local luasnip = require("luasnip")
  local cmp_autopairs = require("nvim-autopairs.completion.cmp")

  cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-j>"] = cmp.mapping.select_next_item(), -- Next item
      ["<C-k>"] = cmp.mapping.select_prev_item(), -- Previous item
      ["<C-Space>"] = cmp.mapping.complete(), -- Trigger completion menu
      ["<CR>"] = cmp.mapping.confirm({ select = false }), -- Confirm selection
      ["<Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),
      ["<S-Tab>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" }, -- LSP suggestions
      { name = "luasnip" }, -- Snippets
      { name = "buffer" }, -- Buffer words
      { name = "path" }, -- File paths
    }),
  })
end

return M
