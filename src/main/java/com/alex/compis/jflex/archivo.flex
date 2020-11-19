package com.alex.compis;
import java.io.*;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.PrintWriter;
import java_cup.runtime.Symbol;


%%

%public
%class Proyecto
%standalone
%line
%column
%char
%cup
%eofval{
    System.out.println("");
    return new Symbol(sym.EOF);
%eofval}
%eofclose

/*manera de usar codigo de java en jflex*/
%init{ 
/*Se crear los archivos donde se guardan los tokens y la demas informacion a usar*/
    
    File archivo = new File("errores.txt");
    archivo.delete();
%init}

//------------------EscribirErrores-----------------
%{
/*Metodo utilizado en el momento de detectar algun error */
    void escribirError(String nuevo)
    {
        File archivo = new File("errores.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("LEX: Se encontró un error lexico en : "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
%}
/*EXPRESIONES DECLARADAS*/

L=[A-Z]+
l=[a-z]+
D=[0-9]+

/*PALABRAS RESERVADAS*/
entero="entero"
real="real"
cadena="cadena"
boleano="boleano"
nulo="nulo"
v="verdadero"
f="falso"
and = "AND"
or = "OR"
escribir = "escribir"
leer = "leer"
si = "si"
entonces = "entonces"
sino ="sino"
devolver = "devolver"
desde = "desde"
mientras = "mientras"
incrementar = "incrementar"
decrementar = "decrementar"
hacer = "hacer"
cadenaAEntero = "cadenaAEntero"
cadenaAReal = "cadenaAReal"
cadenaABoleano = "cadenaAboleano"
seno = "seno"
coseno = "coseno"
tangente = "tangente"
logaritmo = "logaritmo"
raiz = "raiz"
clase = "clase"
extiende = "extiende"
propiedades = "propiedades"
metodos = "metodos"
publicas = "publicas"
privadas = "privadas"
protegidas = "protegidas"
publicos = "publicos"
privados = "privados"
protegidos = "protegidos"
instanciar = "instanciar"
eliminar = "eliminar"
constructor = "constructor"
destructor = "desctructor"
incluir = "incluir"
Principal = "Principal"

/*SIGNOS*/
punto = "."
puntoComa = ";"
coma = ","
parentesisA = "("
parentesisC = ")"
comillas = "\""
guion = "_"
dosPuntos = ":"

/*OPERADORES*/
igual = "="
operadorA = "*"|"/"|"^"|"%"
mas = "+"
menos = "-"
menor = "<"
mayor = ">"
noIgual = "!="

/*IDENTIFICADOR*/
/*identificador para variables o funciones*/
identificadorVF={l}({l}|{L}|{D}|{guion})* 
identificadorC={L}({l}|{L}|{D}|{guion})*

/*NUMEROS Y CADENAS*/
numR={D}+({punto}{D}+)+
cad = {comillas}({L}|{l}|{D}|{espacio}|{operadorA}|{guion}|{punto}|{dosPuntos})*{comillas}

/*Espacios, FinLineas, Saltos de Linea, Identacion*/
espacio=[ \n]
FinLinea = \r|\n|\r\n
EspacioBlanco = {FinLinea} |[ \t\f]
tab={espacio}{4}

/*ERRORES LEXICOS*/
/*error en el identificador de una variable o Funcion*/
ErrorNVariable=({D}|{L})({l}|{L}|{D}|{guion})*  
/*error al nombrar una Clase*/
ErrorNclase=({l}|{D})({l}|{L}|{D}|{guion})*

/*COMENTARIOS*/
COMENTARIOA="/*"
COMENTARIOB="*/"
COMENTARIOC="//"

/*comentario de una linea*/
ComenA={COMENTARIOC}({L}|{l}|{D}|{espacio}|{operadorA})*
/*comentario de varias lineas*/
ComenB={COMENTARIOA}({L}|{l}|{D}|{espacio}|{EspacioBlanco}|"+"|"-"|"_"|"*"|"/*")+{COMENTARIOB}

%%
{tab} {
}

{ComenA} { 
}
{ComenB} {
}
{espacio} {
}
{EspacioBlanco} {
}
{puntoComa} {
}
{coma} {
    return new Symbol(sym.coma);
}
{instanciar} {
    System.out.println("CLASE INSTANCIADA ENCONTRADA " + yytext());
    return new Symbol(sym.instanciar);
}
{devolver} {
    return new Symbol(sym.devolver);
}
{desde} {
    System.out.println("SE DETECTO UNA ESTRUCTURA ITERATIVA");
    return new Symbol(sym.desde);
}
{mientras} {
    System.out.println("SE DETECTO UNA ESTRUCTURA ITERATIVA");
    return new Symbol(sym.mientras);
}
{incrementar} {
    return new Symbol(sym.incrementar);
}
{decrementar} {
    return new Symbol(sym.decrementar);
}
{hacer} {
    return new Symbol(sym.hacer);
}
{sino} {
    System.out.println("SE DETECTO UNA ESTRUCTURA SELECTIVA ");
    return new Symbol(sym.sino);
}
{entonces} {
    return new Symbol(sym.entonces);
}
{menor} {
    return new Symbol(sym.menor);
}
{mayor} {
    return new Symbol(sym.mayor);
}
{noIgual} {
    return new Symbol(sym.noigual);
}
{si} {
    System.out.println("SE DETECTO UNA ESTRUCTURA SELECTIVA ");
    return new Symbol(sym.si);
}
{entonces} {
    System.out.println("SE DETECTO UNA ESTRUCTURA SELECTIVA ");
    return new Symbol(sym.entonces);
}
{escribir} {
    System.out.println("SE DETECTO UNA ESCRITURA ");
    return new Symbol(sym.escribir);
}
{leer} {
    System.out.println("SE DETECTO UNA LECTURA ");
    return new Symbol(sym.leer);
}
{cad} {
    return new Symbol(sym.texto);
}
{incluir} { 
    System.out.println("SE DETECTO UNA INCLUSION DE LIBRERIAS ");
    return new Symbol(sym.incluir);
}
{clase} { 
    System.out.println("SE DETECTO Y DECLARO UNA CLASE");
    return new Symbol(sym.clase);
}
{extiende} { 
    System.out.println("SE DETECTO UNA HERENCIA ");
    return new Symbol(sym.extiende);
}
{entero} { 
    System.out.println("SE DETECTO UNA DECLARARCION ");
    return new Symbol(sym.entero);
}
{real} {
    System.out.println("SE DETECTO UNA DECLARARCION ");
    return new Symbol(sym.real);
}
{cadena} { 
    System.out.println("SE DETECTO UNA DECLARARCION ");
    return new Symbol(sym.cadena);
}
{boleano} {
System.out.println("SE DETECTO UNA DECLARARCION ");
    return new Symbol(sym.boleano);
}
{nulo} {
System.out.println("SE DETECTO UNA DECLARARCION ");
    return new Symbol(sym.nulo);
}
{propiedades} {
    return new Symbol(sym.propiedades);
}
{metodos} {
    return new Symbol(sym.metodos);
}
{publicas} {
    return new Symbol(sym.publicas);
}
{privadas} {
    return new Symbol(sym.privadas);
}
{protegidas} {
    return new Symbol(sym.protegidas);
}
{publicos} {
    return new Symbol(sym.publicos);
}
{privados} {
    return new Symbol(sym.privados);
}
{protegidos} {
    return new Symbol(sym.protegidos);
}
{and} {
    return new Symbol(sym.and);
}
{or} {
    return new Symbol(sym.or);
}

{v} {
    return new Symbol(sym.verdadero);
}
{f} {
    return new Symbol(sym.falso);
}
{identificadorVF} {
    return new Symbol(sym.identificadorVF);
}
{identificadorC} {
    return new Symbol(sym.identificadorC);
}
{numR} {
    return new Symbol(sym.numeroR);}
{D} {
    return new Symbol(sym.numero);
}
{igual} {
    return new Symbol(sym.igual);
}

{parentesisC} {
    return new Symbol(sym.parentesisC);
}
{parentesisA} {
    return new Symbol(sym.parentesisA);
}
{dosPuntos} {
    return new Symbol(sym.dosPuntos);
}
{punto} {
    return new Symbol(sym.punto);
}
{operadorA} {
    return new Symbol(sym.operadorA);
}
{mas} {
    return new Symbol(sym.mas);
}
{menos} {
    return new Symbol(sym.menos);
}

. {
/*de cualquier error usamos el metodo para eliminar lo anterior y solo guarda el error*/
    String linea = String.valueOf(yyline+1);
    System.out.println("LEX encontre un error en la linea " + linea);
    escribirError(linea);
    return new Symbol(sym.error);
}

