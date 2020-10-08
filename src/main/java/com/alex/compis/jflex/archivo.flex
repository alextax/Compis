package com.alex.compis;

%%

%public
%class Proyecto
%standalone
%line
%column
%char

N0="0"
N19=[1-9]
N09=[0-9]
S = "."
nM= "E"
nn= "e"

Ppositivo = ({N09}*({N19}|{N0}))
Pnegativo =(-{N09}*({N19}|{N0}))

NumPositivo = {N19}{N09}*{S}{Ppositivo}
NumNegativo =(-{N19}{N09}*{S}{Ppositivo})

DECIMAL = ({NumPositivo}|{NumNegativo})
EXPONENCIAL = {NumPositivo}({nM}|{nn})({Ppositivo}|{Pnegativo})

%%

{DECIMAL} {
	System.out.println("encontre un numero decimal: " + yytext() );
}
{EXPONENCIAL} {
        System.out.println("encontre un numero exponencial: " + yytext() );
}

.	{}
