local keymap = vim.keymap.set

-- Clear search highlights on pressing <Esc> in normal mode
keymap("n", "<Esc>", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Navigation between buffers
keymap("n", "L", "<cmd>tabnext<cr>", { noremap = true, silent = true })
keymap("n", "H", "<cmd>tabprevious<cr>", { noremap = true, silent = true })

keymap("v", "J", ":m '>+1<cr>gv=gv", { desc = "Move selected text upwords", noremap = true, silent = true })
keymap("v", "K", ":m '<-2<cr>gv=gv", { desc = "Move selected text downwords", noremap = true, silent = true })

keymap("n", "qq", "<cmd>qa<cr>", { desc = "Quit the editor", noremap = true, silent = true })
