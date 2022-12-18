hot_reload(debug.getinfo(1).source:sub(2))

require('Comment').setup({
  pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
})

local ft = require('Comment.ft')

ft.set('stylus', { '//%s', '/*%s*/' })
