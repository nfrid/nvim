require('luasnip.loaders.from_snipmate').lazy_load()
local snip = require('luasnip')
snip.filetype_extend('javascriptreact', { 'javascript' })
snip.filetype_extend('typescriptreact', { 'typescript' })

local mx = require('mapx')
mx.inoremap('<C-s>', function() snip.expand() end, 'Expand Snippet')
