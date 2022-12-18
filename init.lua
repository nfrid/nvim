require('utils')
require('opts')
require('cmds')
require('plugins')
require('impatient')

hot_reload(debug.getinfo(1).source:sub(2))
