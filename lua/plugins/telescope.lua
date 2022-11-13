require('telescope').setup({})
require('telescope').load_extension('dap')
require('telescope').load_extension('recent_files')
require('telescope').load_extension('projects')

local mx = require('mapx')
local ts = require('telescope.builtin')
local tsx = require('telescope').extensions

-- get currently selected text
local function get_visual_selection()
  vim.cmd('noau normal! "vy"')
  return vim.fn.getreg('v')
end

local function map(key, fn, label, opts)
  if type(fn) == 'string' then
    ---@diagnostic disable-next-line: unused-vararg
    fn = function(...)
      vim.cmd(fn)
    end
  end

  mx.nnoremap('<leader>' .. key, function()
    fn(opts)
  end, label)

  mx.vnoremap('<leader>' .. key, function()
    local selected = get_visual_selection()
    local def_text = selected or opts.default_text
    fn({ opts, default_text = def_text })
  end, label)
end

map('T', ts.live_grep, 'Live Grep')
map('ff', ts.fd, 'Find File')
map('fg', ts.git_files, 'Git Files')
map('b', ts.buffers, 'Find Buffer')
map('m', ts.marks, 'Find Mark')
map('r', ts.lsp_document_symbols, 'Find Symbol')
map('R', ts.lsp_dynamic_workspace_symbols, 'Find Workspace Symbol')
map('', ts.current_buffer_fuzzy_find, 'Fuzzy Find in Buffer')
map('d', ts.diagnostics, 'Find Diagnostic')
map('o', tsx.recent_files.pick, 'Find Recent Files')
map('s', ts.spell_suggest, 'Spell suggest')
map('u', ':TodoTelescope<CR>', 'Find Todo')

mx.nnoremap('<F1>', '<cmd>Cheatsheet<cr>', 'Find Commands')

mx.nnoremap('<leader>yr', function()
  ts.lsp_workspace_symbols({ query = vim.fn.getreg('*') })
end, 'Find Yanked Workspace Symbol')
