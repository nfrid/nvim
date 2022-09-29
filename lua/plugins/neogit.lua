local ng = require('neogit')

ng.setup({
  integrations = {
    diffview = true,
  },
  signs = {
    section = { '', '' },
    item = { '', '' },
    hunk = { '', '' },
  },
  mappings = {
    status = {
      ['o'] = 'Toggle',
    },
  },
})

local mx = require('mapx')

mx.nmap('<leader>gg', function()
  ng.open()
end, 'Neogit')

mx.nmap('<leader>g_', function()
  ng.open({ kind = 'split_above' })
end, 'Neogit split')

mx.nmap('<leader>g|', function()
  ng.open({ kind = 'vsplit' })
end, 'Neogit vsplit')
