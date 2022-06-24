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
      'norcalli/nvim-colorizer.lua',
      config = function() require('plugins.colorizer') end
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

    use {
      'plasticboy/vim-markdown',
      config = function() require('plugins.markdown') end
    }
    use 'lervag/vimtex'

    use {
      'nvim-telescope/telescope.nvim',
      requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } },
      config = function() require('plugins.telescope') end
    }
    use {
      'sudormrfbin/cheatsheet.nvim',
      requires = {
        { 'nvim-telescope/telescope.nvim' }, { 'nvim-lua/popup.nvim' },
        { 'nvim-lua/plenary.nvim' }
      }
    }

    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use 'kana/vim-repeat'
    -- use 'jiangmiao/auto-pairs'
    use {
      'windwp/nvim-autopairs',
      requires = 'hrsh7th/nvim-cmp',
      config = function() require('plugins.autopairs') end
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
      requires = 'anuvyklack/nvim-keymap-amend',
      config = function()
        require('pretty-fold').setup({})
        require('pretty-fold.preview').setup({})
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
      'kdheepak/lazygit.nvim',
      config = function() require('plugins.lazygit') end
    }

    use {
      'tanvirtin/vgit.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('plugins.vgit') end
    }

    use {
      'ruifm/gitlinker.nvim',
      requires = 'nvim-lua/plenary.nvim',
      config = function() require('gitlinker').setup() end
    }

    use { 'kevinhwang91/nvim-bqf', ft = 'qf' }

    use { 'L3MON4D3/LuaSnip' }
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        { 'hrsh7th/cmp-nvim-lsp' }, { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' }, { 'hrsh7th/cmp-cmdline' },
        { 'petertriho/cmp-git' }, { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' }, { 'lukas-reineke/cmp-rg' },
        { 'andersevenrud/cmp-tmux' }, { 'David-Kunz/cmp-npm' }
      },
      config = function() require('plugins.cmp') end
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
      'simrat39/symbols-outline.nvim',
      config = function()
        -- mx.nnoremap('<leader>;', ':SymbolsOutline<CR>', 'Show Symbols Outline')
      end
    }

    use {
      'nvim-treesitter/nvim-treesitter',
      run = function() cmd('TSUpdate') end,
      config = function() require('plugins.treesitter') end
    }
    use 'nvim-treesitter/playground'
    use 'p00f/nvim-ts-rainbow'
    use 'JoosepAlviste/nvim-ts-context-commentstring'
    use 'windwp/nvim-ts-autotag'
    use 'nvim-treesitter/nvim-treesitter-textobjects'
    use 'RRethy/nvim-treesitter-textsubjects'
    -- use 'romgrk/nvim-treesitter-context'
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

    -- use {
    --   'andweeb/presence.nvim',
    --   config = function() require('presence'):setup({}) end
    -- }

    use 'rafcamlet/nvim-luapad'
  end
})
