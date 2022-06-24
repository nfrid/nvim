syn clear htmlTag
syn clear htmlTagN
syn region Date start=+<\S+ end=+\S>+ display containedin=mkdNonListItemBlock,mkdListItemLine,mkdBlockquote contained
hi def link Date DraculaGreen

hi def link TabLineFill Type
