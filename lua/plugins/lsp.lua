hot_reload(debug.getinfo(1).source:sub(2))

local nvim_lsp = require('lspconfig')
local navic = require('nvim-navic')
local mx = require('mapx')

local on_attach = function(client, bufnr)
  local caps = client.server_capabilities
  if caps.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  if caps.colorProvider and require('document-color') then
    require('document-color').buf_attach(bufnr)
  end

  local function buf_set(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  buf_set('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local buf = vim.lsp.buf
  mx.nnoremap('gD', function()
    buf.declaration()
  end, 'buffer', 'To Declaration')
  mx.nnoremap('gd', function()
    buf.definition()
  end, 'buffer', 'To Definition')
  -- mx.nnoremap('K', buf.hover, 'buffer', 'Describe on Point')
  mx.nnoremap('K', '<cmd>Lspsaga hover_doc<cr>', 'buffer', 'Describe on Point')
  mx.nnoremap('gi', function()
    buf.implementation()
  end, 'buffer', 'To Implementation')
  mx.nnoremap('<C-A-k>', buf.signature_help, 'buffer', 'Signature on Point')

  mx.nname('<leader>l', 'LSP')
  mx.nnoremap('<leader>la', function()
    buf.add_workspace_folder()
  end, 'buffer', 'Workspace Add')
  mx.nnoremap('<leader>lr', function()
    buf.remove_workspace_folder()
  end, 'buffer', 'Workspace Remove')
  mx.nnoremap('<leader>ld', function()
    print(vim.inspect(buf.list_workspace_folders()))
  end, 'buffer', 'List Workspaces')
  mx.nnoremap('<leader>ll', '<cmd>LspRestart<CR>', 'buffer', 'Restart Server')

  mx.nnoremap('<leader>D', function()
    buf.type_definition()
  end, 'buffer', 'Type Definition')
  mx.nnoremap('gr', function()
    ---@diagnostic disable-next-line: missing-parameter
    buf.references()
  end, 'buffer', 'References')
  mx.nnoremap('<F2>', '<cmd>Lspsaga rename<cr>', 'buffer', 'Rename')
  mx.nnoremap('<leader>cr', '<cmd>Lspsaga rename<cr>', 'buffer', 'Rename')
  mx.nnoremap('gj', '<cmd>Lspsaga lsp_finder<cr>', 'buffer', 'References')
  mx.nnoremap('gp', '<cmd>Lspsaga peek_definition<cr>', 'buffer', 'References')
  -- mx.nnoremap('<leader>a', function() buf.code_action() end, 'buffer',
  --             'Code Actions')
  mx.nnoremap('<leader>a', '<cmd>CodeActionMenu<cr>', 'buffer', 'Code Actions')
  vim.g.code_action_menu_show_details = false

  -- local d = vim.diagnostic
  local d = require('lspsaga.diagnostic')
  mx.nnoremap('<leader>e', function()
    d.show_line_diagnostics()
  end, 'buffer', 'Diagnostics on Line')
  mx.nnoremap('<leader>E', function()
    d.show_cursor_diagnostics()
  end, 'buffer', 'Diagnostics on Point')
  mx.nnoremap(']d', function()
    d.goto_next()
  end, 'buffer', 'Next Diagnostic')
  mx.nnoremap('[d', function()
    d.goto_prev()
  end, 'buffer', 'Prev Diagnostic')

  ---@diagnostic disable-next-line: missing-parameter
  mx.nnoremap('<leader>lf', function()
    buf.format({ async = true })
  end, 'buffer', 'Format')

  if client.name == 'eslint' then
    caps.documentFormattingProvider = true
    caps.documentRangeFormattingProvider = true
  end

  if client.name == 'tsserver' then
    caps.documentFormattingProvider = false
    caps.documentRangeFormattingProvider = false
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
  'sumneko_lua',
  'marksman',
  'tailwindcss',
  'cssmodules_ls',
  'rust_analyzer',
}

local configs = {}

configs.eslint = {
  settings = {
    coneActionOnSave = {
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

configs.tsserver = {
  settings = {
    typescript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
    javascript = {
      inlayHints = {
        includeInlayParameterNameHints = 'all',
        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayVariableTypeHints = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayEnumMemberValueHints = true,
      },
    },
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
  update_in_insert = true,
  float = {
    source = 'always', -- Or "if_many"
  },
})
