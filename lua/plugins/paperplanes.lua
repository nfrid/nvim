require('paperplanes').setup({
  register = '+',
  provider = 'paste.rs',
  provider_options = { insecure = true },
  notifier = vim.notify or print,
})
