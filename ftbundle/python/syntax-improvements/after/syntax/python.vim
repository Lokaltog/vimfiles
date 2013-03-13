syn keyword pythonStatement class nextgroup=pythonClass skipwhite
syn match pythonClass "[a-zA-Z_][a-zA-Z0-9_]*" display contained

syn region pythonDocString start=+^\(\\\n\s*\)\@<!\s*"""+ end=+"""+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,pythonDocStringTitle,pythonEpydocMarkup,pythonEpydocTag,@Spell
syn region pythonDocString start=+^\(\\\n\s*\)\@<!\s*'''+ end=+'''+ keepend contains=pythonEscape,pythonEscapeError,pythonDocTest,pythonSpaceError,pythonDocStringTitle,pythonEpydocMarkup,pythonEpydocTag,@Spell
syn region pythonDocStringTitle contained matchgroup=pythonDocString start=+"""+ matchgroup=pythonDocStringTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end=+"""+me=s-1,he=s-1 contains=pythonEpydocMarkup,@Spell concealends
syn region pythonDocStringTitle contained matchgroup=pythonDocString start=+'''+ matchgroup=pythonDocStringTitle keepend end="\.$" end="\.[ \t\r<&]"me=e-1 end="[^{]@"me=s-2,he=s-1 end=+'''+me=s-1,he=s-1 contains=pythonEpydocMarkup,@Spell concealends

syn keyword pythonSelf self

hi def link pythonDocString Comment
hi def link pythonDocStringTitle SpecialComment

hi def link pythonClass Function
hi def link pythonSelf Structure

set conceallevel=2
