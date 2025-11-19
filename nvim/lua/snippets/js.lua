local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- console.log();
ls.add_snippets('js', {
  s('cl', {
    t("console.log("), i(1, ''), t(');'),
  }),
})

-- comment: main component
ls.add_snippets('js', {
  s('cmain', {
    t('/********** '), i(1, ''), t(' **********/')
  }),
})

-- comment: sub component
ls.add_snippets('js', {
  s('csub', {
    t('//---------- '), i(1, ''), t(' ----------//')
  }),
})

