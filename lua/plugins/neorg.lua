local no = require('neorg')

no.setup({
  load = {
    ['core.defaults'] = {},
    ['core.norg.dirman'] = {
      config = {
        workspaces = {
          gtd = '~/Documents/gtd',
          notes = '~/Documents/Notes',
        },
        autochdir = true,
        index = 'index.norg',
      },
    },
    ['core.gtd.base'] = {
      config = {
        workspace = 'gtd',
      },
    },
    ['core.norg.concealer'] = {
      config = {
        -- icon = module.private.ordered_concealing.punctuation.dot(
        --   module.private.ordered_concealing.icon_renderer.numeric
        -- ),
      },
    },
    ['core.norg.completion'] = {
      config = {
        engine = 'nvim-cmp',
      },
    },
    ['core.keybinds'] = {
      config = {
        hook = function(keybinds)
          -- keybinds.unmap('norg', 'n', 'gtd')
          -- keybinds.map('norg', 'n', 'gtd', '<cmd>echo \'Hello!\'<CR>')
          -- keybinds.remap('norg', 'n', 'gtd', '<cmd>echo \'Hello!\'<CR>')
          -- keybinds.remap_event(
          --   'norg',
          --   'n',
          --   '<C-Space>',
          --   'core.norg.esupports.hop.hop-link'
          -- )
          -- keybinds.remap_key('norg', 'n', '<C-Space>', '<CR>')
        end,
      },
    },
  },
})
