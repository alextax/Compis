package com.alex.compis;
    
%%

%public
%class Proyecto
%standalone
%line
%column
%char

L=[a-zA-Z]+
l=[a-z]+
D=[0-9]+
COMA=","
IGUAL="="

/*Espacio en blanco*/
FinLinea = \r|\n|\r\n
EspacioBlanco = {FinLinea} |[ \t\f]

/*Palabras reservadas*/
entero="entero"
real="real"
cadena="cadena"
bool="booleano"
nul="nulo"

/*Declaracion de Variables*/
/*Nombre de una variable*/
Nvariable={l}+(L|D|GUION)*


/*DETECTA NOMENCLATURA DE VARIABLE A,B,C*/
regla1={L}+{espacio}({L}{COMA})+{L}

/* VARIABLE=DATO */
i={l}+{espacio}{IGUAL}{D}+

/*detecta un tabulador*/
espacio=[ \n]
tab={espacio}{4}

/*Reservadas*/
reservadas={real}|{entero}|{cadena}|{nul}|{bool}

/*Declarar var*/
declarar={reservadas}{espacio}{i}

%%
{tab} {
    System.out.println("encontre una tabulacion");
}
{Nvariable} {
    System.out.println("encontre una variable " + yytext());
}
{regla1} {
    System.out.println("encontre una nomenclatura" + yytext());
}
{EspacioBlanco} {}
. {}
