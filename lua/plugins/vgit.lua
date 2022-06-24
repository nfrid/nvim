local mx = require('mapx')

mx.nnoremap('<C-k>', '<cmd>VGit hunk_up<cr>', 'Hunk up')
mx.nnoremap('<C-j>', '<cmd>VGit hunk_down<cr>', 'Hunk down')

mx.nname('<leader>g', 'git')
mx.nnoremap('<leader>gs', '<cmd>VGit buffer_hunk_stage<cr>', 'Stage hunk')
mx.nnoremap('<leader>gr', '<cmd>VGit buffer_hunk_reset<cr>', 'Reset hunk')
mx.nnoremap('<leader>gp', '<cmd>VGit buffer_hunk_preview<cr>', 'Preview hunk')
mx.nnoremap('<leader>ga', '<cmd>VGit buffer_blame_preview<cr>', 'Blame')
mx.nnoremap('<leader>gd', '<cmd>VGit buffer_diff_preview<cr>', 'Diff')
mx.nnoremap('<leader>gh', '<cmd>VGit buffer_history_preview<cr>', 'History')
mx.nnoremap('<leader>gu', '<cmd>VGit buffer_reset<cr>', 'Reset buffer')
mx.nnoremap('<leader>gb', '<cmd>VGit buffer_gutter_blame_preview<cr>',
            'Gutter blame')

mx.nname('<leader>gl', 'project')
mx.nnoremap('<leader>glh', '<cmd>VGit project_hunks_preview<cr>', 'Hunks')
mx.nnoremap('<leader>gls', '<cmd>VGit project_hunks_staged_preview<cr>',
            'Staged hunks')
mx.nnoremap('<leader>gld', '<cmd>VGit project_diff_preview<cr>', 'Diff')
mx.nnoremap('<leader>glq', '<cmd>VGit project_hunks_qf<cr>', 'Quickfix hunks')
mx.nnoremap('<leader>gx', '<cmd>VGit toggle_diff_preference<cr>',
            'Toggle diff pref')

vim.o.updatetime = 500
vim.wo.signcolumn = 'yes'

require('vgit').setup({
  settings = {
    keymaps = { ['n <C-k>'] = 'hunk_up', ['n <C-j>'] = 'hunk_down' },
    git = {
      cmd = 'git',
      fallback_cwd = vim.fn.expand("$HOME", nil, nil),
      fallback_args = {
        "--git-dir", vim.fn.expand("$HOME/.dot", nil, nil), "--work-tree",
        vim.fn.expand("$HOME", nil, nil)
      }
    },
    hls = {
      GitBackground = 'Normal',
      GitHeader = 'NormalFloat',
      GitFooter = 'NormalFloat',
      GitBorder = 'LineNr',
      GitLineNr = 'LineNr',
      GitComment = 'Comment',
      GitSignsAdd = {
        gui = nil,
        fg = '#d7ffaf',
        bg = nil,
        sp = nil,
        override = false
      },
      GitSignsChange = {
        gui = nil,
        fg = '#7AA6DA',
        bg = nil,
        sp = nil,
        override = false
      },
      GitSignsDelete = {
        gui = nil,
        fg = '#e95678',
        bg = nil,
        sp = nil,
        override = false
      },
      GitSignsAddLn = 'DiffAdd',
      GitSignsDeleteLn = 'DiffDelete',
      GitWordAdd = {
        gui = nil,
        fg = nil,
        bg = '#5d7a22',
        sp = nil,
        override = false
      },
      GitWordDelete = {
        gui = nil,
        fg = nil,
        bg = '#960f3d',
        sp = nil,
        override = false
      }
    }
  }
})
