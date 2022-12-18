hot_reload(debug.getinfo(1).source:sub(2))

require('zen-mode').setup({
  window = {
    width = 80,
  },
  on_open = function()
    require('wrapping').soft_wrap_mode()
  end,
})
