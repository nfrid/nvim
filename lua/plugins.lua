require('vutils')
local cmd = vim.api.nvim_command

local packer = require('packer')

local mx = require('mapx')

mx.nnoremap('<leader>P', '<cmd>PackerCompile<cr>', 'Recompile Plugins')
mx.nnoremap('<leader>pp', '<cmd>PackerSync<cr>', 'Sync Plugins')

return packer.startup({
  function()
    local use = packer.use

    use 'wbthomason/packer.nvim'

    use 'RRethy/vim-illuminate'

    use 'folke/lsp-colors.nvim'
    use { 'dracula/vim', config = function() require('plugins.theme') end }

    use {
      'hoob3rt/lualine.nvim',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require('plugins.lualine') end
    }
    use {
      'akinsho/nvim-bufferline.lua',
      branch = 'main',
      requires = 'kyazdani42/nvim-web-devicons',
      config = function() require('plugins.bufferline') end
    }

    -- use {
    --   'b0o/incline.nvim',
    --   config = function() require('incline').setup() end
    -- }

    use {
      'lukas-reineke/indent-blankline.nvim',
      config = function() require('plugins.indent-blankline') end
    }
    use {
      'petertriho/nvim-scrollbar',
      config = function() require('plugins.scrollbar') end
    }
    use {
      'machakann/vim-highlightedyank',
      config = function() vim.g.highlightedyank_highlight_duration = 250 end
    }
    use 'kevinhwang91/nvim-hlslens'

    use {
      'NvChad/nvim-colorizer.lua',
      config = function() require('plugins.colorizer') end
    }

    use {
      'mrshmllow/document-color.nvim',
      config = function() require('document-color').setup({}) end
    }

    use {
      'folke/which-key.nvim',
      config = function() require('which-key').setup({}) end
    }
    use {
      'b0o/mapx.nvim',
      config = function() require('mapx').setup({ whichkey = true }) end
    }

    use { 'NFrid/due.nvim', config = function() require('due_nvim').setup {} end }

    -- use {
    --   'edluffy/hologram.nvim',
    --   config = function()
    --     require('hologram').setup({ auto_display = true })
    --   end
    -- }

    use {
      'plasticboy/vim-markdown',
      config = function() require('plugins.markdown') end
    }
    use 'lervag/vimtex'

    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-dap.nvim' }
      },
      config = function() require('plugins.telescope') end
    }
    use {
      'sudormrfbin/cheatsheet.nvim',
      requires = {
        { 'nvim-telescope/telescope.nvim' }, { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' }
      }
    }

    -- use 'tpope/vim-commentary'
    use {
      'numToStr/Comment.nvim',
      config = function() require('plugins.comment') end
    }
    -- use 'tpope/vim-surround'
    use {
      'kylechui/nvim-surround',
      config = function() require('nvim-surround').setup() end
    }
    use 'kana/vim-repeat'
    -- use 'jiangmiao/auto-pairs'
    use {
      'windwp/nvim-autopairs',
      requires = 'hrsh7th/nvim-cmp',
      config = function() require('plugins.autopairs') end
    }

    use { 'monaqa/dial.nvim', config = function() require('plugins.dial') end }

    use {
      'junegunn/vim-easy-align',
      config = function() require('plugins.align') end
    }

    use {
      'abecodes/tabout.nvim',
      config = function()
        require('tabout').setup {
          tabkey = '<C-f>',
          backwards_tabkey = '<M-f>',
          act_as_tab = false,
          act_as_shift_tab = false,
          enable_backwards = true, -- well ...
          completion = true, -- if the tabkey is used in a completion pum
          tabouts = {
            { open = '\'', close = '\'' }, { open = '"', close = '"' },
            { open = '`', close = '`' }, { open = '(', close = ')' },
            { open = '[', close = ']' }, { open = '{', close = '}' }
          },
          ignore_beginning = true, --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
          exclude = {} -- tabout will ignore these filetypes
        }
      end,
      wants = { 'nvim-treesitter' } -- or require if not used so far
    }

    use {
      'anuvyklack/pretty-fold.nvim',
      requires = {
        { 'anuvyklack/nvim-keymap-amend' }, { 'anuvyklack/fold-preview.nvim' }
      },
      config = function()
        require('pretty-fold').setup({})
        require('fold-preview').setup({})
      end
    }

    use 'tversteeg/registers.nvim'
    use {
      'phaazon/hop.nvim',
      as = 'hop',
      config = function() require('plugins.hop') end
    }
    use {
      'chentoast/marks.nvim',
      config = function()
        require('marks').setup({ mappings = { annotate = 'm<leader>' } })
      end
    }

    use 'fedorenchik/qt-support.vim'

    -- use {
    --   'mattn/emmet-vim',
    --   config = function()
    --     vim.g.user_emmet_mode = 'i'
    --     vim.g.user_emmet_leader_key = '<A-m>'
    --   end
    -- }
    -- that not workie 😔
    -- use {
    --   'RishabhRD/nvim-lsputils',
    --   requires = { 'RishabhRD/popfix', opt = true },
    --   config = function() require('plugins.lsputils') end
    -- }
    --

    use 'iloginow/vim-stylus'

    use {
      'kevinhwang91/rnvimr',
      config = function() require('plugins.rnvimr') end
    }

    use {
      'rktjmp/paperplanes.nvim',
      config = function() require('plugins.paperplanes') end
    }

    use {
      'kdheepak/lazygit.nvim',
      config = function() require('plugins.lazygit') end
    }

    use {
      'tanvirtin/vgit.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('plugins.vgit') end
    }

    use {
      'akinsho/git-conflict.nvim',
      tag = '*',
      config = function() require('plugins.conflict') end
    }

    use {
      'ruifm/gitlinker.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('gitlinker').setup() end
    }

    use {
      'pwntester/octo.nvim',
      requires = {
        'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim',
        'kyazdani42/nvim-web-devicons'
      },
      config = function() require('octo').setup() end
    }

    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

    use {
      'L3MON4D3/LuaSnip',
      requires = 'honza/vim-snippets',
      config = function() require('plugins.luasnip') end
    }
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline', 'petertriho/cmp-git', 'L3MON4D3/LuaSnip',
        'saadparwaiz1/cmp_luasnip', 'lukas-reineke/cmp-rg',
        'andersevenrud/cmp-tmux', 'David-Kunz/cmp-npm', 'rcarriga/cmp-dap'
        -- {
        --   'tzachar/cmp-tabnine',
        --   run = './install.sh',
        --   requires = 'hrsh7th/nvim-cmp',
        --   config = function() require('plugins.cmp-tabnine') end
        -- }
      },
      config = function() require('plugins.cmp') end
    }

    use {
      'mfussenegger/nvim-dap',
      requires = {
        'rcarriga/nvim-dap-ui', -- 'Pocco81/dap-buddy.nvim'
        { 'Pocco81/dap-buddy.nvim', branch = 'dev' },
        'jbyuki/one-small-step-for-vimkind', {
          'mxsdev/nvim-dap-vscode-js',
          requires = {
            {
              'microsoft/vscode-js-debug',
              opt = true,
              run = 'npm install --legacy-peer-deps && npm run compile'
            }
          }
          -- }, {
          --   'theHamsta/nvim-dap-virtual-text',
          --   config = function() require('nvim-dap-virtual-text').setup() end
        }
      },
      config = function() require('plugins.dap') end
    }

    use {
      'onsails/lspkind-nvim',
      config = function() require('lspkind').init() end
    }
    use { 'j-hui/fidget.nvim', config = function() require('fidget').setup() end }
    -- use 'ray-x/lsp_signature.nvim'
    use 'folke/lua-dev.nvim'
    use { 'weilbith/nvim-code-action-menu', cmd = 'CodeActionMenu' }
    use {
      'neovim/nvim-lspconfig',
      -- requires = { 'nvim-lua/completion-nvim', opt = true },
      -- requires = {
      --   { 'ms-jpq/coq_nvim', branch = 'coq' },
      --   { 'ms-jpq/coq.artifacts', branch = 'artifacts' },
      --   { 'ms-jpq/coq.thirdparty', branch = '3p' }, { 'hrsh7th/nvim-cmp' }
      -- },
      requires = { 'hrsh7th/nvim-cmp' },
      config = function() require('plugins.lsp') end
    }

    use {
      'glepnir/lspsaga.nvim',
      requires = { 'neovim/nvim-lspconfig' },
      config = function() require('plugins.lspsaga') end
    }

    -- use {
    --   'williamboman/mason.nvim',
    --   requires = { 'williamboman/mason-lspconfig.nvim' },
    --   config = function() require('plugins.mason') end
    -- }

    use {
      'andrewferrier/textobj-diagnostic.nvim',
      config = function() require('textobj-diagnostic').setup() end
    }
    -- use 'github/copilot.vim'
    use {
      'zbirenbaum/copilot.lua',
      after = 'nvim-bufferline.lua',
      config = function()
        vim.defer_fn(function() require('copilot').setup() end, 100)
      end
    }
    use {
      'zbirenbaum/copilot-cmp',
      requires = 'zbirenbaum/copilot.lua',
      module = 'copilot_cmp'
    }
    use { 'SmiteshP/nvim-navic', requires = 'neovim/nvim-lspconfig' }

    use {
      'kosayoda/nvim-lightbulb',
      config = function() require('plugins.lightbulb') end
    }

    use {
      'ahmedkhalf/lsp-rooter.nvim',
      config = function() require('lsp-rooter').setup {} end
    }

    use 'jackguo380/vim-lsp-cxx-highlight'

    use {
      'vuki656/package-info.nvim',
      requires = 'MunifTanjim/nui.nvim',
      config = function() require('plugins.package-info') end
    }

    use {
      'simrat39/symbols-outline.nvim',
      config = function() require('plugins.symbols-outline') end
    }
    -- use {
    --   'stevearc/aerial.nvim',
    --   config = function() require('plugins.aerial') end
    -- }

    use {
      'nvim-treesitter/nvim-treesitter',
      requires = {
        { 'nvim-treesitter/playground' }, { 'p00f/nvim-ts-rainbow' },
        { 'JoosepAlviste/nvim-ts-context-commentstring' },
        { 'windwp/nvim-ts-autotag' },
        { 'nvim-treesitter/nvim-treesitter-textobjects' },
        { 'RRethy/nvim-treesitter-textsubjects' },
        { 'RRethy/nvim-treesitter-endwise' }
      },
      run = function() cmd('TSUpdate') end,
      config = function() require('plugins.treesitter') end
    }
    use {
      'lewis6991/spellsitter.nvim',
      config = function() require('spellsitter').setup() end
    }

    use {
      'm-demare/hlargs.nvim',
      requires = { 'nvim-treesitter/nvim-treesitter' },
      config = function() require('hlargs').setup({ color = '#ffb86c' }) end
    }

    use {
      'folke/todo-comments.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('plugins.todo') end
    }

    use {
      'andweeb/presence.nvim',
      config = function() require('plugins.presence') end
    }

    use 'rafcamlet/nvim-luapad'
  end
})
