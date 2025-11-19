local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- comment: main component
ls.add_snippets('lua', {
  s('cmain', {
    t('--********** '), i(1, ''), t(' **********--')
  }),
})

-- comment: sub component
ls.add_snippets('lua', {
  s('csub', {
    t('------------ '), i(1, ''), t(' ------------')
  }),
})

