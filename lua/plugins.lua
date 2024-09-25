---@type LazySpec
local M = {
  'antoinemadec/FixCursorHold.nvim',

  {
    'rlychrisg/truncateline.nvim',
    opts = {},
    lazy = false,
  },

  {
    'OXY2DEV/helpview.nvim',
    ft = 'help',
    dependencies = {
      'nvim-treesitter/nvim-treesitter'
    }
  },

  {
    'IogaMaster/neocord',
    event = 'VeryLazy',
    opts = {
      blacklist = { 'job/' },
    },
  },

  {
    'GustavEikaas/code-playground.nvim',
    opts = {},
    cmd = { 'Code' },
  },

  {
    'stevearc/quicker.nvim',
    opts = {
      keys = {
        {
          '>',
          function()
            require('quicker').expand({
              before = 2,
              after = 2,
              add_to_existing = true,
            })
          end,
          desc = 'Expand quickfix content',
        },
        {
          '<',
          function()
            require('quicker').collapse()
          end,
          desc = 'Collapse quickfix context',
        },
      },
    },
    keys = {
      {
        '<leader>xf',
        function()
          require('quicker').toggle()
        end,
        { desc = 'Toggle quickfix' },
      },
      {
        '<leader>xl',
        function()
          require('quicker').toggle({ loclist = true })
        end,
        { desc = 'Toggle loclist' },
      },
    },
    lazy = false,
  },

  {
    'iamyoki/buffer-reopen.nvim',
    opts = {},
    lazy = false,
  },

  {
    'psjay/buffer-closer.nvim',
    opts = {
      close_key = '<leader>q',
    },
    lazy = false,
  },

  {
    'mistweaverco/kulala.nvim',
    ft = { 'http' },
    keys = {
      {
        '<CR>',
        function()
          require('kulala').run()
        end,
        ft = { 'http' },
      },
      {
        '<S-CR>',
        function()
          require('kulala').toggle_view()
        end,
        ft = { 'http' },
      },
      {
        '<C-j>',
        function()
          require('kulala').jump_next()
        end,
        ft = { 'http' },
      },
      {
        '<C-k>',
        function()
          require('kulala').jump_prev()
        end,
        ft = { 'http' },
      },
    },
    config = true,
  },

  {
    'rachartier/tiny-inline-diagnostic.nvim',
    event = 'VeryLazy',
    opts = {},
    enabled = false,
  },

  {
    'chrisgrieser/nvim-rip-substitute',
    keys = {
      {
        '<leader>?',
        function()
          require('rip-substitute').sub()
        end,
        mode = { 'n', 'x' },
        desc = 'Rip Substitute',
      },
    },
  },

  {
    'sindrets/diffview.nvim',
    cmd = { 'DiffviewOpen', 'DiffviewClose' },
  },

  {
    'axelvc/template-string.nvim',
    opts = {
      remove_template_string = true,
    },
    ft = {
      'typescript',
      'typescriptreact',
      'javascript',
      'javascriptreact',
      'html',
      'vue',
      'svelte',
      'python',
    },
  },

  {
    'tzachar/highlight-undo.nvim',
    config = true,
    lazy = false,
  },

  {
    'supermaven-inc/supermaven-nvim',
    opts = {
      keymaps = {
        accept_suggestion = '<C-l>',
        clear_suggestion = '<C-h>',
        accept_word = '<C-j>',
      },
      ignore_filetypes = {
        TelescopePrompt = true,
        ['rip-substitute'] = true,
      },
    },
    event = 'VeryLazy',
  },

  {
    'folke/ts-comments.nvim',
    opts = {},
    event = 'VeryLazy',
  },

  {
    'rachartier/tiny-devicons-auto-colors.nvim',
    dependencies = {
      'nvim-tree/nvim-web-devicons',
    },
    event = 'VeryLazy',
    opts = {},
  },

  {
    'David-Kunz/gen.nvim',
    cmd = { 'Gen' },
    opts = {
      model = 'mistral:7b',
    },
  },

  {
    'VebbNix/lf-vim',
    ft = { 'lf' },
  },

  {
    'ckolkey/ts-node-action',
    dependencies = { 'nvim-treesitter' },
    config = function()
      local p = require('ts-node-action')
      p.setup({
        tsx = require('ts-node-action').node_actions.typescriptreact,
      })
    end,
    keys = {
      {
        '<leader>s',
        function()
          require('ts-node-action').node_action()
        end,
        desc = 'Node Action',
      },
    },
  },

  {
    'mcauley-penney/visual-whitespace.nvim',
    opts = {
      highlight = {
        fg = '#6272A4',
        bg = '#44475A',
      },
    },
    lazy = false,
    enabled = false,
  },

  {
    'icholy/lsplinks.nvim',
    opts = {},
    keys = {
      {
        'gx',
        function()
          require('lsplinks').gx()
        end,
        desc = 'Open link',
      },
    },
  },

  {
    'altermo/iedit.nvim',
    keys = {
      {
        '<leader>ii',
        function()
          require('iedit').toggle()
        end,
        desc = 'Toggle Iedit',
      },
      {
        '<leader>I',
        function()
          require('iedit').select_all()
        end,
        desc = 'Iedit ALL',
      },
    },
  },

  {
    'dwrdx/mywords.nvim',
    keys = {
      {
        '<leader>hw',
        function()
          require('mywords').hl_toggle()
        end,
        desc = 'Toggle Highlight Word',
      },
      {
        '<leader>hW',
        function()
          require('mywords').uhl_all()
        end,
        desc = 'Reset Highlight Word',
      },
    },
  },

  {
    'dmmulroy/ts-error-translator.nvim',
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
    opts = {},
    enabled = false,
  },

  -- {
  --   'anuvyklack/windows.nvim',
  --   dependencies = { 'anuvyklack/middleclass' },
  --   opts = {},
  --   lazy = false,
  -- },

  {
    'stevearc/oil.nvim',
    opts = {},
    lazy = false,
    -- Optional dependencies
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    keys = {
      { '-', '<CMD>Oil<CR>' },
    },
  },

  {
    'zeioth/garbage-day.nvim',
    dependencies = 'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    opts = {},
    enabled = false,
  },

  {
    'moyiz/git-dev.nvim',
    event = 'VeryLazy',
    opts = {},
  },

  {
    '3rd/image.nvim',
    ft = { 'markdown' },
    opts = {
      integrations = {
        markdown = {
          only_render_image_at_cursor = true,
        },
        neorg = {
          enabled = false,
        },
      },
    },
    rocks = { 'magick' },
  },

  {
    'epwalsh/obsidian.nvim',
    version = '*',
    ft = { 'markdown' },
    -- event = {
    --   'BufReadPre ' .. vim.fn.expand '~' .. '/Documents/Notes/**.md',
    --   'BufNewFile ' .. vim.fn.expand '~' .. '/Documents/Notes/**.md',
    -- },
    dependencies = {
      'nvim-lua/plenary.nvim',
    },
    opts = {
      -- disable_frontmatter = true,
      notes_subdir = 'inbox',
      note_id_func = function(title)
        if title ~= nil then
          return title:gsub(' ', '-'):gsub('[^A-Za-z0-9-]', ''):lower()
        end

        return tostring(os.date('%Y-%m-%d-%a'))
      end,
      note_frontmatter_func = function(note)
        local function inTable(tbl, item)
          for key, value in pairs(tbl) do
            if value == item then
              return key, value
            end
          end
          return false, false
        end
        local title_alias = 'linter-yaml-title-alias'

        -- This is equivalent to the default frontmatter function.
        local out = { aliases = note.aliases, [title_alias] = note.title }

        local prev_title = note.metadata and note.metadata[title_alias] or false
        local prev_title_alias_id = inTable(note.aliases, prev_title)
        local cur_title_alias_id = inTable(note.aliases, note.title)
        if prev_title and note.title ~= prev_title and prev_title_alias_id then
          out.aliases[prev_title_alias_id] = note.title
          if cur_title_alias_id then
            table.remove(out.aliases, cur_title_alias_id)
          end
        end
        -- `note.metadata` contains any manually added fields in the frontmatter.
        -- So here we just make sure those fields are kept in the frontmatter.
        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            if k ~= title_alias then
              out[k] = v
            end
          end
        end
        return out
      end,
      follow_url_func = function(url)
        -- Open the URL in the default web browser.
        vim.fn.jobstart({ 'xdg-open', url })
      end,
      templates = {
        subdir = 'templates',
        date_format = '%Y-%m-%d',
        time_format = '%H:%M',
      },
      attachments = {
        img_folder = 'attachments',
      },
      mappings = {
        -- Overrides the 'gf' mapping to work on markdown/wiki links within your vault.
        ['gf'] = {
          action = function()
            return require('obsidian').util.gf_passthrough()
          end,
          opts = { noremap = false, expr = true, buffer = true },
        },
      },
      ui = {
        enable = false,
        reference_text = { hl_group = 'Class' },
        highlight_text = { hl_group = 'Todo' },
        external_link_icon = { char = '', hl_group = 'DraculaCyan' },
        checkboxes = {
          [' '] = { char = '󰄱', hl_group = 'Question' },
          ['/'] = { char = '󰡖', hl_group = 'Added' },
          ['x'] = { char = '󰧖', hl_group = 'Title' },
          ['%-'] = { char = '󰛲', hl_group = 'Comment' },
          ['!'] = { char = '󰩳', hl_group = 'Error' },
          ['%?'] = { char = '󰞋', hl_group = 'String' },
        },
      },
      workspaces = {
        {
          name = 'personal',
          path = '~/Documents/Notes',
        },
      },
    },
    keys = {
      {
        '<leader>nn',
        '<Cmd>ObsidianNew<CR>',
        mode = { 'n' },
        desc = 'New',
      },
      {
        '<leader>nt',
        '<Cmd>ObsidianTemplate<CR>',
        mode = { 'n' },
        desc = 'New from template',
      },
      {
        '<leader>no',
        '<Cmd>ObsidianQuickSwitch<CR>',
        mode = { 'n' },
        desc = 'Open',
      },
      {
        '<leader>ns',
        '<Cmd>ObsidianSearch<CR>',
        mode = { 'n' },
        desc = 'Search',
      },
      {
        '<leader>nr',
        '<Cmd>ObsidianRename<CR>',
        mode = { 'n' },
        desc = 'Rename',
      },
      {
        '<leader>nb',
        '<Cmd>ObsidianBacklinks<CR>',
        mode = { 'n' },
        desc = 'Backlinks',
      },
      {
        '<leader>np',
        '<Cmd>ObsidianOpen<CR>',
        mode = { 'n' },
        desc = 'Open in Obsidian',
      },
    },
    cmd = { 'ObsidianQuickSwitch' },
  },

  {
    -- Make sure to set this up properly if you have lazy=true
    'MeanderingProgrammer/render-markdown.nvim',
    opts = {
      file_types = { 'markdown', 'Avante' },
      checkbox = {
        unchecked = {
          icon = '',
          highlight = 'Question',
        },
        checked = {
          icon = '󰧖',
          highlight = 'Title',
        },
        custom = {
          intermediate = { raw = '[.]', rendered = '󰡖', highlight = 'Directory' },
          cancelled = { raw = '[-]', rendered = '󰛲', highlight = 'Comment' },
          priority = { raw = '[!]', rendered = '󰩳', highlight = 'Error' },
          idk = { raw = '[?]', rendered = '󰞋', highlight = 'String' },
          star = { raw = '[*]', rendered = '󰎃', highlight = 'DraculaOrangeBold' },
        },
      },
      heading = {
        enabled = false,
      },
    },
    ft = { 'markdown', 'Avante' },
  },

  -- {
  --   'zk-org/zk-nvim',
  --   config = function()
  --     require('zk').setup({
  --       picker = 'telescope',
  --       lsp = {
  --         config = {
  --           cmd = { 'zk', 'lsp' },
  --           name = 'zk',
  --         },
  --         auto_attach = {
  --           enabled = true,
  --           filetypes = { 'markdown' },
  --         },
  --       },
  --     })
  --   end,
  --   keys = {
  --     {
  --       '<leader>zz',
  --       '<Cmd>ZkCd<CR>',
  --       mode = { 'n' },
  --       desc = 'cd',
  --     },
  --     {
  --       '<leader>zn',
  --       '<Cmd>ZkNew { title = vim.fn.input("Title: ") }<CR>',
  --       mode = { 'n' },
  --       desc = 'new',
  --     },
  --     {
  --       '<leader>zo',
  --       '<Cmd>ZkNotes { sort = { "modified" } }<CR>',
  --       mode = { 'n' },
  --       desc = 'notes',
  --     },
  --     {
  --       '<leader>zt',
  --       '<Cmd>ZkTags<CR>',
  --       mode = { 'n' },
  --       desc = 'tags',
  --     },
  --     {
  --       '<leader>zf',
  --       ":'<,'>ZkMatch<CR>",
  --       mode = { 'v' },
  --       desc = 'find (match selection)',
  --     },
  --   },
  --   cmd = {
  --     'ZkIndex',
  --     'ZkNew',
  --     'ZkNewFromTitleSelection',
  --     'ZkNewFromContentSelection',
  --     'ZkCd',
  --     'ZkNotes',
  --     'ZkBacklinks',
  --     'ZkLinks',
  --     'ZkInsertLink',
  --     'ZkInsertLinkAtSelection',
  --     'ZkMatch',
  --     'ZkTags',
  --   },
  -- },

  {
    'otavioschwanck/arrow.nvim',
    opts = {
      show_icons = true,
      leader_key = '<A-;>', -- Recommended to be a single key
      index_keys = 'gwrtzxcbjklm,.uiony123456789',
    },
    keys = {
      {
        '<leader><leader>',
        '<cmd>lua require("arrow.persist").toggle()<cr>',
        mode = { 'n' },
        desc = 'Arrow Toggle',
      },
      {
        '<C-h>',
        '<cmd>lua require("arrow.persist").previous()<cr>',
        mode = { 'n' },
        desc = 'Arrow Prev',
      },
      {
        '<C-l>',
        '<cmd>lua require("arrow.persist").next()<cr>',
        mode = { 'n' },
        desc = 'Arrow Next',
      },
    },
    lazy = false,
  },

  {
    'chrisgrieser/nvim-various-textobjs',
    lazy = false,
    opts = {
      useDefaultKeymaps = true,
      disabledKeymaps = { 'gc' },
    },
    config = function()
      local to = require('various-textobjs')
      vim.keymap.set({ 'o', 'x' }, 'C', function()
        to.multiCommentedLines()
      end, { desc = 'multiCommentedLines textobj' })
    end,
  },

  {
    'tris203/hawtkeys.nvim',
    config = true,
    cmd = { 'Hawtkeys', 'HawtkeysAll', 'HawtkeysDupes' },
  },

  {
    'luckasRanarison/tree-sitter-hyprlang',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    lazy = false,
  },

  {
    'nvimtools/none-ls.nvim',
    enabled = false,
    config = function()
      local augroup = vim.api.nvim_create_augroup('LspFormatting', {})
      local null_ls = require('null-ls')
      null_ls.setup({
        on_attach = function(client, bufnr)
          if client.supports_method('textDocument/formatting') then
            vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
            vim.api.nvim_create_autocmd('BufWritePre', {
              group = augroup,
              buffer = bufnr,
              callback = function()
                vim.lsp.buf.format({ async = false })
              end,
            })
          end
        end,
        sources = {
          null_ls.builtins.formatting.eslint_d,
          null_ls.builtins.diagnostics.eslint_d.with({
            config = {
              settings = {
                codeActionOnSave = {
                  enable = true,
                },
              },
            },
          }),
          null_ls.builtins.code_actions.eslint_d,
        },
      })
    end,
    ft = { 'javascript', 'javascriptreact', 'typescript', 'typescriptreact' },
  },

  {
    'dmmulroy/tsc.nvim',
    cmd = { 'TSC' },
  },

  {
    'johmsalas/text-case.nvim',
    dependencies = { 'nvim-telescope/telescope.nvim' },
    config = function()
      require('textcase').setup({})
      require('telescope').load_extension('textcase')
    end,
    keys = {
      {
        'ga',
      },
      {
        'ga.',
        '<cmd>TextCaseOpenTelescope<CR>',
        mode = { 'n', 'v' },
        desc = 'Telescope',
      },
    },
  },

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

      ft('json,css,scss,html,markdown,yaml'):fmt('prettier')
      ft('toml'):fmt('taplo')

      ft('lua'):fmt('lsp') --:append('stylua')

      ft('sh,bash'):fmt({
        cmd = 'shfmt',
        stdin = true,
        args = { '-i', '2' },
      }):lint('shellcheck')

      ft('python'):fmt('black')

      ft('go'):fmt('gofmt')

      ft('c,cpp'):fmt('clang-format') --:lint('clang-tidy')

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
    opts = {
      on_attach = function(bufnr)
        local map = vim.keymap.set
        local opts = { buffer = bufnr }
        local function toggle(key)
          return "<Esc>gv<Cmd>lua require'markdown.inline'"
              .. ".toggle_emphasis_visual'"
              .. key
              .. "'<CR>"
        end

        map('x', '<C-b>', toggle('b'), opts)
        map('x', '<C-i>', toggle('i'), opts)

        map('i', '<C-Enter>', '<Cmd>MDListItemBelow<CR>', opts)
        map('i', '<C-S-Enter>', '<Cmd>MDListItemAbove<CR>', opts)
        map('n', '<M-c>', '<Cmd>MDTaskToggle<CR>', opts)
        map('x', '<M-c>', ':MDTaskToggle<CR>', opts)
      end,
    },
    ft = { 'markdown' },
  },

  {
    'lukas-reineke/headlines.nvim',
    dependencies = 'nvim-treesitter/nvim-treesitter',
    config = true,
    ft = { 'markdown', 'rmd', 'org', 'norg', 'Avante' },
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
    opts = {
      sections = {
        definition = function(count)
          return 'D: ' .. count
        end,
        references = function(count)
          return 'R: ' .. count
        end,
        implements = false,
        git_authors = function(latest_author, count)
          return ' '
              .. latest_author
              .. (count - 1 == 0 and '' or (' + ' .. count - 1))
        end,
      },
    },
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

  {
    'tpope/vim-abolish',
    lazy = false,
    enabled = false,
  },

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
    ft = { 'markdown', 'Avante' },
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
      vim.cmd('echo " "') -- fix black screen flicker
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
        -- vim.api.nvim_set_hl(0, 'IndentScope', { fg = '#ee99ff' })
        vim.api.nvim_set_hl(0, 'rainbow1', { fg = '#ee99ff' })
        vim.api.nvim_set_hl(0, 'rainbow2', { fg = '#00ffd9' })
        vim.api.nvim_set_hl(0, 'rainbow3', { fg = '#ffd700' })
      end)
      require('ibl').setup({
        indent = {
          char = '▏',
          highlight = 'IndentChar',
        },
        scope = {
          show_start = false,
          -- highlight = 'IndentScope',
          highlight = {
            'rainbow1',
            'rainbow2',
            'rainbow3',
          },
          include = {
            node_type = { ['*'] = { '*' } },
          },
        },
        exclude = {
          filetypes = { 'markdown', 'tex', 'startify', 'Avante' },
        },
      })
      hooks.register(
        hooks.type.SCOPE_HIGHLIGHT,
        hooks.builtin.scope_highlight_from_extmark
      )
    end,
    lazy = false,
  },

  -- {
  --   'shellRaining/hlchunk.nvim',
  --   event = { 'UIEnter' },
  --   opts = {
  --     indent = {
  --       enable = false,
  --       -- use_treesitter = true,
  --       chars = { '▏' },
  --       style = { '#44475a' },
  --     },
  --     chunk = {
  --       style = {
  --         { fg = '#ee99ff' },
  --         { fg = '#ff5555' },
  --       },
  --     },
  --     line_num = {
  --       enable = false,
  --       use_treesitter = false,
  --       style = '#9861a3',
  --     },
  --     blank = {
  --       enable = false,
  --     },
  --   },
  -- },

  {
    'lewis6991/satellite.nvim',
    config = true,
    lazy = false,
  },

  {
    'Isrothy/neominimap.nvim',
    enabled = true,
    lazy = false,
    init = function()
      vim.opt.wrap = false       -- Recommended
      vim.opt.sidescrolloff = 36 -- It's recommended to set a large value
      vim.g.neominimap = {
        auto_enable = true,
        float = {
          minimap_width = 10,
          window_border = 'none',
        },
      }
    end,
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
    ft = { 'markdown', 'Avante' },
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
    'bbjornstad/pretty-fold.nvim',
    opts = {
      fill_char = '-',
      sections = {
        left = {
          'content',
          '• ',
          'number_of_folded_lines',
          ' ',
        },
      },
    },
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
    'linrongbin16/gitlinker.nvim',
    config = function()
      require('gitlinker').setup({
        message = false,
        highlight_duration = 0,
        router = {
          browse = {
            ['^github%.com'] = 'https://github.com/'
                .. '{_A.ORG}/'
                .. '{_A.REPO}/blob/'
                .. '{_A.CURRENT_BRANCH}/' -- always current branch
                .. '{_A.FILE}?plain=1'    -- '?plain=1'
                .. '#L{_A.LSTART}'
                .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
            ['^mygig%.gitlab%.yandexcloud%.net'] = 'https://mygig.gitlab.yandexcloud.net/'
                .. '{_A.ORG}/'
                .. '{_A.REPO}/blob/'
                .. '{_A.CURRENT_BRANCH}/' -- always current branch
                .. '{_A.FILE}?plain=1'    -- '?plain=1'
                .. '#L{_A.LSTART}'
                .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
          },
          blame = {
            ['^github%.com'] = 'https://github.com/'
                .. '{_A.ORG}/'
                .. '{_A.REPO}/blame/'
                .. '{_A.CURRENT_BRANCH}/' -- always current branch
                .. '{_A.FILE}?plain=1'    -- '?plain=1'
                .. '#L{_A.LSTART}'
                .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
            ['^mygig%.gitlab%.yandexcloud%.net'] = 'https://mygig.gitlab.yandexcloud.net/'
                .. '{_A.ORG}/'
                .. '{_A.REPO}/blame/'
                .. '{_A.CURRENT_BRANCH}/' -- always current branch
                .. '{_A.FILE}?plain=1'    -- '?plain=1'
                .. '#L{_A.LSTART}'
                .. "{(_A.LEND > _A.LSTART and ('-L' .. _A.LEND) or '')}",
          },
        },
      })
    end,

    keys = {
      {
        '<leader>gy',
        '<cmd>GitLink<cr>',
        mode = { 'n', 'v' },
        desc = 'Copy git link to clipboard',
      },
    },
    cmd = { 'GitLink' },
  },

  { 'kevinhwang91/nvim-bqf',            ft = { 'qf' } },

  {
    'onsails/lspkind-nvim',
    config = function()
      require('lspkind').init()
    end,
  },

  {
    'folke/lazydev.nvim',
    ft = 'lua', -- only load on lua files
    opts = {
      library = {
        -- See the configuration section for more details
        -- Load luvit types when the `vim.uv` word is found
        { path = 'luvit-meta/library', words = { 'vim%.uv' } },
      },
    },
    dependencies = { 'Bilal2453/luvit-meta' },
  },

  {
    'folke/trouble.nvim',
    opts = {
      modes = {
        diag = {
          mode = 'diagnostics',
          filter = {
            ['not'] = {
              severity = vim.diagnostic.severity.HINT,
            },
          },
        },
      },
    },
    cmd = 'Trouble',
    keys = {
      {
        '<leader>xx',
        '<cmd>Trouble diag toggle<cr>',
        desc = 'Diagnostics (Trouble)',
      },
      {
        '<leader>xX',
        '<cmd>Trouble diag toggle filter.buf=0<cr>',
        desc = 'Buffer Diagnostics (Trouble)',
      },
      {
        '<leader>xh',
        '<cmd>Trouble diagnostics toggle<cr>',
        desc = 'Diagnostics w/ HINTs (Trouble)',
      },
      {
        '<leader>cs',
        '<cmd>Trouble symbols toggle focus=false<cr>',
        desc = 'Symbols (Trouble)',
      },
      {
        '<leader>cl',
        '<cmd>Trouble lsp toggle focus=false win.position=right<cr>',
        desc = 'LSP Definitions / references / ... (Trouble)',
      },
      {
        '<leader>xL',
        '<cmd>Trouble loclist toggle<cr>',
        desc = 'Location List (Trouble)',
      },
      {
        '<leader>xQ',
        '<cmd>Trouble qflist toggle<cr>',
        desc = 'Quickfix List (Trouble)',
      },
    },
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

  -- NOTE: unmaintained
  {
    'ahmedkhalf/project.nvim',
    name = 'project_nvim',
    opts = {
      ignore_lsp = { 'copilot' },
      show_hidden = true,
    },
    event = { 'LspAttach' },
  },

  -- {
  --   'coffebar/neovim-project',
  --   opts = {
  --     projects = { -- define project roots
  --       '~/job/*',
  --       '~/github/*',
  --       '~/.config/*',
  --     },
  --   },
  --   init = function()
  --     -- enable saving the state of plugins in the session
  --     vim.opt.sessionoptions:append('globals') -- save global variables that start with an uppercase letter and contain at least one lowercase letter.
  --   end,
  --   dependencies = {
  --     { 'nvim-lua/plenary.nvim' },
  --     { 'nvim-telescope/telescope.nvim' },
  --     { 'Shatur/neovim-session-manager' },
  --   },
  --   lazy = false,
  --   priority = 100,
  -- },

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
