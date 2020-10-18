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



L=[a-zA-Z]+
l=[a-z]+
D=[0-9]+
COMA=","
IGUAL="="
GUION="_"

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
Nvariable={l}+({L}|{D}|{GUION})*


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
{regla1} {
    System.out.println("encontre una nomenclatura" + yytext());
}
{EspacioBlanco} {}
. {}
