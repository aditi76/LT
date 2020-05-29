%{
#include<stdio.h>
#include<math.h>
int yylex(void);
void yyerror(char *);
%}
%union{
float number;
}
%token <number> NUMBER FLOAT
%token METER KILOMETER CENTIMETER MILIMETER INTO
%type <number> S FUN1 FUN2 FUN3 FUN4 T
%%

S : T{$$=$1;printf("Result-%.2f",$$);};
T : KILOMETER INTO FUN1{$$=$3;}|METER INTO FUN2{$$=$3;}|CENTIMETER INTO FUN3{$$=$3;}|MILIMETER INTO FUN4{$$=$3;};

FUN1: METER NUMBER{$$=$2*1000;}|CENTIMETER NUMBER{$$=$2*100000;}|MILIMETER NUMBER{$$=$2*1000000;};
FUN2: CENTIMETER NUMBER{$$=$2*100;}|MILIMETER NUMBER{$$=$2*1000;}|KILOMETER NUMBER{$$=$2*0.001;};
FUN3: METER NUMBER{$$=($2)/100;}|KILOMETER NUMBER{$$=($2)/10000;}|MILIMETER NUMBER{$$=$2*10;};
FUN4: METER NUMBER{$$=($2)/100;}|CENTIMETER NUMBER{$$=($2)/10;}|KILOMETER NUMBER{$$=($2)/1000000;};
%%

void yyerror(char *s)
{
fprintf(stderr, "%s\n", s);
}
int main(int argc,char *argv[])
{
int m;
printf("Metric Convertor:-\n");
printf("Available Parameters are: kilometer meter centimeter milimeter");
printf("Example:- 'M -> km NUMBER'\n");

printf("Enter Your Conversion: \n");
scanf("%f\n",&m);
yyparse();
return 0;
}

