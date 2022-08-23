local p = require('git-conflict')
local mx = require('mapx')

p.setup({
  default_mappings = false,
  disable_diagnostics = false,
  highlights = {
    incoming = 'DiffAdd',
    current = 'DiffChange',
  },
})

mx.nnoremap(']x', '<Plug>(git-conflict-next-conflict)', 'Next conflict')
mx.nnoremap('[x', '<Plug>(git-conflict-prev-conflict)', 'Previous conflict')

local s = '<leader>gs'
mx.nname(s, 'select')
mx.nnoremap(s .. 'h', '<Plug>(git-conflict-ours)', 'Select ours')
mx.nnoremap(s .. 'l', '<Plug>(git-conflict-theirs)', 'Select theirs')
mx.nnoremap(s .. 'j', '<Plug>(git-conflict-both)', 'Select both')
mx.nnoremap(s .. 'k', '<Plug>(git-conflict-none)', 'Select none')
