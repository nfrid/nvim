hot_reload(debug.getinfo(1).source:sub(2))

require('indent_blankline').setup({
  char = '▏',
  char_highlight_list = { 'IndentLine' },
  -- show_first_indent_level = false,
  use_treesitter = true,
  filetype_exclude = { 'markdown', 'tex', 'startify' },
  show_current_context = true,
})

