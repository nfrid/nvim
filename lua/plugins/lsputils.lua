local bufnr = vim.api.nvim_buf_get_number(0)
local ca = require('lsputil.codeAction')
local cl = require('lsputil.locations')

vim.lsp.handlers['textDocument/codeAction'] =
    function(_, _, actions)
      ca.code_action_handler(nil, actions, nil, nil, nil)
    end

vim.lsp.handlers['textDocument/references'] =
    function(_, _, result)
      cl.references_handler(nil, result, { bufnr = bufnr }, nil)
    end

vim.lsp.handlers['textDocument/definition'] =
    function(_, method, result)
      cl.definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
    end

vim.lsp.handlers['textDocument/declaration'] =
    function(_, method, result)
      cl.declaration_handler(nil, result, { bufnr = bufnr, method = method },
                             nil)
    end

vim.lsp.handlers['textDocument/typeDefinition'] =
    function(_, method, result)
      cl.typeDefinition_handler(nil, result, { bufnr = bufnr, method = method },
                                nil)
    end

vim.lsp.handlers['textDocument/implementation'] =
    function(_, method, result)
      cl.implementation_handler(nil, result, { bufnr = bufnr, method = method },
                                nil)
    end

vim.lsp.handlers['textDocument/documentSymbol'] =
    function(_, _, result, _, bufn)
      require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn },
                                                  nil)
    end

vim.lsp.handlers['textDocument/symbol'] =
    function(_, _, result, _, bufn)
      require('lsputil.symbols').workspace_handler(nil, result,
                                                   { bufnr = bufn }, nil)
    end

vim.g.lsp_utils_codeaction_opts = { mode = 'editor' }
vim.g.lsp_utils_location_opts = { mode = 'editor' }
vim.g.lsp_utils_symbols_opts = { mode = 'editor' }

