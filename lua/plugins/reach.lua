local r = require('reach')
r.setup()
local mx = require('mapx')
local opts = {
  handle = 'auto',
  auto_handles = vim.split('fjdksla;gheiworuc,x.vm', '')
}
mx.nnoremap('<leader><leader>', function() r.buffers(opts) end, 'Reach Buffers')
