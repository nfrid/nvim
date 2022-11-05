require('vutils')
local cmd = vim.api.nvim_command

local packer = require('packer')

local mx = require('mapx')

mx.nnoremap('<leader>P', '<cmd>PackerCompile<cr>', 'Recompile Plugins')
mx.nnoremap('<leader>pp', '<cmd>PackerSync<cr>', 'Sync Plugins')

local package_root =
  require('packer.util').join_paths(vim.fn.stdpath('data'), 'site', 'pack')
vim.g.packroot = package_root

return packer.startup({
  function()
    local use = packer.use

    use('wbthomason/packer.nvim')

    -- use('samjwill/nvim-unception')

    use('martinda/Jenkinsfile-vim-syntax')

    use({
      'NFrid/media.nvim',
      config = function()
        require('media-nvim').setup()
      end,
    })

    use({
      'smjonas/live-command.nvim',
      config = function()
        require('live-command').setup({
          commands = {
            Norm = { cmd = 'norm' },
          },
        })
      end,
    })

    use({
      'folke/noice.nvim',
      event = 'VimEnter',
      config = function()
        require('plugins.noice')
      end,
      requires = {
        'MunifTanjim/nui.nvim',
        'rcarriga/nvim-notify',
      },
    })

    use({
      'AckslD/nvim-FeMaco.lua',
      config = function()
        require('femaco').setup()
      end,
    })

    use({
      'mrjones2014/legendary.nvim',
      config = function()
        require('legendary').setup()
      end,
    })

    -- use({
    --   'anuvyklack/windows.nvim',
    --   requires = {
    --     'anuvyklack/middleclass',
    --     'anuvyklack/animation.nvim',
    --   },
    --   config = function()
    --     vim.o.winwidth = 10
    --     vim.o.winminwidth = 10
    --     require('windows').setup()
    --   end,
    -- })

    -- use('mbpowers/nvimager')

    use({
      'RRethy/vim-illuminate',
      config = function()
        require('plugins.illuminate')
      end,
    })

    use('folke/lsp-colors.nvim')
    use({
      'dracula/vim',
      as = 'dracula',
      config = function()
        vim.cmd('colorscheme dracula')
        source_after('plugin/dracula.vim')
      end,
    })

    use('superhawk610/ascii-blocks.nvim')

    use({
      'phaazon/mind.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
      config = function()
        require('mind').setup()
      end,
    })

    -- use({
    --   'levouh/tint.nvim',
    --   config = function()
    --     require('tint').setup({})
    --   end,
    -- })

    use({
      'hoob3rt/lualine.nvim',
      after = 'noice.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('plugins.lualine')
      end,
    })
    use({
      'akinsho/nvim-bufferline.lua',
      branch = 'main',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function()
        require('plugins.bufferline')
      end,
    })

    -- use {
    --   'b0o/incline.nvim',
    --   config = function() require('incline').setup() end
    -- }

    use({
      'lukas-reineke/indent-blankline.nvim',
      config = function()
        require('plugins.indent-blankline')
      end,
    })
    use({
      'petertriho/nvim-scrollbar',
      config = function()
        require('plugins.scrollbar')
      end,
    })
    use({
      'machakann/vim-highlightedyank',
      config = function()
        vim.g.highlightedyank_highlight_duration = 250
      end,
    })
    use('kevinhwang91/nvim-hlslens')

    use({
      'NvChad/nvim-colorizer.lua',
      config = function()
        require('plugins.colorizer')
      end,
    })

    use({
      'mrshmllow/document-color.nvim',
      config = function()
        require('document-color').setup({})
      end,
    })

    use({
      'folke/which-key.nvim',
      config = function()
        require('plugins.which-key')
      end,
    })
    use({
      'b0o/mapx.nvim',
      config = function()
        require('plugins.mapx')
      end,
      requires = { 'folke/which-key.nvim' },
    })

    use({
      'NFrid/due.nvim',
      config = function()
        require('due_nvim').setup({})
      end,
    })

    use({
      'gaoDean/autolist.nvim',
      config = function()
        require('plugins.autolist')
      end,
    })

    -- use {
    --   'edluffy/hologram.nvim',
    --   config = function()
    --     require('hologram').setup({ auto_display = true })
    --   end
    -- }

    -- use({
    --   'plasticboy/vim-markdown',
    --   config = function()
    --     require('plugins.markdown')
    --   end,
    -- })
    use('lervag/vimtex')

    use({
      'nvim-neorg/neorg',
      tag = '*',
      config = function()
        require('plugins.neorg')
      end,
      requires = 'nvim-lua/plenary.nvim',
    })

    use('stevearc/dressing.nvim')

    use({
      'krady21/compiler-explorer.nvim',
      requires = { 'nvim-lua/plenary.nvim' },
    })

    use({
      'nvim-telescope/telescope.nvim',
      requires = {
        'nvim-lua/popup.nvim',
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope-dap.nvim',
        'smartpde/telescope-recent-files',
      },
      config = function()
        require('plugins.telescope')
      end,
    })
    use({
      'sudormrfbin/cheatsheet.nvim',
      requires = {
        { 'nvim-telescope/telescope.nvim' },
        { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' },
      },
    })

    -- use 'tpope/vim-commentary'
    use({
      'numToStr/Comment.nvim',
      config = function()
        require('plugins.comment')
      end,
    })
    -- use 'tpope/vim-surround'
    use({
      'kylechui/nvim-surround',
      config = function()
        require('nvim-surround').setup()
      end,
    })
    use('kana/vim-repeat')
    -- use 'jiangmiao/auto-pairs'
    use({
      'windwp/nvim-autopairs',
      requires = 'hrsh7th/nvim-cmp',
      config = function()
        require('plugins.autopairs')
      end,
    })

    use({
      'monaqa/dial.nvim',
      config = function()
        require('plugins.dial')
      end,
    })

    use({
      'junegunn/vim-easy-align',
      config = function()
        require('plugins.align')
      end,
    })

    use({
      'anuvyklack/pretty-fold.nvim',
      requires = {
        { 'anuvyklack/nvim-keymap-amend' },
        { 'anuvyklack/fold-preview.nvim' },
      },
      config = function()
        require('pretty-fold').setup({})
        require('fold-preview').setup({})
      end,
    })

    use('tversteeg/registers.nvim')
    use({
      'phaazon/hop.nvim',
      as = 'hop',
      config = function()
        require('plugins.hop')
      end,
    })
    use({
      'chentoast/marks.nvim',
      config = function()
        require('marks').setup({ mappings = { annotate = 'm<leader>' } })
      end,
    })

    use('fedorenchik/qt-support.vim')

    use('ron-rs/ron.vim')

    use('zah/nim.vim')

    use('iloginow/vim-stylus')

    use({
      'kevinhwang91/rnvimr',
      config = function()
        require('plugins.rnvimr')
      end,
    })

    use({
      'rktjmp/paperplanes.nvim',
      config = function()
        require('plugins.paperplanes')
      end,
    })

    use({
      'akinsho/toggleterm.nvim',
      tag = '*',
      config = function()
        require('plugins.toggleterm')
      end,
    })

    use({
      'lewis6991/gitsigns.nvim',
      config = function()
        require('plugins.gitsigns')
      end,
    })

    -- use({
    --   'lewis6991/hover.nvim',
    --   config = function()
    --     require('hover').setup({
    --       init = function()
    --         -- Require providers
    --         require('hover.providers.lsp')
    --         -- require('hover.providers.gh')
    --         -- require('hover.providers.jira')
    --         -- require('hover.providers.man')
    --         -- require('hover.providers.dictionary')
    --       end,
    --       preview_opts = {
    --         border = nil,
    --       },
    --       -- Whether the contents of a currently open hover window should be moved
    --       -- to a :h preview-window when pressing the hover keymap.
    --       preview_window = false,
    --       title = true,
    --     })
    --   end,
    -- })

    use({
      'akinsho/git-conflict.nvim',
      tag = '*',
      config = function()
        require('plugins.conflict')
      end,
    })

    use({
      'ruifm/gitlinker.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('gitlinker').setup()
      end,
    })

    use({
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim',
        'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons',
      },
      config = function()
        require('octo').setup()
      end,
    })

    use({ 'kevinhwang91/nvim-bqf', ft = 'qf' })

    use({
      'L3MON4D3/LuaSnip',
      requires = 'honza/vim-snippets',
      config = function()
        require('plugins.luasnip')
      end,
    })

    use({
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'petertriho/cmp-git',
        'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip',
        'lukas-reineke/cmp-rg',
        'andersevenrud/cmp-tmux',
        'David-Kunz/cmp-npm',
        'rcarriga/cmp-dap',
        -- {
        --   'tzachar/cmp-tabnine',
        --   run = './install.sh',
        --   requires = 'hrsh7th/nvim-cmp',
        --   config = function() require('plugins.cmp-tabnine') end
        -- }
      },
      config = function()
        require('plugins.cmp')
      end,
    })

    use({
      'mfussenegger/nvim-dap',
      requires = {
        'rcarriga/nvim-dap-ui', -- 'Pocco81/dap-buddy.nvim'
        { 'Pocco81/dap-buddy.nvim', branch = 'dev' },
        'jbyuki/one-small-step-for-vimkind',
        {
          'mxsdev/nvim-dap-vscode-js',
          requires = {
            {
              'microsoft/vscode-js-debug',
              opt = true,
              run = 'npm install --legacy-peer-deps && npm run compile',
            },
          },
        },
        -- {
        --   'theHamsta/nvim-dap-virtual-text',
        --   config = function()
        --     require('nvim-dap-virtual-text').setup()
        --   end,
        -- },
      },
      config = function()
        require('plugins.dap')
      end,
    })

    use({
      'onsails/lspkind-nvim',
      config = function()
        require('lspkind').init()
      end,
    })

    -- use({
    --   'j-hui/fidget.nvim',
    --   config = function()
    --     require('fidget').setup()
    --   end,
    -- })

    use('folke/lua-dev.nvim')

    use({ 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' })

    use({
      'neovim/nvim-lspconfig',
      requires = { 'hrsh7th/nvim-cmp' },
      config = function()
        require('plugins.lsp')
      end,
    })

    use({
      'narutoxy/dim.lua',
      requires = { 'nvim-treesitter/nvim-treesitter', 'neovim/nvim-lspconfig' },
      config = function()
        require('dim').setup({})
      end,
    })

    use({
      'theHamsta/nvim-semantic-tokens',
      requires = { 'neovim/nvim-lspconfig' },
      config = function()
        require('plugins.semantic-tokens')
      end,
    })

    use({
      'glepnir/lspsaga.nvim',
      requires = { 'neovim/nvim-lspconfig' },
      config = function()
        require('plugins.lspsaga')
      end,
    })

    use({
      'lvimuser/lsp-inlayhints.nvim',
      requires = { 'neovim/nvim-lspconfig' },
      config = function()
        require('plugins.inlayhints')
      end,
    })

    -- use {
    --   'williamboman/mason.nvim',
    --   requires = { 'williamboman/mason-lspconfig.nvim' },
    --   config = function() require('plugins.mason') end
    -- }

    use({
      'andrewferrier/textobj-diagnostic.nvim',
      config = function()
        require('textobj-diagnostic').setup()
      end,
    })

    use({
      'zbirenbaum/copilot.lua',
      after = 'nvim-bufferline.lua',
      config = function()
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.defer_fn(function()
          require('copilot').setup()
          ---@diagnostic disable-next-line: param-type-mismatch
        end, 100)
      end,
    })
    use({
      'zbirenbaum/copilot-cmp',
      requires = 'zbirenbaum/copilot.lua',
      module = 'copilot_cmp',
      after = { 'copilot.lua' },
      config = function()
        require('copilot_cmp').setup({
          formatters = {
            insert_text = require('copilot_cmp.format').remove_existing,
          },
        })
      end,
    })

    use({ 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig' })

    use({
      'kosayoda/nvim-lightbulb',
      config = function()
        require('plugins.lightbulb')
      end,
    })

    use({
      'ahmedkhalf/project.nvim',
      config = function()
        require('plugins.project')
      end,
    })

    use('jackguo380/vim-lsp-cxx-highlight')

    use({
      'vuki656/package-info.nvim',
      requires = 'MunifTanjim/nui.nvim',
      config = function()
        require('plugins.package-info')
      end,
    })

    -- use({
    --   'simrat39/symbols-outline.nvim',
    --   config = function()
    --     require('plugins.symbols-outline')
    --   end,
    -- })

    use({
      'nvim-treesitter/nvim-treesitter',
      requires = {
        { 'nvim-treesitter/playground' },
        { 'p00f/nvim-ts-rainbow' },
        { 'JoosepAlviste/nvim-ts-context-commentstring' },
        { 'windwp/nvim-ts-autotag' },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { 'RRethy/nvim-treesitter-textsubjects' },
        { 'RRethy/nvim-treesitter-endwise' },
      },
      run = function()
        cmd('TSUpdate')
      end,
      config = function()
        require('plugins.treesitter')
      end,
    })

    use({
      'm-demare/hlargs.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function()
        require('hlargs').setup({ color = '#ffb86c' })
      end,
    })

    use({
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function()
        require('plugins.todo')
      end,
    })

    use({
      'andweeb/presence.nvim',
      config = function()
        require('plugins.presence')
      end,
    })

    use('rafcamlet/nvim-luapad')
  end,
})
