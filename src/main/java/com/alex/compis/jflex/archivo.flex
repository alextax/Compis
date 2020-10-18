package com.alex.compis;
import java.io.*;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;


%%

%public
%class Proyecto
%standalone
%line
%column
%char

L=[A-Z]+
l=[a-z]+
D=[0-9]+
COMA=","
PUNTOCOMA=";"
PUNTO="."
IGUAL="="
GUION="_"
ESPACIO=[ \n]
COMILLAS="'"
COMENTARIOA="/*"
COMENTARIOB="*/"
COMENTARIOC="//"

/*Espacio en blanco*/
FinLinea = \r|\n|\r\n
EspacioBlanco = {FinLinea} |[ \t\f]

/*Tipo de Datos*/
entero="entero"
real="real"
cadena="cadena"
bool="boleano"
null="nulo"
v="verdadero"
f="falso"

/*VARIABLES*/
/*Nombre de una variable*/
Nvariable={l}({l}|{L}|{D}|{GUION})*
ErrorNVariable=({L}|{D})({l}|{L}|{D}|{GUION})*

/*Datos Asignados*/
numR={D}+({PUNTO}{D}+)*
cad={COMILLAS}({L}|{l}|{D})*{COMILLAS}
bol={v}|{f}
asignacion={IGUAL}({D}|{numR}|{cad}|{bol})

/*Declaracion Variables*/
vEntero=({entero}{ESPACIO}{Nvariable})({COMA}{Nvariable})*(""|{asignacion})
vReal=({real}{ESPACIO}{Nvariable})({COMA}{Nvariable})*(""|{asignacion})
vCadena=({cadena}{ESPACIO}{Nvariable})({COMA}{Nvariable})*(""|{asignacion})
vBool=({bool}{ESPACIO}{Nvariable})({COMA}{Nvariable})*(""|{asignacion})

/*Comentarios*/
ComenA={COMENTARIOC}({L}|{l}|{D}|{ESPACIO})*
ComenB={COMENTARIOA}(({L}|{l}|{D}|{ESPACIO})*|{EspacioBlanco})*{COMENTARIOB}

/*Errores*/
e1={Nvariable}|{ErrorNVariable}

/*detecta un tabulador*/
tab={ESPACIO}{4}

%%
{tab} {
    System.out.println("encontre una tabulacion");
}
/*
{Nvariable} {

    System.out.println("encontre una variable " + yytext());
 
    File archivo = new File("tokens.txt");
    FileWriter escribir;
    PrintWriter linea;
    archivo.delete();
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("T:"+yytext());
            linea.close();
            escribir.close();
        } catch (Exception e) {             
 }   
}
*/
{vEntero} {
    System.out.println("encontre un entero " + yytext());
}
{vReal} {
    System.out.println("encontre un Real " + yytext());
}
{vCadena} {
    System.out.println("encontre una cadena " + yytext());
}
{vBool} {
    System.out.println("encontre un boleano " + yytext());
}
{ComenA} {
    System.out.println("se encontro un comentario de una linea // " + yytext());
}
{ComenB} {
    System.out.println("se encontro un comentario de varias lineas // " + yytext());
}
{EspacioBlanco} {}
. {}
