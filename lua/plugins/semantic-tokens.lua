local legend = {
  tokenModifiers = {
    'declaration',
    'static',
    'async',
    'readonly',
    'defaultLibrary',
    'local',
  },
  tokenTypes = {
    'class',
    'enum',
    'interface',
    'namespace',
    'typeParameter',
    'type',
    'parameter',
    'variable',
    'enumMember',
    'property',
    'function',
    'member',
  },
}

local hl = require('nvim-semantic-tokens.table-highlighter')

require('nvim-semantic-tokens').setup({
  preset = 'default',
  -- highlighters is a list of modules following the interface of nvim-semantic-tokens.table-highlighter or
  -- function with the signature: highlight_token(ctx, token, highlight) where
  --        ctx (as defined in :h lsp-handler)
  --        token  (as defined in :h vim.lsp.semantic_tokens.on_full())
  --        highlight (a helper function that you can call (also multiple times) with the determined highlight group(s) as the only parameter)
  highlighters = { hl },
})

hl.token_map.member = 'LspMember'
hl.token_map['local'] = 'LspLocal'

hl.modifiers_map.readonly = {
  variable = 'LspReadonly',
}

hl.modifiers_map.defaultLibrary = {
  class = 'LspDefaultLibrary',
  variable = 'LspDefaultLibrary',
  property = 'LspDefaultLibrary',
}

vim.lsp.handlers['textDocument/semanticTokens/refresh'] = require('nvim-semantic-tokens.semantic_tokens').on_refresh
