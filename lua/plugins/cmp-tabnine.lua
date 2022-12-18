hot_reload(debug.getinfo(1).source:sub(2))

local tabnine = require('cmp_tabnine.config')

tabnine:setup({
  max_lines = 1000,
  max_num_results = 20,
  sort = true,
  priority = 5000,
  show_prediction_strength = false,
  run_on_every_keystroke = true,
  snippet_placeholder = '..',
  ignored_file_types = {
    -- default is not to ignore
    -- uncomment to ignore in lua:
    -- lua = true
  },
})
