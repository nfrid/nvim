local treesitter = require('nvim-treesitter.configs')

treesitter.setup({
  highlight = { enable = true },

  indent = { enable = true },

  playground = { enable = true },

  rainbow = { enable = true, colors = { '#ee99ff', '#00ffd9', '#ffd700' } },

  endwise = { enable = true },

  context_commentstring = {
    enable = true,
    enable_autocmd = false,
    config = { fish = '# %s' },
  },

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
      goto_next_start = { [']f'] = '@function.outer', [']c'] = '@class.outer' },
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

-- vim.treesitter.parse_query('lua', [[
--   (node) @query
-- ]])
-- --
