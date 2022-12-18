hot_reload(debug.getinfo(1).source:sub(2))

require('colorizer').setup({
  filetypes = { '*' },
  css = { css = true },
  scss = { scc = true },
})
