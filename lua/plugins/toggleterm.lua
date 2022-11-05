local mx = require('mapx')

require('toggleterm').setup({
  -- shade_terminals = false,
  on_open = function(term)
    vim.wo.spell = false
    if term.direction == 'float' then
      mx.nnoremap('<A-Esc>', '<cmd>ToggleTerm<cr>', { buffer = term.bufnr })
    end
  end,
  direction = 'float',
})

mx.nnoremap('<leader>tt', '<cmd>ToggleTerm<cr>')
mx.nnoremap('<leader>ts', '<cmd>2ToggleTerm direction=horizontal<cr>')
mx.nnoremap('<leader>tv', '<cmd>3ToggleTerm direction=vertical<cr>')

local Terminal = require('toggleterm.terminal').Terminal

local lazygit = Terminal:new({
  cmd = 'GIT_EDITOR="nvr -l" lazygit',
  hidden = true,
  dir = 'git_dir',
  direction = 'float',
  float_opts = {
    border = 'none',
  },
})

local function lazygit_toggle()
  lazygit:toggle()
end

mx.nmap('<leader>gg', lazygit_toggle)
