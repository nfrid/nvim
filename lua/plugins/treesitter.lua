---@type LazySpec
local M = {
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/playground',
    'HiPhish/rainbow-delimiters.nvim',
    'JoosepAlviste/nvim-ts-context-commentstring',
    'windwp/nvim-ts-autotag',
    'nvim-treesitter/nvim-treesitter-textobjects',
    'RRethy/nvim-treesitter-textsubjects',
    'RRethy/nvim-treesitter-endwise',
  },
  build = function()
    vim.cmd('TSUpdate')
  end,
  event = { 'BufReadPost' },
}

M.config = function()
  local rainbow_delimiters = require('rainbow-delimiters')

  vim.g.rainbow_delimiters = {
    strategy = {
      [''] = rainbow_delimiters.strategy['global'],
      vim = rainbow_delimiters.strategy['local'],
    },
    query = {
      [''] = 'rainbow-delimiters',
      lua = 'rainbow-blocks',
      latex = 'rainbow-blocks',
      javascript = 'rainbow-parens',
      typescript = 'rainbow-parens',
      tsx = 'rainbow-parens',
      python = 'rainbow-delimiters',
      html = 'rainbow-delimiters',
    },
    highlight = {
      'rainbow1',
      'rainbow2',
      'rainbow3',
      'rainbow4',
      'rainbow5',
      'rainbow6',
      'rainbow7',
      'rainbow8',
      'rainbow9',
    },
  }

  local treesitter = require('nvim-treesitter.configs')

  treesitter.setup({
    modules = {},
    ensure_installed = {},
    sync_install = false,
    auto_install = true,
    ignore_install = {},
    highlight = { enable = true },
    indent = { enable = true },
    playground = { enable = true },
    endwise = { enable = true },
    autotag = { enable = true },
    textobjects = {
      select = {
        enable = true,
        keymaps = {
          ['af'] = '@function.outer',
          ['if'] = '@function.inner',
          ['aC'] = '@class.outer',
          ['iC'] = '@class.inner',
          ['al'] = '@loop.outer',
          ['il'] = '@loop.inner',
          ['ab'] = '@block.outer',
          ['ib'] = '@block.inner',
          ['ic'] = '@comment.outer',
        },
      },
      swap = {
        enable = true,
        swap_next = { ['<leader>.'] = '@parameter.inner' },
        swap_previous = { ['<leader>,'] = '@parameter.inner' },
      },
      move = {
        enable = true,
        set_jumps = true,
        goto_next_start = {
          [']f'] = '@function.outer',
          [']c'] = '@class.outer',
        },
        goto_next_end = { [']F'] = '@function.outer', [']C'] = '@class.outer' },
        goto_previous_start = {
          ['[f'] = '@function.outer',
          ['[c'] = '@class.outer',
        },
        goto_previous_end = {
          ['[F'] = '@function.outer',
          ['[C'] = '@class.outer',
        },
      },
    },
    textsubjects = {
      enable = true,
      prev_selection = ',',
      keymaps = {
        ['.'] = 'textsubjects-smart',
        [';'] = 'textsubjects-container-outer',
        ['i;'] = 'textsubjects-container-inner',
      },
    },
  })

  vim.opt.foldmethod = 'expr'
  vim.opt.foldexpr = 'nvim_treesitter#foldexpr()'

  vim.treesitter.language.register('html', 'xml')

  -- vim.treesitter.parse_query('lua', [[
  --   (node) @query
  -- ]])

  local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
  parser_config.d2 = {
    install_info = {
      url = 'https://git.pleshevski.ru/pleshevskiy/tree-sitter-d2',
      revision = 'main',
      files = { 'src/parser.c', 'src/scanner.cc' },
    },
  }
end

return M
