local status_ok, noice = pcall(require, "noice")
if not status_ok then
  return
end

local config = {
  lsp = {
    progress = {
      enabled = true,
      format = "lsp_pregress",
    },
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.extract_stacktrace"] = true,
      ["formatting.lsp_format"] = true,
    },
    routes = {
      --[[       {
        filter = {
          event = "msg_show",
          find = "written",
        },
        opts = {
          skip = true,
        },
      },
  ]]
      {
        filter = {
          event = "lsp",
          kind = "progress",
          any = {
            { find = "pyright" },
            { fing = "basedpyright" },
          },
        },
        opts = {
          skip = true,
        },
      },
    },
    presets = {
      bottom_search = true,
      command_palette = true,
      long_message_to_split = true,
      inc_rename = false,
    },
    signature = {
      enabled = true,
    },
    hover = {
      enabled = false,
    },
  },
}

require("notify").setup({
  background_colour = "#000000",
})
noice.setup(config)
