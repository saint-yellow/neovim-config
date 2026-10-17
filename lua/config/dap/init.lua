local M = {}

local debug_tab = nil
local pre_debug_tab = nil

--local keymap = vim.keymap.set
--keymap("n", "<F5>", function() require('dap').continue() end, { desc = "Debug: Start/Continue" })
--keymap("n", "<F10>", function() require('dap').step_over() end, { desc = "Debug: Step Over" })
--keymap("n", "<F11>", function() require('dap').step_into() end, { desc = "Debug: Step Into" })
--keymap("n", "<leader>db", function() require('dap').toggle_breakpoint() end, { desc = "Debug: Toggle Breakpoint" })

M.setup = function()
  local dap = require("dap")
  local dapui = require("dapui")
  local dapvt = require("nvim-dap-virtual-text")

  dapvt.setup()
  dapui.setup()

  local function cleanup_debug_workspace()
    dapui.close()
    if debug_tab and vim.api.nvim_tabpage_is_valid(debug_tab) then
      vim.api.nvim_set_current_tabpage(debug_tab)
      vim.cmd("tabclose")
      debug_tab = nil
    end
    if pre_debug_tab and vim.api.nvim_tabpage_is_valid(pre_debug_tab) then
      vim.api.nvim_set_current_tabpage(pre_debug_tab)
      pre_debug_tab = nil
    end
  end

  dap.listeners.after.event_initialized["dap_workspace_config"] = function()
    pre_debug_tab = vim.api.nvim_get_current_tabpage()
    vim.cmd("tabnew")
    debug_tab = vim.api.nvim_get_current_tabpage()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dap_workspace_config"] = function()
    cleanup_debug_workspace()
  end

  dap.listeners.before.event_exited["dap_workspace_config"] = function()
    cleanup_debug_workspace()
  end

  local config_dir = vim.fn.stdpath("config")
  local langs_dir = config_dir .. "/lua/config/dap/adapters"
  local files = vim.fn.glob(langs_dir .. "/*.lua", false, true)

  for _, file_path in ipairs(files) do
    local lang_name = vim.fn.fnamemodify(file_path, ":t:r")
    local status_ok, lang_mod = pcall(require, "config.dap.adapters." .. lang_name)
    if status_ok and type(lang_mod) == "table" and lang_mod.setup then
      lang_mod.setup(dap)
    else
      vim.notify(
        string.format("DAP Scanner：loading language module [%s] failed or wrong format", lang_name),
        vim.log.levels.ERROR,
        { title = "DAP Modules Error", icon = "󰚌 " }
      )
    end
  end
end

return M
