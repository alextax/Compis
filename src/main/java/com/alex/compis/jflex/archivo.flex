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
PALABRAS_RESERVADAS="escribir"|"leer"|"si"|"entonces"|"devolver"|"sino"|"desde"|"mientras"|"incrementar"|"hacer"|"decrementar"|"mientras"|{bol}|"propiedades publicas"|"propiedades privadas"|"propiedades protegidas"|"metodos publicos"|"metodos privados"|"metodos protegidos"|"instanciar"|"eliminar"|"constructor"|"destructor"|"nulo"
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
ErrorNVariable={D}({l}|{L}|{D}|{GUION})*

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
funcion={tipoF}{ESPACIO}{Nvariable}(""|{ESPACIO}){PARENTESISA}

/*CLASES*/
cl="clase"
ex="extiende"
Nclase={L}({l}|{L}|{D}|{GUION})*
clase={cl}{ESPACIO}{Nclase}
extiende={ex}{ESPACIO}{Nclase}

/*especiales*/
CE1="cadenaAEntero"
CE2="cadenaAReal"
CE3="cadenaABoleano"
CE4="seno"|"coseno"|"tangente"|"logaritmo"|"raiz"
funcionE1={entero}{ESPACIO}{CE1}{PARENTESISA}{cadena}{ESPACIO}{Nvariable}{PARENTESISC}
funcionE2={real}{ESPACIO}{CE2}{PARENTESISA}{cadena}{ESPACIO}{Nvariable}{PARENTESISC}
funcionE3={bool}{ESPACIO}{CE3}{PARENTESISA}{cadena}{ESPACIO}{Nvariable}{PARENTESISC}
funcionA={real}{ESPACIO}{CE4}{PARENTESISA}{real}{ESPACIO}{Nvariable}{PARENTESISC}

/*incluir*/
inc="incluir"
incluir={inc}{ESPACIO}{COMILLAS}({D}|{L}|{l}|{GUION})+{COMILLAS}

/*Errores*/
e1={ErrorNVariable} 
e2=({vEntero}|{vReal}|{vCadena}|{vBool}){COMA}
e3={funcion}({COMA})
e4={funcion}{Nvariable}
t="propiedades"|"metodos"
t1="Propeidades"|"Metodos"
e5={t}({l}|{L}|{D})+
e6={t}{ESPACIO}{Nclase}
e7={t1}
t2="publicas:"|"privadas:"|"protegidas:"
e8={t2}{EspacioBlanco}
e9=({cl}|{ex}){ESPACIO}{Nvariable}
e10={inc}{COMILLAS}({D}|{L}|{l}|{GUION})+{COMILLAS}
e11={inc}{ESPACIO}({D}|{L}|{l}|{GUION})+{COMILLAS}
e12={inc}{ESPACIO}{COMILLAS}({D}|{L}|{l}|{GUION})+
error={e1}|{e2}|{e3}|{e4}|{e5}|{e6}|{e7}|{e8}|{e9}|{e10}|{e11}|{e12}

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
    System.out.println("encontre un parentesis cerrado" + yytext());
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
{clase} {
    System.out.println("encontre una clase " + yytext());
    System.out.println("encontre un identificador " + yytext());
}
{extiende} {
    System.out.println("encontre un extiende " + yytext());
    System.out.println("encontre un identificador " + yytext());
}
{PUNTO} {
    System.out.println("encontre un punto " + yytext());
}
{Nvariable} { 
   System.out.println("encontre un identificador  " + yytext());
}
{Nclase} { 
   System.out.println("encontre un identificador  " + yytext());
}
{EspacioBlanco} {}
. {}
