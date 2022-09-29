; inherits: lua

(function_call
  name: (dot_index_expression) @cmd (#eq? @cmd "vim.treesitter.parse_query")
  arguments: (arguments (string) (string) @query (#offset! @query 0 2 0 -2))
)
