require('telescope').setup({})
require('telescope').load_extension('dap')
require('telescope').load_extension('recent_files')
require('telescope').load_extension('projects')

local mx = require('mapx')
local ts = require('telescope.builtin')
local tsx = require('telescope').extensions

mx.nnoremap('<leader>T', '<cmd>Telescope<CR>')

mx.nnoremap('<leader>ff', function()
  ts.fd({ hidden = true })
end, 'Find File')

mx.nnoremap('<leader>fg', function()
  ts.git_files()
end, 'Git Files')

mx.nnoremap('<leader>b', function()
  ts.buffers()
end, 'Find Buffer')

mx.nnoremap('<leader>m', function()
  ts.marks()
end, 'Find Mark')

mx.nnoremap('<leader>r', function()
  ts.lsp_document_symbols()
end, 'Find Symbol')

mx.nnoremap('<leader>R', function()
  ts.lsp_dynamic_workspace_symbols()
end, 'Find Workspace Symbol')

mx.nnoremap('<C-f>', function()
  ts.current_buffer_fuzzy_find()
end, 'Fuzzy Find in Buffer')

mx.nnoremap('<F1>', '<cmd>Cheatsheet<cr>', 'Find Commands')

mx.nnoremap('<leader>d', function()
  ts.diagnostics()
end, 'Find Diagnostic')

mx.nnoremap('<leader>o', function()
  tsx.recent_files.pick()
end, 'Find Recent Files')

mx.nnoremap('<leader>s', function()
  ts.spell_suggest()
end, 'Spell suggest')

mx.nnoremap('<leader>u', ':TodoTelescope<CR>', 'Find Todo')
