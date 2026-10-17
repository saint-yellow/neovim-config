local status_ok, neotree = pcall(require, "neo-tree")
if not status_ok then
  return
end

neotree.setup({
  close_if_last_window = true,
  popup_border_style = "rounded",
  enable_git_status = true,
  enable_diagnostics = true,

  filesystem = {
    filtered_items = {
      visible = false,
      hide_dotfiles = false,
      hide_gitignored = true,
      hide_by_name = {
        "__pycache__",
        ".venv",
        ".git",
        ".DS_Store",
      },
      never_show = {
        ".pytest_cache",
        ".ruff_cache",
        "node_modules",
      },
    },
    follow_current_file = {
      enabled = true,
    },
    use_libuv_file_watcher = true,
  },

  window = {
    position = "float",
    width = 30,
    mappings = {
      ["<space>"] = "none",
      ["l"] = "open",
      ["h"] = "close_node",
      ["P"] = { "toggle_preview", config = { use_float = true } },
    },
  },

  default_component_configs = {
    indent = {
      with_markers = true,
      indent_marker = "│",
      last_indent_marker = "└",
    },
    icon = {
      folder_closed = "",
      folder_open = "",
      folder_empty = "󰜌",
    },
    git_status = {
      symbols = {
        added = "✚",
        modified = "",
        deleted = "✖",
        renamed = "󰁯",
        untracked = "",
        ignored = "",
        unstaged = "󰄱",
        staged = "",
        conflict = "",
      },
    },
  },
})

vim.keymap.set("n", "<leader>e", "<cmd>Neotree toggle<cr>", { desc = "Toggle Explorer" })
