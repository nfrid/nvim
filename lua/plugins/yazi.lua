---@type LazySpec
local M = {
  'mikavilpas/yazi.nvim',
  event = 'VeryLazy',
  keys = {
    {
      '<leader>fd',
      function()
        require('yazi').yazi()
      end,
      desc = 'Open the file manager',
    },
    {
      -- Open in the current working directory
      '<leader>fD',
      function()
        require('yazi').yazi(nil, vim.fn.getcwd())
      end,
      desc = "Open the file manager in nvim's working directory",
    },
  },
  opts = {
    open_for_directories = false,
    -- use_ya_for_events_reading = true,
    highlight_groups = {
      hovered_buffer = nil, -- { link = 'Visual' },
    },
  },
}

return M
