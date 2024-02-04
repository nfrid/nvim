---@type LazySpec
local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'smartpde/telescope-recent-files',
    'folke/todo-comments.nvim',
    'ahmedkhalf/project.nvim',
    'fdschmidt93/telescope-egrepify.nvim',
  },
  cmd = { 'Telescope' },
}

M.setup = function()
  local t = require('telescope')
  t.setup({})
  t.load_extension('dap')
  t.load_extension('recent_files')
  t.load_extension('projects')
  t.load_extension('todo-comments')
  t.load_extension('egrepify')
end

M.init = function()
  local mx = require('mapx')
  local ts = require('telescope.builtin')
  local tsx = require('telescope').extensions

  -- get currently selected text
  local function get_visual_selection()
    vim.cmd('noau normal! "vy"')
    return vim.fn.getreg('v')
  end

  ---@param key string|table
  ---@param fn function
  ---@param label string
  ---@param opts table|nil
  local function map(key, fn, label, opts)
    if not opts then
      opts = {}
    end

    if type(key) == 'string' then
      key = '<leader>' .. key
    else
      key = key[0]
    end

    mx.nnoremap(key, function()
      fn(opts)
    end, label)

    mx.vnoremap(key, function()
      local selected = get_visual_selection()
      local def_text = selected or opts.default_text
      fn({ opts, default_text = def_text })
    end, label)
  end

  -- map('T', ts.live_grep, 'Live Grep')
  map('T', tsx.egrepify.egrepify, 'Live Grep')
  map('ff', ts.fd, 'Find File')
  map('fg', ts.git_files, 'Git Files')
  map('b', ts.buffers, 'Find Buffer')
  map('m', ts.marks, 'Find Mark')
  map('r', ts.lsp_document_symbols, 'Find Symbol')
  map('R', ts.lsp_dynamic_workspace_symbols, 'Find Workspace Symbol')
  map({ '<C-f>' }, ts.current_buffer_fuzzy_find, 'Fuzzy Find in Buffer')
  -- map('d', ts.diagnostics, 'Find Diagnostic')
  map('o', tsx.recent_files.pick, 'Find Recent Files')
  map({ 'gs' }, ts.spell_suggest, 'Spell suggest')
  map('pp', tsx.projects.projects, 'Project')
  map('gf', ts.git_bcommits, 'Todos')
  map('pt', tsx['todo-comments'].todo, 'Todos')

  mx.nnoremap('<F1>', '<cmd>Cheatsheet<cr>', 'Find Commands')

  mx.nnoremap('<leader>yr', function()
    ts.lsp_workspace_symbols({ query = vim.fn.getreg('*') })
  end, 'Find Yanked Workspace Symbol')
end

return M
