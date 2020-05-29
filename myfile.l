%{
#include<stdio.h>
#include "y.tab.h"
%}

%%
[0-9]+  {yylval.number=(float)atof(yytext);return NUMBER;}
[0-9]*\.[0-9]+ {yylval.number=(float)atof(yytext);return NUMBER;}
km {return KILOMETER;}
m {return METER;}
cm {return CENTIMETER;}
mm {return MILIMETER;}
-> {return INTO;}

[\n] {return yytext;}
[/t] ;

%%
int yywrap(){return 1;}
