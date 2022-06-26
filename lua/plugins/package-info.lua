local pkg = require('package-info')

pkg.setup({
  colors = { up_to_date = '#44475a', outdated = '#ffb86c' },
  icons = {
    enable = true,
    style = { up_to_date = '|  ', outdated = '|  ' }
  },
  autostart = true,
  hide_up_to_date = true,
  hide_unstable_versions = false,
  package_manager = 'yarn'
})

local mx = require('mapx')
mx.nname('<leader>n', 'node')

local function map(key, func, desc)
  mx.nnoremap('<leader>n' .. key, func, desc)
end

map('s', pkg.show, 'Show deps versions')
map('c', pkg.hide, 'Hide deps versions')
map('u', pkg.update, 'Update dep')
map('d', pkg.delete, 'Delete dep')
map('i', pkg.install, 'Install new dep')
map('p', pkg.change_version, 'Install dep version')
