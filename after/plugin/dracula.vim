hi! Cursor gui=reverse

hi! CursorLine guibg=#21222C
hi! CursorLineNr guifg=#F1FA8C guibg=#21222C gui=none

hi! SatelliteCursor guifg=#F1FA8C

hi IndentLine guifg=#44475a

hi! LspInlayHint guifg=#6272a4 guibg=#323645

hi DraculaErrorLine guifg=NONE guibg=NONE
hi DraculaWarnLine guifg=NONE guibg=NONE
hi DraculaInfoLine guifg=NONE guibg=NONE

hi DraculaWinSeparator guibg=#282A36
hi NvimSeparator guifg=#ff79c6

hi! link @text.strong DraculaOrangeBold
hi! @text.strike gui=strikethrough
hi! link @text.emphasis DraculaYellowItalic
hi! link @text.title DraculaPurpleBold
hi! link @text.literal DraculaYellow
hi! link @text.reference DraculaPurple
hi! link @text.uri DraculaCyan

" Semantic tokens

hi link @lsp.type.member @lsp.type.function
hi link @lsp.type.method @lsp.type.function
hi link @lsp.type.interface @lsp.type.type
hi @lsp.type.property guifg=#e8d7ff
hi link @lsp.type.enumMember DraculaPurple

hi link @lsp.mod.readonly DraculaPurple
hi link @lsp.typemod.function.readonly @lsp.type.function
" hi @lsp.mod.readonly gui=bold
hi @lsp.mod.deprecated gui=strikethrough
hi @lsp.mod.async gui=underdotted
" hi @lsp.mod.defaultLibrary guifg=#ff9999
hi @lsp.mod.defaultLibrary gui=italic
" hi @lsp.mod.declaration gui=underdotted

hi rainbow1 guifg=#ee99ff
hi rainbow2 guifg=#00ffd9
hi rainbow3 guifg=#ffd700
hi rainbow4 guifg=#ee99ff
hi rainbow5 guifg=#00ffd9
hi rainbow6 guifg=#ffd700
hi rainbow7 guifg=#ee99ff
hi rainbow8 guifg=#00ffd9
hi rainbow9 guifg=#ffd700
