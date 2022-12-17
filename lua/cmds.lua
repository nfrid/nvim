vim.cmd([[
au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4

au BufReadPost *.zsh,.zshrc set filetype=sh
au BufReadPost *.fish set filetype=fish
au BufReadPost *.conf set filetype=config

au BufReadPost *.kbd set filetype=lisp

au BufReadPost .env,.env.* set filetype=config

command! W :w!

set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
  \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
  \,sm:block-blinkwait175-blinkoff150-blinkon175
]])
