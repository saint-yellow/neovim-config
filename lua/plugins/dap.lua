return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "nvim-neotest/nvim-nio",
    "theHamsta/nvim-dap-virtual-text",
  },
  keys = {
    {
      "<F5>",
      function()
        require("dap").continue()
      end,
      { desc = "Debug: Start/Continue" },
    },
    {
      "<F10>",
      function()
        require("dap").step_over()
      end,
      { desc = "Debug: Step Over" },
    },
    {
      "<F11>",
      function()
        require("dap").step_into()
      end,
      { desc = "Debug: Step Into" },
    },
    {
      "<leader>db",
      function()
        require("dap").toggle_breakpoint()
      end,
      { desc = "Debug: Toggle Breakpoint" },
    },
  },
  config = function()
    -- require("config.dap").setup()
  end,
}
