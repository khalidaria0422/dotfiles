local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node
local f = ls.function_node

-- std::cout with std::endl;
ls.add_snippets('cpp', {
  s('cl', {
    t('std::cout << '), i(1, ''), t(' << std::endl;')
  }),
})

-- std::cin
ls.add_snippets('cpp', {
  s('cp', {
    t('std::cin >> '), i(1, '')
  }),
})

-- Comment: file document
ls.add_snippets('cpp', {
  s('cdoc', {
    t('// '), i(1, 'filename.h'), t({ '',
    '// -----------------------------------------------',
    '// ' }), i(2, 'Purpose of the file'), t({ '',
    '// -----------------------------------------------',
    ''
    }),
  }),
})

-- Comment: section
ls.add_snippets('cpp', {
  s('csec', {
    t('// -- '), i(1, ''), t(' --')
  }),
})
