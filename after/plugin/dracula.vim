hi NormalFloat guibg=none
hi WinBar guibg=none
hi WinBarNC guibg=none

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

hi DraculaPinkBold guifg=#ff79c6 gui=bold
hi DraculaCyanBold guifg=#8be9fd gui=bold

hi link @markup.heading.1.marker.markdown DraculaComment
hi link @markup.heading.2.marker.markdown DraculaComment
hi link @markup.heading.3.marker.markdown DraculaComment
hi link @markup.heading.4.marker.markdown DraculaComment
hi link @markup.heading.5.marker.markdown DraculaComment
hi link @markup.heading.6.marker.markdown DraculaComment

hi link @markup.heading.1.markdown DraculaPurpleBold
hi link @markup.heading.2.markdown DraculaOrangeBold
hi link @markup.heading.3.markdown DraculaPinkBold
hi link @markup.heading.4.markdown DraculaGreenBold
hi link @markup.heading.5.markdown DraculaCyanBold
hi link @markup.heading.6.markdown DraculaComment

hi link @markup.strong.markdown_inline DraculaOrangeBold
hi link @markup.italic.markdown_inline DraculaYellowItalic
hi link @markup.link.url.markdown_inline DraculaCyan
hi link @markup.link.label.markdown_inline DraculaPink
hi link @markup.link.markdown_inline DraculaPurple

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

hi TreesitterContextBottom gui=underline guisp=#6272a4
hi TreesitterContextLineNumberBottom gui=underline guisp=#6272a4

hi link FlashCurrent CurSearch
hi FlashLabel gui=bold guifg=#282a36 guibg=#ffb86c
