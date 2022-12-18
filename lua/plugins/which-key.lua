hot_reload(debug.getinfo(1).source:sub(2))

local wk = require('which-key')

wk.setup({
  plugins = {
    spelling = {
      enabled = true,
    }
  },
  show_help = false,
})
