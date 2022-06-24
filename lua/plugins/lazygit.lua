local mx = require('mapx')

mx.nnoremap('<leader>gg', '<cmd>LazyGit<cr>', 'LazyGit')
mx.nnoremap('<leader>gc', '<cmd>LazyGitFilter<cr>', 'Project Commits')
mx.nnoremap('<leader>gf', '<cmd>LazyGitFilterCurrentFile<cr>', 'Current File Commits')
