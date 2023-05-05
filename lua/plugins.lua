---@type LazySpec
local M = {
  'antoinemadec/FixCursorHold.nvim',
  {
    'VidocqH/lsp-lens.nvim',
    config = true,
    event = { 'LspAttach' },
  },

  {
    "ecthelionvi/NeoComposer.nvim",
    dependencies = { "kkharji/sqlite.lua" },
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

  { 'cpea2506/relative-toggle.nvim',    config = true,         lazy = false },

  {
    'mrshmllow/document-color.nvim',
    config = true,
  },

  { 'marilari88/twoslash-queries.nvim', setup = true },

  { 'tpope/vim-abolish',                lazy = false },

  { 'martinda/Jenkinsfile-vim-syntax',  ft = { 'Jenkinsfile' } },

  {
    'nfrid/media.nvim',
    config = true,
    ft = { 'png', 'jpg', 'gif', 'mp4', 'webm', 'pdf' },
  },

  { 'nfrid/treesitter-utils',      dev = true },

  {
    'iamcco/markdown-preview.nvim',
    build = function()
      vim.fn['mkdp#util#install']()
    end,
    ft = { 'markdown' },
  },

  { 'andrewferrier/wrapping.nvim', config = true, lazy = false },

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
    opts = {
      char = '▏',
      context_char = '▏',
      char_highlight_list = { 'IndentLine' },
      -- show_first_indent_level = false,
      use_treesitter = true,
      filetype_exclude = { 'markdown', 'tex', 'startify' },
      show_current_context = true,
      show_current_context_start = true,
    },
    lazy = false,
  },

  {
    'lewis6991/satellite.nvim',
    opts = {
      winblend = 0,
    },
    lazy = false,
  },

  {
    'machakann/vim-highlightedyank',
    config = function()
      vim.g.highlightedyank_highlight_duration = 250
    end,
    lazy = false,
  },

  { 'kevinhwang91/nvim-hlslens',      config = true,            lazy = false },
  { 'NvChad/nvim-colorizer.lua',      config = true,            lazy = false },

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
  --   config = { auto_display = true },
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
