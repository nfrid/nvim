---@type LazySpec
local M = {
  'folke/noice.nvim',
  event = { 'VimEnter' },
  dependencies = {
    'MunifTanjim/nui.nvim',
    {
      'rcarriga/nvim-notify',
      opts = {
        render = 'wrapped-compact',
      },
    },
  },
  opts = {
    messages = {
      enabled = false,
    },
    cmdline = {
      view = 'cmdline',
      view_search = 'cmdline',
      -- view = 'mini',
      format = {
        search_down = {
          kind = 'search',
          pattern = '^/',
          icon = '',
          ft = 'regex',
        },
        search_up = {
          kind = 'search',
          pattern = '^%?',
          icon = '',
          ft = 'regex',
        },
        filter = { pattern = '^:%s*!', icon = '$', ft = 'sh' },
        lua = { pattern = '^:%s*lua%s+', icon = '', ft = 'lua' },
      },
    },
    popupmenu = {
      enabled = false,
    },
    routes = {
      {
        filter = {
          event = 'msg_show',
          kind = 'search_count',
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = 'notify',
          find = 'No information available',
        },
        opts = { skip = true },
      },
      {
        filter = {
          event = 'notify',
          find = 'ts_ls: 1: <semantic> TypeScript Server',
        },
        opts = { skip = true },
      },
    },
    views = {
      mini = {
        view = 'mini',
        position = {
          row = -1,
        },
      },
      cmdline = {
        view = 'cmdline',
        position = {
          row = -1,
        },
      },
    },
  },
}

return M
