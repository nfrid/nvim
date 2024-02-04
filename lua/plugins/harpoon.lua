---@type LazySpec
local M = {
  'ThePrimeagen/harpoon',
  branch = 'harpoon2',
  requires = { { 'nvim-lua/plenary.nvim' } },
  lazy = false,
  enabled = false,
}

M.config = function()
  local h = require('harpoon')
  h:setup({
    settings = {
      save_on_toggle = true,
      -- sync_on_ui_close = true,
    },
  })

  vim.keymap.set('n', '<leader><leader>', function()
    h.ui:toggle_quick_menu(h:list())
  end, { desc = 'Harpoon Menu' })
  vim.keymap.set('n', '<leader>h', function()
    h:list():append()
  end, { desc = 'Harpoon Append' })
  vim.keymap.set('n', '<C-h>', function()
    h:list():prev()
  end, { desc = 'Harpoon Prev' })
  vim.keymap.set('n', '<C-l>', function()
    h:list():next()
  end, { desc = 'Harpoon Next' })
end

return M
