package ic.lex;

import ic.error.LexicalError;



%% 

%class Lexer
%public
%function next_token
%type Token
%line

%{
int numNestedComments = 1; 
%}


IntegerLiteral = [0-9]+
StringLiteral = \"[^\r\n\"]*\"
Identifier = [a-z]+[:jletterdigit:]*
ClassIdentifier = [A-Z]+[:jletterdigit:]*

//from jflex documentation
LineTerminator = \r|\n|\r\n
InputCharacter = [^\r\n]
WhiteSpace = {LineTerminator} | [ \t\f]
Comment = {TraditionalComment} | {EndOfLineComment} | {DocumentationComment}
TraditionalComment = "/*" [^*] ~"*/" | "/*" "*"+ "/"
EndOfLineComment = "//" {InputCharacter}* {LineTerminator}?
DocumentationComment = "/**" {CommentContent} "*"+ "/"
CommentContent = ( [^*] | \*+ [^/*] )*



 

%state COMMENT
/*%%
%{ 
numNestedComments = 1; 
%}*/


 
%%
<YYINITIAL>{
	"(*" { yybegin(COMMENT); } 
	"*)" { throw new LexicalError(yyline, yytext()); }
	"(" { return new Token(sym.LPAREN, yyline); }
	")" { return new Token(sym.RPAREN, yyline); }
	"{" { return new Token(sym.LBRACE, yyline); }
	"}" { return new Token(sym.RBRACE, yyline); }
	"[" { return new Token(sym.LBRACKET, yyline); }
	"]" { return new Token(sym.RBRACKET, yyline); }
	";" { return new Token(sym.SEMICOLON, yyline); }
	"," { return new Token(sym.COMMA, yyline); }
	"." { return new Token(sym.PERIOD, yyline); }
	"=" { return new Token(sym.ASSIGN, yyline); }
	"+" { return new Token(sym.PLUS, yyline); }
	"-" { return new Token(sym.MINUS, yyline); }
	"*" { return new Token(sym.TIMES, yyline); }
	"/" { return new Token(sym.DIVIDE, yyline); }
	"%" { return new Token(sym.MOD, yyline); }
	"&&" { return new Token(sym.AND, yyline); }
	"||" { return new Token(sym.OR, yyline); }
	"<" { return new Token(sym.LESS, yyline); }
	"<=" { return new Token(sym.LEQ, yyline); }
	">" { return new Token(sym.GREATER, yyline); }
	">=" { return new Token(sym.GEQ, yyline); }
	"==" { return new Token(sym.EQUAL, yyline); }
	"!=" { return new Token(sym.NOTEQUAL, yyline); }
	"!" { return new Token(sym.NOT, yyline); }
	"true" { return new Token(sym.TRUE, yyline); }
	"false" { return new Token(sym.FALSE, yyline); }
	"null" { return new Token(sym.NULL, yyline); }
	"class" { return new Token(sym.CLASS, yyline); }
	"extends" { return new Token(sym.EXTENDS, yyline); }
	"void" { return new Token(sym.VOID, yyline); }
	"return" { return new Token(sym.RETURN, yyline); }
	"if" { return new Token(sym.IF, yyline); }
	"else" { return new Token(sym.ELSE, yyline); }
	"while" { return new Token(sym.WHILE, yyline); }
	"break" { return new Token(sym.BREAK, yyline); }
	"continue" { return new Token(sym.CONTINUE, yyline); }
	"this" { return new Token(sym.THIS, yyline); }
	"new" { return new Token(sym.NEW, yyline); }
	"length" { return new Token(sym.LENGTH, yyline); }
	"Library" { return new Token(sym.LIBRARY, yyline); }
	"int" { return new Token(sym.INTTYPE, yyline); }
	"boolean" { return new Token(sym.BOOLEAN, yyline); }
	"string" { return new Token(sym.STRINGTYPE, yyline); }
	{IntegerLiteral} { return new Token(sym.INTLITERAL, yytext(), yyline); }
	{StringLiteral} { return new Token(sym.STRINGLITERAL, yytext(), yyline); }
	{WhiteSpace} {/* ignore */}
	{Comment} {/* ignore */}
	{Identifier} { return new Token(sym.IDENTIFIER, yytext(), yyline); }
	{ClassIdentifier} { return new Token(sym.CLASS_ID, yytext(), yyline); }
	<<EOF>> { return new Token(sym.ENDOFINPUT, yyline); }
	. { throw new LexicalError(yyline, yytext()); }
}



<COMMENT>{  
	"(*" { 
		numNestedComments++; 
		/* ignore */
	}
	
	"*)" { 
		numNestedComments--; 
		if (numNestedComments == 0){
			yybegin(YYINITIAL);
			/* ignore */
		}
		
	
	}
	
	<<EOF>> {
		throw new LexicalError(yyline, "end of file");
	}
	
	. { 
		/* ignore */ 
		}
		
	[\n\r]+ {
		/* ignore */
	}
}



