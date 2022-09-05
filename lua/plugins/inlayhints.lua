--[[
local ih = require('lsp-inlayhints')
ih.setup()

local group = vim.api.nvim_create_augroup('Inlayhints', {})
vim.api.nvim_create_autocmd('LspAttach', {
  group = group,
  callback = function(args)
    if not (args.data and args.data.client_id) then
      return
    end

    local bufnr = args.buf
    local client = vim.lsp.get_client_by_id(args.data.client_id)
    ih.on_attach(client, bufnr, false)
  end,
})
--]]--
