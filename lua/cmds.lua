vim.cmd([[
au BufRead,BufNewFile *.py setlocal tabstop=4 softtabstop=4 shiftwidth=4

au BufReadPost *.zsh,.zshrc set filetype=sh
au BufReadPost *.fish set filetype=fish
au BufReadPost *.conf set filetype=config

au BufReadPost *.kbd set filetype=lisp

au BufReadPost .env,.env.* set filetype=config

command! W :w!
]])
