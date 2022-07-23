local nvim_lsp = require('lspconfig')
local navic = require('nvim-navic')
local mx = require('mapx')

local on_attach = function(client, bufnr)
  if client.server_capabilities.documentSymbolProvider then
    navic.attach(client, bufnr)
  end

  -- require('lsp_signature').on_attach(
  --     {
  --       bind = true,
  --       hint_enable = false,
  --       hi_parameter = 'Todo',
  --       handler_opts = { border = 'none' }
  --     })

  local function buf_set(...) vim.api.nvim_buf_set_option(bufnr, ...) end

  buf_set('omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings
  local buf = vim.lsp.buf
  mx.nnoremap('gD', function() buf.declaration() end, 'buffer', 'To Declaration')
  mx.nnoremap('gd', function() buf.definition() end, 'buffer', 'To Definition')
  mx.nnoremap('K', buf.hover, 'buffer', 'Describe on Point')
  mx.nnoremap('gi', function() buf.implementation() end, 'buffer',
    'To Implementation')
  mx.nnoremap('<C-A-k>', buf.signature_help, 'buffer', 'Signature on Point')

  mx.nname('<leader>l', 'LSP')
  mx.nnoremap('<leader>la', function() buf.add_workspace_folder() end, 'buffer',
    'Workspace Add')
  mx.nnoremap('<leader>lr', function() buf.remove_workspace_folder() end,
    'buffer', 'Workspace Remove')
  mx.nnoremap('<leader>ld',
    function() print(vim.inspect(buf.list_workspace_folders())) end,
    'buffer', 'List Workspaces')
  mx.nnoremap('<leader>ll', '<cmd>LspRestart<CR>', 'buffer', 'Restart Server')

  mx.nnoremap('<leader>D', function() buf.type_definition() end, 'buffer',
    'Type Definition')
  ---@diagnostic disable-next-line: missing-parameter
  mx.nnoremap('<F2>', function() buf.rename() end, 'buffer', 'Rename')
  ---@diagnostic disable-next-line: missing-parameter
  mx.nnoremap('<leader>cr', function() buf.rename() end, 'buffer', 'Rename')
  ---@diagnostic disable-next-line: missing-parameter
  mx.nnoremap('gr', function() buf.references() end, 'buffer', 'References')
  -- mx.nnoremap('<leader>a', function() buf.code_action() end, 'buffer',
  --             'Code Actions')
  mx.nnoremap('<leader>a', '<cmd>CodeActionMenu<cr>', 'buffer', 'Code Actions')
  vim.g.code_action_menu_show_details = false

  local d = vim.diagnostic
  mx.nnoremap('<leader>e', function() d.open_float() end, 'buffer',
    'Diagnostics on Point')
  mx.nnoremap(']d', function() d.goto_next() end, 'buffer', 'Next Diagnostic')
  mx.nnoremap('[d', function() d.goto_prev() end, 'buffer', 'Prev Diagnostic')

  ---@diagnostic disable-next-line: missing-parameter
  mx.nnoremap('<leader>lf', function() buf.formatting() end, 'buffer', 'Format')

  if client.name == 'eslint' then
    client.resolved_capabilities.document_formatting = true
    client.resolved_capabilities.document_range_formatting = true
  end

  if client.name == 'tsserver' then
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
  end
end

local servers = {
  'bashls', 'vimls', 'pyright', 'tsserver', 'vuels', 'yamlls', 'jsonls',
  'cmake', 'gopls', 'intelephense', 'cssls', 'html', 'hls', 'emmet_ls',
  'eslint', 'ccls', 'texlab', 'sumneko_lua', 'marksman'
}

local configs = {}

configs.ccls = {
  init_options = { highlight = { lsRanges = true } },
  offset_encoding = 'utf-16'
}

configs.texlab = {
  settings = {
    latex = {
      build = {
        args = {
          '-pdf', '-interaction=nonstopmode', '-synctex=1', '-outdir=./build',
          '%f'
        },
        outputDirectory = './build',
        onSave = true
      },
      lint = { onChange = true }
    }
  }
}

configs.sumneko_lua = require('lua-dev').setup({
  lspconfig = {
    cmd = { '/usr/bin/lua-language-server' },
    telemetry = { enable = false }
  }
})

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp
  .protocol
  .make_client_capabilities())

for _, lsp in ipairs(servers) do
  local config = {}
  if configs[lsp] then config = configs[lsp] end
  config.on_attach = on_attach
  config.capabilities = capabilities
  nvim_lsp[lsp].setup(config)
end
