TSynSampleSyn   {first Identifier is considered to be the Class Name }
tk              {second Identifier is considered to be the Identifier Prefix }
IdentStart '_', 'a'..'z', 'A'..'Z':: '_', '0'..'9', 'a'..'z', 'A'..'Z'::

TOKENTYPES
Identifier
Comment2 Style=[fsBold]|Foreground=clNavy
Comment3 Style=[fsItalic]|Foreground=clGreen
Space
String Foreground=clMaroon
Key Style=[]
|><|

KEYS
Skyrim
Fallout
|><|

CHARS

'A'..'Z', 'a'..'z', '_':: Ident
BeginProc
  fTokenID := IdentKind(fLine + Run);
  inc(Run, fStringLen);
  while IsIdentChar(fLine[Run]) do
    Inc(Run);
EndProc
|><|

ENCLOSEDBY

Comment2,htmlComment,<,>,MultiLine
Comment3,BracketComment,[,],MultiLine
String,String,",",MultiLine
|><|

SAMPLESOURCE
{highlighter}
|><|

