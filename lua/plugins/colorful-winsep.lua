hot_reload(debug.getinfo(1).source:sub(2))

local p = require('colorful-winsep')
p.setup({
  highlight = {
    fg = '#ff79c6',
  },
})
