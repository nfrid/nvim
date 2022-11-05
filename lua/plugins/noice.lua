require('notify').setup({
  -- render = 'minimal',
  -- top_down = false,
  on_open = function(win)
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_set_config(win, { border = 'none' })
    end
  end,
  background_colour = 'NormalBg',
})

require('noice').setup({
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
      view = 'mini',
      filter = { event = 'notify' },
    },
  },
  views = {
    mini = {
      view = 'mini',
      position = {
        row = -2,
      },
    },
    cmdline = {
      view = 'cmdline',
      position = {
        row = -2,
      },
    },
  },
})
