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
ARITMETICA="+"|"-"|"*"|"/"|"^"|"%"  
PARENTESISA="("
PARENTESISC=")"
PALABRAS_RESERVADAS="escribir"|"leer"|"si"|"entonces"|"devolver"|"sino"|"desde"|"mientras"|"incrementar"|"hacer"|"decrementar"|"mientras"|{bol}
CONDICIONES=">"|"<"|"=="|"!="



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
vEntero=({entero}{ESPACIO}{Nvariable})({COMA}{Nvariable})*
vReal=({real}{ESPACIO}{Nvariable})({COMA}{Nvariable})*
vCadena=({cadena}{ESPACIO}{Nvariable})({COMA}{Nvariable})*
vBool=({bool}{ESPACIO}{Nvariable})({COMA}{Nvariable})*

/*COMENTARIOS*/
/*comentario de una linea*/
ComenA={COMENTARIOC}({L}|{l}|{D}|{ESPACIO}|{ARITMETICA})*

/*comentario de varias lineas*/
ComenB={COMENTARIOA}({L}|{l}|{D}|{ESPACIO}|{EspacioBlanco}|"+"|"-"|"_"|"*"|"/*")*{COMENTARIOB}


/*FUNCIONES*/
tipoF={entero}|{real}|{cadena}|{bool}
funcion={tipoF}{ESPACIO}{Nvariable}{PARENTESISA}

/*especiales*/
CE1="cadenaAEntero"
CE2="cadenaAReal"
CE3="cadenaABoleano"
CE4="seno"|"coseno"|"tangente"|"logaritmo"|"raiz"
funcionE1={entero}{ESPACIO}{CE1}{PARENTESISA}{cadena}{ESPACIO}{Nvariable}{PARENTESISC}
funcionE2={real}{ESPACIO}{CE2}{PARENTESISA}{cadena}{ESPACIO}{Nvariable}{PARENTESISC}
funcionE3={bool}{ESPACIO}{CE3}{PARENTESISA}{cadena}{ESPACIO}{Nvariable}{PARENTESISC}
funcionA={real}{ESPACIO}{CE4}{PARENTESISA}{real}{ESPACIO}{Nvariable}{PARENTESISC}

/*Errores*/
e1={ErrorNVariable} 
e2=({vEntero}|{vReal}|{vCadena}|{vBool}){COMA}
e3={funcion}({vEntero}|{vCadena}|{vReal}|{vBool}|{COMA})+{EspacioBlanco}
e4={funcion}({COMA})
error={e1}|{e2}|{e3}|{e4}

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
{error} {
    System.out.println("Se encontro un error " + yytext());
}
{vEntero} {
    System.out.println("encontre un entero ");
    String caden = yytext();
    caden = caden.substring(7,caden.length()-1);
    System.out.println(caden);
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
    System.out.println("encontre un comentario de una linea " + yytext());
}
{ComenB} {
    System.out.println("encontre un comentario de varias lineas " + yytext());
}
{Nvariable} { 
   System.out.println("encontre un identificador  " + yytext());
}
{IGUAL} {
    System.out.println("encontre un Operando =  " + yytext());
}
{D} { 
    System.out.println("encontre un numero entero " + yytext());
}
{numR} { 
    System.out.println("encontre un numero Real " + yytext());
}
{cad} {
    System.out.println("encontre una cadena de texto " + yytext());
}
{ARITMETICA} {
    System.out.println("encontre un operando aritmetico " + yytext());
}
{PUNTOCOMA} {
    System.out.println("encontre un punto y coma " + yytext());
}
{PARENTESISA} {
    System.out.println("encontre un parentesis abierto" + yytext());
}
{PARENTESISC} {
    System.out.println("encontre un parentesis abierto" + yytext());
}
{PALABRAS_RESERVADAS} {
    System.out.println("encontre una palabra reservada " + yytext());
}
{funcion} {
    System.out.println("encontre una funcion " + yytext());  
    System.out.println("encontre un parentesis " + yytext());
    System.out.println("encontre una Identificador " + yytext());
}
{funcionE1} {
    System.out.println("encontre una funcion especial ENTERA " + yytext());  
    System.out.println("encontre una palabra reservada" + yytext());
    System.out.println("encontre un IDENTIFICADOR" + yytext());
    System.out.println("encontre un parentesis " + yytext());
}
{funcionE2} {
    System.out.println("encontre una funcion especial REAL " + yytext());  
    System.out.println("encontre un identificador" + yytext());
    System.out.println("encontre un parentesis " + yytext());
    System.out.println("encontre un IDENTIFICADOR " + yytext());
}
{funcionE3} {
    System.out.println("encontre una funcion especial BOLEANA " + yytext());  
    System.out.println("encontre una palabra reservada" + yytext());
    System.out.println("encontre un parentesis " + yytext());
    System.out.println("encontre un IDENTIFICADOR " + yytext());
}
{funcionA} {
    System.out.println("encontre una funcion Aritmetica REAL " + yytext());  
    System.out.println("encontre una palabra reservada" + yytext());
    System.out.println("encontre un parentesis " + yytext());
    System.out.println("encontre un IDENTIFICADOR " + yytext());
}

{EspacioBlanco} {}
. {}
