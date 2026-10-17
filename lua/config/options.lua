local g = vim.g

-- Set leader key to space
g.mapleader = " "
g.maplocalleader = "\\"

local opt = vim.opt

-- General settings
opt.number = true -- Show line numbers
opt.relativenumber = true -- Show relative line numbers for easier jumping
opt.mouse = "a" -- Enable mouse support
opt.clipboard = "unnamedplus" -- Sync with system clipboard
opt.wrap = false -- Disable line wrap

-- Indentation (Crucial for Python)
opt.expandtab = true -- Use spaces instead of tabs
opt.shiftwidth = 4 -- Size of an indent
opt.tabstop = 4 -- Number of spaces tabs count for
opt.smartindent = true -- Insert indents automatically

-- UI settings
opt.termguicolors = true -- True color support
opt.signcolumn = "yes" -- Always show the sign column to prevent text shifting
opt.scrolloff = 8 -- Lines of context
opt.updatetime = 250 -- Faster completion (default is 4000)

local o = vim.o

o.background = "dark"
