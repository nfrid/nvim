hot_reload(debug.getinfo(1).source:sub(2))

require('project_nvim').setup({
  ignore_lsp = { 'copilot' },
  show_hidden = true,
})
