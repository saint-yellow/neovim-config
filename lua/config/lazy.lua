-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Setup lazy.nvim and load plugins from lua/plugins/
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  checker = {
    enabled = true, -- Automatically check for plugin updates (true) or not (false)
    concurrency = nil,
    frequency = 3600,
    notify = true,
  },
})
