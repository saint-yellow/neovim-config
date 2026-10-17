local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    -- UI layout
    path_display = { "truncate" }, -- Truncate long paths
    sorting_strategy = "ascending",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
      },
    },
    -- Style matching Catppuccin
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
      },
    },
    -- Ignore heavy directories
    file_ignore_patterns = { "node_modules", ".git/", ".venv/", "__pycache__" },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
})

-- Load the native fzf extension
telescope.load_extension("fzf")

-- 4. Keymaps: The "Teleport" commands
local builtin = require("telescope.builtin")
local keymap = vim.keymap.set

-- Search files by name
keymap("n", "<leader>ff", builtin.find_files, { desc = "Find Files" })
-- Search text across project (requires ripgrep)
keymap("n", "<leader>fg", builtin.live_grep, { desc = "Live Grep" })
-- Search open buffers
keymap("n", "<leader>fb", builtin.buffers, { desc = "Find Buffers" })
-- Search LSP symbols (Functions, Classes) in current buffer
keymap("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Document Symbols" })
-- Search help tags
keymap("n", "<leader>fh", builtin.help_tags, { desc = "Help Tags" })
-- Spelling suggestions
local spell_suggest = function()
  builtin.spell_suggest(require("telescope.themes").get_cursor())
end
keymap("n", "<leader>sF", spell_suggest, { desc = "Spelling Suggestions" })
