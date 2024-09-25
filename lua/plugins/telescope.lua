---@type LazySpec
local M = {
  'nvim-telescope/telescope.nvim',
  dependencies = {
    'nvim-lua/popup.nvim',
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope-dap.nvim',
    'smartpde/telescope-recent-files',
    'folke/todo-comments.nvim',
    -- 'ahmedkhalf/project.nvim',
    'fdschmidt93/telescope-egrepify.nvim',
    -- 'nvim-telescope/telescope-frecency.nvim',
    {
      'polirritmico/telescope-lazy-plugins.nvim',
    },
    {
      'danielfalk/smart-open.nvim',
      dependencies = {
        'kkharji/sqlite.lua',
        'nvim-telescope/telescope.nvim',
        'nvim-tree/nvim-web-devicons',
        'nvim-telescope/telescope-fzy-native.nvim',
      },
    }
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<C-u>'] = false,
        },
      },
    },
    extensions = {
      lazy_plugins = {
        lazy_config = vim.fn.stdpath('config') .. '/lua/plugins.lua',
      },
      frecency = {
        ignore_patterns = {
          '*.git/*',
          '*/tmp/*',
          'term://*',
          '*/node_modules/*',
          '*/.uploads/*',
          '*/.cache/*',
        },
        filter_delimiter = ';',
        default_workspace = 'CWD',
        workspaces = {
          ['cfg'] = '~/.config',
          ['job'] = '~/job',
          ['gh'] = '~/github',
          ['notes'] = '~/Documents/Notes',
        },
        matcher = 'fuzzy',
        ---@diagnostic disable-next-line: unused-local
        scoring_function = function(recency, fzy_score)
          return -recency
        end
      },
    },
  },
  cmd = { 'Telescope' },
  setup = function()
    local t = require('telescope')
    t.load_extension('dap')
    t.load_extension('recent_files')
    t.load_extension('projects')
    t.load_extension('todo-comments')
    t.load_extension('egrepify')
    -- t.load_extension('frecency')
    t.load_extension('smart_open')
    t.load_extension('lazy_plugins')
  end,
  init = function()
    local ts = require('telescope.builtin')
    local tsx = require('telescope').extensions

    local ivy = require('telescope.themes').get_ivy

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
        key = key[1]
      end

      if not key then
        vim.notify('Telescope: Invalid key for ' .. label, vim.log.levels.ERROR)
        return
      end

      vim.keymap.set('n', key, function()
        fn(ivy(opts))
      end, { desc = label })

      vim.keymap.set('v', key, function()
        local selected = get_visual_selection()
        local def_text = selected or opts.default_text
        fn(ivy({ opts, default_text = def_text }))
      end, { desc = label })
    end

    map('t<leader>', ts.resume, 'Resume')

    map('k', tsx.smart_open.smart_open, 'Smart Open')
    -- map('F', ts.live_grep, 'Live Grep')
    map('F', tsx.egrepify.egrepify, 'Live Grep')
    map('ff', tsx.smart_open.smart_open, 'Smart Open')
    -- map('ff', tsx.frecency.frecency, 'Find Frecent Files')
    map('fF', ts.fd, 'Find File')
    map('fg', ts.git_files, 'Git Files')
    map('b', ts.buffers, 'Find Buffer')
    map('m', ts.marks, 'Find Mark')
    map('r', ts.lsp_document_symbols, 'Find Symbol')
    map('R', ts.lsp_dynamic_workspace_symbols, 'Find Workspace Symbol')
    map({ '<C-f>' }, ts.current_buffer_fuzzy_find, 'Fuzzy Find in Buffer')
    -- map('d', ts.diagnostics, 'Find Diagnostic')
    map('o', tsx.recent_files.pick, 'Find Recent Files')
    -- map('o', tsx.frecency.frecency, 'Find Frecent Files')
    map({ 'gs' }, ts.spell_suggest, 'Spell suggest')
    map('pp', tsx.projects.projects, 'Project')
    map('gf', ts.git_bcommits, 'Todos')
    map('pt', tsx['todo-comments'].todo, 'Todos')
    map('tl', tsx.lazy_plugins.lazy_plugins, 'Lazy Plugins')

    vim.keymap.set(
      'n',
      '<F1>',
      '<cmd>Cheatsheet<cr>',
      { desc = 'Find Commands' }
    )

    vim.keymap.set('n', '<leader>yr', function()
      ts.lsp_workspace_symbols({ query = vim.fn.getreg('*') })
    end, { desc = 'Find Yanked Workspace Symbol' })
  end,
}

return M
