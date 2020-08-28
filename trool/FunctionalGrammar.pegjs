// Bysness - Trool Improvement Grammar 
// ==========================
//

Expression = _ body:(Function / Symbol / String / Number) _ {return {type:"expression", body}} 

Function = _ name:$([\$a-zA-Z_][\$a-zA-Z0-9_]*) _ "(" _ args:(ExpressionList / _ ) _ ")" { return {type:"function", name, args} }

ExpressionList = _ exp0:Expression exp1:("," _ Expression)* { return [exp0, ...exp1.map((e: any[])=>e[2])]; }

Symbol "symbol"
  = _ [\$a-zA-Z][\$a-zA-Z0-9_]* { return {type:"symbol", value:text()} }

Number "Number"
  = _ exp:([0-9]+ ( "." [0-9]+ )*) { return {type:"number", value:parseFloat(text())} }

String
  = '"' chars:DoubleStringCharacter* '"' { return {type:"string", value:chars.join('')}; }
  / "'" chars:SingleStringCharacter* "'" { return {type:"string", value:chars.join('')}; }

DoubleStringCharacter
  = !('"' / "\\") char:. { return char; }
  / "\\" sequence:EscapeSequence { return sequence; }

SingleStringCharacter
  = !("'" / "\\") char:. { return char; }
  / "\\" sequence:EscapeSequence { return sequence; }

EscapeSequence
  = "'"
  / '"'
  / "\\"
  / "b"  { return "\b";   }
  / "f"  { return "\f";   }
  / "n"  { return "\n";   }
  / "r"  { return "\r";   }
  / "t"  { return "\t";   }
  / "v"  { return "\x0B"; }
  
  
_ "whitespace"
  = [ \t\n\r]*