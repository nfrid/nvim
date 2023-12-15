---@type LazySpec
local M = {
  'neovim/nvim-lspconfig',
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    'mrshmllow/document-color.nvim',
  },
  event = { 'BufReadPre' },
}

--- @param mode string|table
--- @param lhs string
--- @param rhs string|function
--- @param desc string
--- @param opts table|nil
local function mapbuf(mode, lhs, rhs, desc, opts)
  local options = { rhs, desc, noremap = true, buffer = 0 }
  if opts then
    options = vim.tbl_extend('force', options, opts)
  end
  -- vim.keymap.set(mode, lhs, rhs, options)
  require('which-key').register({ [lhs] = options })
end

M.config = function()
  local nvim_lsp = require('lspconfig')

  mapbuf('n', '<leader>li', function()
    vim.lsp.inlay_hint(0)
  end, 'Toggle Inlay Hints')

  local on_attach = function(client, bufnr)
    local caps = client.server_capabilities

    if client.server_capabilities.colorProvider then
      -- Attach document colour support
      require('document-color').buf_attach(bufnr)
    end

    --- @param name string
    --- @param value string
    local function buf_set(name, value)
      vim.api.nvim_set_option_value(name, value, { buf = bufnr })
    end

    buf_set('omnifunc', 'v:lua.vim.lsp.omnifunc')

    vim.lsp.inlay_hint(bufnr, true)

    -- Mappings
    local buf = vim.lsp.buf
    mapbuf('n', 'gD', function()
      buf.declaration()
    end, 'To Declaration')
    mapbuf('n', 'gd', function()
      buf.definition()
    end, 'To Definition')
    -- map('n', 'K', buf.hover, 'Describe on Point')
    mapbuf('n', 'K', '<cmd>Lspsaga hover_doc<cr>', 'Describe on Point')
    mapbuf('n', 'gi', function()
      buf.implementation()
    end, 'To Implementation')
    mapbuf('n', '<C-A-k>', buf.signature_help, 'Signature on Point')

    require('which-key').register({
      ['<leader>l'] = '+LSP'
    })
    mapbuf('n', '<leader>la', function()
      buf.add_workspace_folder()
    end, 'Workspace Add')
    mapbuf('n', '<leader>lr', function()
      buf.remove_workspace_folder()
    end, 'Workspace Remove')
    mapbuf('n', '<leader>ld', function()
      print(vim.inspect(buf.list_workspace_folders()))
    end, 'List Workspaces')
    mapbuf('n', '<leader>ll', '<cmd>LspRestart<CR>', 'Restart Server')

    mapbuf('n', '<leader>D', function()
      buf.type_definition()
    end, 'Type Definition')
    mapbuf('n', 'gr', function()
      ---@diagnostic disable-next-line: missing-parameter
      buf.references()
    end, 'References')
    mapbuf('n', '<F2>', '<cmd>Lspsaga rename<cr>', 'Rename')
    mapbuf('n', '<leader>cr', '<cmd>Lspsaga rename<cr>', 'Rename')
    mapbuf('n', 'gj', '<cmd>Lspsaga finder<cr>', 'References')
    mapbuf('n', 'gp', '<cmd>Lspsaga peek_definition<cr>', 'References')
    -- map('n', '<leader>a', function() buf.code_action() end,
    --             'Code Actions')
    mapbuf('n', '<leader>a', '<cmd>Lspsaga code_action<cr>', 'Code Actions')

    -- local d = vim.diagnostic
    mapbuf(
      'n',
      '<leader>e',
      '<cmd>Lspsaga show_line_diagnostics<cr>',
      'Diagnostics on Line'
    )
    mapbuf(
      'n',
      '<leader>E',
      '<cmd>Lspsaga show_cursor_diagnostics<cr>',
      'Diagnostics on Point'
    )
    mapbuf('n', ']d', '<cmd>Lspsaga diagnostic_jump_next<cr>', 'Next Diagnostic')
    mapbuf('n', '[d', '<cmd>Lspsaga diagnostic_jump_prev<cr>', 'Prev Diagnostic')

    ---@diagnostic disable-next-line: missing-parameter
    mapbuf('n', '<leader>lf', function()
      buf.format({ async = true })
    end, 'Format')

    if client.name == 'eslint' then
      caps.documentFormattingProvider = true
      caps.documentRangeFormattingProvider = true
    end

    if client.name == 'tsserver' then
      caps.documentFormattingProvider = false
      caps.documentRangeFormattingProvider = false
      require('twoslash-queries').attach(client, bufnr)
    end

    if client.name == 'csharp_ls' then
      caps.documentFormattingProvider = false
      caps.documentRangeFormattingProvider = false
    end

    if client.name == 'cssmodules_ls' then
      caps.definitionProvider = false
    end

    if caps.documentFormattingProvider then
      local au_format =
          vim.api.nvim_create_augroup('format_on_save', { clear = true })
      vim.api.nvim_create_autocmd('BufWritePre', {
        pattern = '*',
        callback = function()
          buf.format({ async = false })
        end,
        group = au_format,
      })
    end
  end

  local servers = {
    'bashls',
    'vimls',
    'pyright',
    'ruff_lsp',
    'tsserver',
    'vuels',
    'yamlls',
    'jsonls',
    'cmake',
    'gopls',
    'intelephense',
    'cssls',
    'html',
    'hls',
    -- 'emmet_ls',
    'eslint',
    'ccls',
    'texlab',
    'lua_ls',
    'marksman',
    'tailwindcss',
    'cssmodules_ls',
    'rust_analyzer',
    'typst_lsp',
    'csharp_ls',
  }

  local configs = {}

  configs.yamlls = {
    settings = {
      yaml = {
        keyOrdering = false,
      },
    },
  }

  configs.eslint = {
    settings = {
      codeActionOnSave = {
        enable = true,
      },
    },
  }

  configs.ccls = {
    init_options = { highlight = { lsRanges = true } },
  }

  configs.texlab = {
    settings = {
      latex = {
        build = {
          args = {
            '-pdf',
            '-interaction=nonstopmode',
            '-synctex=1',
            '-outdir=./build',
            '%f',
          },
          outputDirectory = './build',
          onSave = true,
        },
        lint = { onChange = true },
      },
    },
  }

  require('neodev').setup({})

  local tssettings = {
    inlayHints = {
      includeInlayParameterNameHints = 'literals',
      includeInlayParameterNameHintsWhenArgumentMatchesName = false,
      includeInlayFunctionParameterTypeHints = true,
      includeInlayVariableTypeHints = false,
      includeInlayPropertyDeclarationTypeHints = true,
      includeInlayFunctionLikeReturnTypeHints = true,
      includeInlayEnumMemberValueHints = true,
    },
  }

  configs.tsserver = {
    settings = {
      typescript = tssettings,
      javascript = tssettings,
    },
  }

  local colorCapabilities = vim.lsp.protocol.make_client_capabilities()

  colorCapabilities.textDocument.colorProvider = { dynamicRegistration = true }

  local capabilities =
      require('cmp_nvim_lsp').default_capabilities(colorCapabilities)

  for _, lsp in ipairs(servers) do
    local config = {}
    if configs[lsp] then
      config = configs[lsp]
    end
    config.on_attach = on_attach
    config.capabilities = capabilities
    nvim_lsp[lsp].setup(config)
  end

  vim.diagnostic.config({
    virtual_text = { prefix = '●' },
    -- update_in_insert = true,
    float = {
      source = 'always', -- Or "if_many"
    },
  })
end

return M
