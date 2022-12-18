hot_reload(debug.getinfo(1).source:sub(2))

local gs = require('gitsigns')
local mx = require('mapx')

vim.wo.signcolumn = 'yes'

mx.nnoremap('<C-j>', ']c')
mx.nnoremap('<C-k>', '[c')

gs.setup({
  on_attach = function(bufnr)
    vim.cmd('hi! link GitSignsDelete Error')

    local p = '<leader>g'
    mx.name(p, 'git', { buffer = bufnr })

    -- Navigation
    mx.nnoremap('<C-j>', function()
      gs.next_hunk()
    end, { buffer = bufnr }, 'Next hunk')

    mx.nnoremap('<C-k>', function()
      gs.prev_hunk()
    end, { buffer = bufnr }, 'Prev hunk')

    -- Actions
    mx.nnoremap(
      p .. 's',
      ':Gitsigns stage_hunk<CR>',
      { buffer = bufnr },
      'Stage hunk'
    )
    mx.vnoremap(
      p .. 's',
      ':Gitsigns stage_hunk<CR>',
      { buffer = bufnr },
      'Stage hunk'
    )
    mx.nnoremap(
      p .. 'r',
      ':Gitsigns reset_hunk<CR>',
      { buffer = bufnr },
      'Reset hunk'
    )
    mx.vnoremap(
      p .. 'r',
      ':Gitsigns reset_hunk<CR>',
      { buffer = bufnr },
      'Reset hunk'
    )
    mx.nnoremap(p .. 'S', gs.stage_buffer, { buffer = bufnr }, 'Stage buffer')
    mx.nnoremap(
      p .. 'u',
      gs.undo_stage_hunk,
      { buffer = bufnr },
      'Unstage hunk'
    )
    mx.nnoremap(p .. 'R', gs.reset_buffer, { buffer = bufnr }, 'Reset buffer')
    mx.nnoremap(p .. 'p', gs.preview_hunk, { buffer = bufnr }, 'Preview hunk')
    mx.nnoremap(p .. 'b', function()
      gs.blame_line({ full = true })
    end, { buffer = bufnr }, 'Blame line')
    mx.nnoremap(
      p .. 'B',
      gs.toggle_current_line_blame,
      { buffer = bufnr },
      'Toggle line blame'
    )
    mx.nnoremap(p .. 'd', function()
      gs.diffthis()
    end, { buffer = bufnr }, 'Diff this')
    mx.nnoremap(p .. 'D', function()
      gs.diffthis('~')
    end, { buffer = bufnr }, 'Diff ~')
    mx.nnoremap(p .. 'x', function()
      gs.toggle_deleted()
    end, { buffer = bufnr }, 'Toggle deleted')

    -- Text object
    mx.onoremap(
      'ih',
      ':<C-U>Gitsigns select_hunk<CR>',
      { buffer = bufnr },
      'in hunk'
    )
    mx.xnoremap(
      'ih',
      ':<C-U>Gitsigns select_hunk<CR>',
      { buffer = bufnr },
      'in hunk'
    )
  end,

  worktrees = {
    {
      toplevel = vim.env.HOME,
      gitdir = vim.env.HOME .. '/.dot'
    }
  }
})
