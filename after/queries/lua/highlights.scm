; inherits: lua

(function_call
  name: (dot_index_expression) @cmd (#eq? @cmd "vim.cmd")
  arguments: (arguments (string) @nospell)
)
