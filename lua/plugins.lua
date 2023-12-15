---@type LazySpec
local M = {
  'antoinemadec/FixCursorHold.nvim',

  {
    'mateuszwieloch/automkdir.nvim',
    lazy = false,
  },

  {
    'nvimdev/guard.nvim',
    dependencies = {
      'nvimdev/guard-collection',
    },
    lazy = false,
    config = function()
      local ft = require('guard.filetype')

      -- ft('typescript,javascript,typescriptreact,javascriptreact')
      --   :fmt('prettier')
      --   :lint('eslint_d')

      ft('json,css,scss,html,markdown,yaml,toml'):fmt('prettier')

      ft('lua'):fmt('lsp'):append('stylua')

      ft('sh,bash'):fmt('shfmt'):lint('shellcheck')

      ft('python'):fmt('black')

      ft('go'):fmt('gofmt')

      ft('c,cpp'):fmt('clang-format'):lint('clang-tidy')

      ft('cmake'):fmt({
        cmd = 'cmake-format',
        args = { '-i' },
      })

      require('guard').setup({
        fmt_on_save = true,
        lsp_as_default_formatter = false,
      })
    end,
  },

  {
    'michaelb/sniprun',
    branch = 'master',
    cmd = { 'SnipRun', 'SnipLive', 'SnipRunOperator' },
    build = 'sh install.sh',
    dependencies = { 'rcarriga/nvim-notify' },
    opts = {
      display = { 'NvimNotify' },
      display_options = {
        notification_timeout = 60, -- in seconds
      },
      live_mode_toggle = 'enable',
      live_display = { 'NvimNotify', 'TerminalOk' },
    },
  },

  {
    'tadmccorkle/markdown.nvim',
    event = 'VeryLazy',
    opts = {},
    ft = { 'markdown' },
  },

  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    ft = { 'markdown', 'rmd', 'org', 'norg' },
  },

  {
    'gsuuon/tshjkl.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    opts = {
      marks = {
        parent = {
          hl_group = 'DraculaBgLight',
        },
      },
    },
    lazy = false,
  },

  {
    'hinell/lsp-timeout.nvim',
    dependencies = { 'neovim/nvim-lspconfig' },
  },

  {
    'VidocqH/lsp-lens.nvim',
    event = 'LspAttach',
    config = true,
  },

  {
    'mikesmithgh/kitty-scrollback.nvim',
    cmd = { 'KittyScrollbackGenerateKittens', 'KittyScrollbackCheckHealth' },
    config = true,
  },

  {
    'ashfinal/qfview.nvim',
    config = true,
    lazy = false,
  },

  {
    'ckolkey/ts-node-action',
    dependencies = { 'nvim-treesitter' },
    lazy = false,
    config = function()
      vim.keymap.set({ 'n' }, '<leader>s', function()
        require('ts-node-action').node_action()
      end)
    end,
  },

  {
    'AckslD/muren.nvim',
    config = true,
    cmd = {
      'MurenToggle',
      'MurenOpen',
      'MurenClose',
      'MurenFresh',
      'MurenUnique',
    },
  },

  {
    'bennypowers/template-literal-comments.nvim',
    config = true,
    ft = {
      'javascript',
      'typescript',
      'javascriptreact',
      'typescriptreact',
    },
  },

  {
    'dmmulroy/tsc.nvim',
    config = true,
    cmd = { 'TSC' },
  },

  {
    'ecthelionvi/NeoComposer.nvim',
    dependencies = { 'kkharji/sqlite.lua' },
    opts = {
      keymaps = {
        play_macro = '<C-Enter>',
      },
    },
    lazy = false,
    disabled = true,
  },

  -- {
  --   'chrisgrieser/nvim-spider',
  --   init = function()
  --     vim.keymap.set({ 'n', 'o', 'x' }, 'w', function()
  --       require('spider').motion('w')
  --     end, { desc = 'Spider-w' })
  --     vim.keymap.set({ 'n', 'o', 'x' }, 'e', function()
  --       require('spider').motion('e')
  --     end, { desc = 'Spider-e' })
  --     vim.keymap.set({ 'n', 'o', 'x' }, 'b', function()
  --       require('spider').motion('b')
  --     end, { desc = 'Spider-b' })
  --     vim.keymap.set({ 'n', 'o', 'x' }, 'ge', function()
  --       require('spider').motion('ge')
  --     end, { desc = 'Spider-ge' })
  --   end,
  -- },

  {
    'cpea2506/relative-toggle.nvim',
    config = true,
    lazy = false,
  },

  {
    'mrshmllow/document-color.nvim',
    config = true,
  },

  { 'marilari88/twoslash-queries.nvim', setup = true },

  { 'tpope/vim-abolish',                lazy = false },

  { 'martinda/Jenkinsfile-vim-syntax',  ft = { 'Jenkinsfile' } },

  -- {
  --   'nfrid/media.nvim',
  --   config = true,
  --   ft = { 'png', 'jpg', 'gif', 'mp4', 'webm', 'pdf' },
  -- },

  { 'nfrid/treesitter-utils',           dev = true },

  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
  },

  { 'andrewferrier/wrapping.nvim',    config = true,            lazy = false },

  {
    'nvim-zh/colorful-winsep.nvim',
    lazy = false,
    opts = {
      highlight = {
        fg = '#ff79c6',
      },
    },
  },

  {
    'nat-418/scamp.nvim',
    config = true,
    disabled = true,
  },

  {
    'AckslD/nvim-FeMaco.lua',
    config = true,
    ft = { 'markdown' },
  },

  {
    'dracula/vim',
    name = 'dracula',
    lazy = false,
    dependencies = {
      'folke/lsp-colors.nvim',
    },
    config = function()
      vim.cmd('colorscheme dracula')
      vim.api.nvim_create_autocmd('User', {
        pattern = 'LazyDone',
        once = true,
        callback = function()
          source('after/plugin/dracula.vim')
        end,
      })
    end,
  },

  { 'superhawk610/ascii-blocks.nvim', cmd = { 'AsciiBlockify' } },

  {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local hooks = require('ibl.hooks')
      hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
        vim.api.nvim_set_hl(0, 'IndentChar', { fg = '#44475a' })
        vim.api.nvim_set_hl(0, 'IndentScope', { fg = '#ee99ff' })
      end)
      require('ibl').setup({
        indent = {
          char = '▏',
          highlight = 'IndentChar',
        },
        scope = {
          show_start = false,
          highlight = 'IndentScope',
          include = {
            node_type = { ['*'] = { '*' } },
          },
        },
        exclude = {
          filetypes = { 'markdown', 'tex', 'startify' },
        },
      })
    end,
    lazy = false,
  },

  {
    'lewis6991/satellite.nvim',
    opts = true,
    lazy = false,
  },

  {
    'machakann/vim-highlightedyank',
    config = function()
      vim.g.highlightedyank_highlight_duration = 250
    end,
    lazy = false,
  },

  { 'kevinhwang91/nvim-hlslens', config = true, lazy = false },
  { 'NvChad/nvim-colorizer.lua', config = true, lazy = false },

  {
    'mrjones2014/legendary.nvim',
    dependencies = { 'folke/which-key.nvim' },
    cmd = { 'Legendary' },
    disabled = true,
    opts = {
      which_key = {
        auto_register = true,
      },
    },
  },

  { 'nfrid/due.nvim',         config = true, ft = { 'markdown' } },

  {
    'gaoDean/autolist.nvim',
    ft = { 'markdown' },
    opts = {
      invert = {
        mapping = '<a-r>',
      },
    },
  },

  -- {
  --   'edluffy/hologram.nvim',
  --   opts = { auto_display = true },
  --   ft = { 'markdown' },
  -- },

  { 'lervag/vimtex',          ft = { 'tex' } },

  { 'stevearc/dressing.nvim', lazy = false },

  {
    'krady21/compiler-explorer.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    cmd = { 'CECompile', 'CECompileLive' },
  },

  {
    'sudormrfbin/cheatsheet.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    cmd = { 'Cheatsheet' },
  },

  { 'kylechui/nvim-surround', config = true, lazy = false },

  { 'kana/vim-repeat',        lazy = false },

  {
    'anuvyklack/pretty-fold.nvim',
    dependencies = {
      'anuvyklack/nvim-keymap-amend',
      'anuvyklack/fold-preview.nvim',
    },
    config = function()
      require('pretty-fold').setup({})
      require('fold-preview').setup({})
    end,
    lazy = false,
  },

  {
    'chentoast/marks.nvim',
    opts = { mappings = { annotate = 'm<leader>' } },
    lazy = false,
  },

  { 'ron-rs/ron.vim',      ft = { 'ron' } },

  { 'zah/nim.vim',         ft = { 'nim' } },

  { 'iloginow/vim-stylus', ft = { 'stylus' } },

  {
    'rktjmp/paperplanes.nvim',
    opts = {
      register = '+',
      provider = 'paste.rs',
      provider_options = { insecure = true },
      notifier = vim.notify or print,
    },
    cmd = { 'PP' },
  },

  {
    'ruifm/gitlinker.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      require('gitlinker').setup({
        callbacks = {
          ['mygig.gitlab.yandexcloud.net'] = require('gitlinker.hosts').get_gitlab_type_url,
        },
      })
    end,
    keys = { '<leader>gy' },
  },

  { 'kevinhwang91/nvim-bqf',            ft = { 'qf' } },

  {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init()
    end,
  },

  'folke/lua-dev.nvim',

  {
    'folke/trouble.nvim',
    config = true,
    keys = {
      { '<leader>d', '<cmd>TroubleToggle<cr>', desc = 'Toggle Trouble' },
    },
    cmd = { 'Trouble', 'TroubleToggle' },
  },

  {
    'andrewferrier/textobj-diagnostic.nvim',
    config = true,
    keys = { { 'ig', ']g', '[g', mode = { 'x', 'o' } } },
  },

  -- {
  --   'zbirenbaum/copilot.lua',
  --   config = function()
  --     ---@diagnostic disable-next-line: param-type-mismatch
  --     vim.defer_fn(function()
  --       local active_clients = vim.lsp.get_active_clients()
  --       for _, client in ipairs(active_clients) do
  --         if client.name == 'copilot' then
  --           return
  --         end
  --       end
  --       require('copilot').setup()
  --       ---@diagnostic disable-next-line: param-type-mismatch
  --     end, 100)
  --   end,
  -- },
  -- {
  --   'zbirenbaum/copilot-cmp',
  --   dependencies = {'zbirenbaum/copilot.lua'},
  --   module = 'copilot_cmp',
  --   config = function()
  --     require('copilot_cmp').setup({
  --       formatters = {
  --         insert_text = require('copilot_cmp.format').remove_existing,
  --       },
  --     })
  --   end,
  -- },

  {
    'ahmedkhalf/project.nvim',
    name = 'project_nvim',
    opts = {
      ignore_lsp = { 'copilot' },
      show_hidden = true,
    },
    event = { 'LspAttach' },
  },

  { 'jackguo380/vim-lsp-cxx-highlight', ft = { 'c', 'cpp', 'h', 'hpp' } },

  {
    'cshuaimin/ssr.nvim',
    keys = {
      {
        '<leader>cc',
        function()
          require('ssr').open()
        end,
        mode = { 'n', 'v' },
        desc = 'Advanced Replace',
      },
    },
  },

  {
    'm-demare/hlargs.nvim',
    opts = { color = '#ffb86c' },
    event = { 'BufReadPost' },
  },

  {
    'folke/todo-comments.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    opts = {
      signs = false,
      keywords = {
        FIX = {
          icon = ' ',
          color = 'error',
          alt = { 'FIXME', 'BUG', 'FIXIT', 'FIX', 'ISSUE' },
        },
        TODO = { icon = ' ', color = 'info' },
        HACK = {
          icon = ' ',
          color = 'warning',
          alt = { 'FUCK', 'SHIT', 'BAD' },
        },
        WARN = { icon = ' ', color = 'warning', alt = { 'WARNING', 'XXX' } },
        PERF = { icon = ' ', alt = { 'OPTIM', 'PERFORMANCE', 'OPTIMIZE' } },
        NOTE = { icon = ' ', color = 'hint', alt = { 'INFO' } },
      },
    },
    cmd = { 'TodoTelescope', 'TodoTrouble', 'TodoQuickFix', 'TodoLocList' },
  },

  { 'rafcamlet/nvim-luapad', cmd = { 'Luapad', 'LuaRun' } },
}

return M
