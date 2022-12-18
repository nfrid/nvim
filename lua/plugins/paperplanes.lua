hot_reload(debug.getinfo(1).source:sub(2))

require('paperplanes').setup({
  register = '+',
  provider = 'paste.rs',
  provider_options = { insecure = true },
  notifier = vim.notify or print,
})
