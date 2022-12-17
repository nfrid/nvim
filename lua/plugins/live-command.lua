require('live-command').setup({
  commands = {
    S = { cmd = 'Subvert' },
    R = {
      cmd = "norm",
      -- This will transform ":5R a" into ":norm 5@a"
      args = function(opts)
        return (opts.count == -1 and "" or opts.count) .. "@" .. opts.args
      end,
      range = "",
    },
    Norm = { cmd = 'norm' },
  },
})

vim.cmd('cabbrev N Norm')
