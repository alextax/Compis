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


%init{ 
    File archivo = new File("tokens.txt");
    archivo.delete();
    archivo = new File("tabla.txt");
    archivo.delete();
%init}
//-------------EscribirTokens---------------
%{
    void escribirPR(String nuevo)
    {
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("PALABRA RESERVADA: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirIdentificador(String nuevo)
    {
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("INDENTIFICADOR(ES): "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirSigno(String nuevo)
    {
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("SIGNO: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirOperando(String nuevo)
    {
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("OPERADOR: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirOperandoA(String nuevo)
    {
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("OPERADOR ARITMETICO : "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirNumero(String nuevo)
    {
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("NUMERO: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
%}
//-------------EscribirVariablesFuncionesClases---------------
%{
    void escribirVariable(String nuevo)
    {
        File archivo = new File("tabla.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("VARIABLE: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirClaseT(String nuevo)
    {
        File archivo = new File("tabla.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("CLASE: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
    void escribirFuncionT(String nuevo)
    {
        File archivo = new File("tabla.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("FUNCION: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
%}
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
DOSPUNTOS=":"
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
ErrorNVariable=({D}|{L})({l}|{L}|{D}|{GUION})*

/*Datos Asignados*/
numR={D}+({PUNTO}{D}+)*
cad={COMILLAS}({L}|{l}|{D}|{ESPACIO})*{COMILLAS}
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
errorNclase=({l}|{D})({l}|{L}|{D}|{GUION})*
clase={cl}{ESPACIO}{Nclase}
extiende={ex}{ESPACIO}{Nclase}
errorce=({cl}|{ex}){ESPACIO}{errorNclase}
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
e1=({entero}|{real}|{cadena}|{bool}){ESPACIO}{ErrorNVariable} 
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
error={e1}|{e2}|{e3}|{e4}|{e5}|{e6}|{e7}|{e8}|{e9}|{e10}|{e11}|{e12}|{errorce}

/*detecta un tabulador*/
tab={ESPACIO}{4}

%%
{tab} {
    System.out.println("encontre una tabulacion");
}
{vEntero} {
    String caden = yytext();
    caden = caden.substring(7,caden.length());
    escribirPR("entero");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{vReal} {
    String caden = yytext();
    caden = caden.substring(5,caden.length());
    escribirPR("real");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{vCadena} {
    String caden = yytext();
    caden = caden.substring(7,caden.length());
    escribirPR("cadena");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{vBool} {
    String caden = yytext();
    caden = caden.substring(8,caden.length());
    escribirPR("boleano");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{ComenA} {
    escribirSigno("//");
}
{ComenB} {
    escribirSigno("/*");
    escribirSigno("*/");
}
{IGUAL} {
    escribirOperando(yytext());
}
{D} {
    escribirNumero(yytext());
}
{numR} { 
    escribirNumero(yytext());
}
{cad} {
    escribirSigno("'");
    escribirSigno("'");
}
{ARITMETICA} {
    escribirOperandoA(yytext());
}
{PUNTOCOMA} {
    escribirSigno(yytext());
}
{PARENTESISA} {
    escribirSigno(yytext());
}
{PARENTESISC} {
    escribirSigno(yytext());
}
{PALABRAS_RESERVADAS} {
    escribirPR(yytext());
}
{funcion} {
   String cad1 = yytext();
   int r = 0;
   boolean prueba = true;
   while ( prueba ) {
         if(cad1.charAt(r)==' ')
         {
            prueba = false;
         }
         else 
         {
            r++;
         }
    }
    String pr = cad1.substring(0,r);
    escribirPR(pr);
    escribirSigno("(");
    String caden = cad1.substring(r+1,cad1.length()-1);
    escribirIdentificador(caden);
    escribirFuncionT(caden);
}
{funcionE1} { 
    escribirPR("entero");
    escribirPR("cadenaAEntero");
    escribirPR("cadena");
    escribirFuncionT("Funcion especial: cadenaAEntero");
    escribirSigno("(");
    escribirSigno(")");
    String cad = yytext();
    cad = cad.substring(28,cad.length()-1);
    escribirIdentificador(cad);
    escribirVariable(cad);
}
{funcionE2} {
    escribirPR("real");
    escribirPR("cadenaAReal");
    escribirPR("cadena");
    escribirFuncionT("Funcion especial: cadenaAReal");
    escribirSigno("(");
    escribirSigno(")");
    String cad = yytext();
    cad = cad.substring(24,cad.length()-1);
    escribirIdentificador(cad);
    escribirVariable(cad);
}
{funcionE3} { 
    escribirPR("boleano");
    escribirPR("cadenaABoleano");
    escribirPR("cadena");
    escribirFuncionT("Funcion especial: cadenaABoleano");
    escribirSigno("(");
    escribirSigno(")");
    String cad = yytext();
    cad = cad.substring(30,cad.length()-1);
    escribirIdentificador(cad);
    escribirVariable(cad);
}
{funcionA} {
    escribirPR("real");
    escribirPR("real");
    escribirSigno("(");
    escribirSigno(")");
    String cad1 = yytext();
    int r = 0;
    boolean prueba = true;
    while ( prueba ) {
         if(cad1.charAt(r)=='(')
         {
            prueba = false;
         }
         else 
         {
            r++;
         }
    }
    String cad= cad1.substring(5,r);
    escribirPR(cad);
    escribirFuncionT("funcion especial: "+cad);
    cad=cad1.substring(r+5,cad1.length()-1);
    escribirIdentificador(cad);
    escribirVariable(cad);
}
{clase} {
    escribirPR("clase");
    String cad = yytext();
    cad = cad.substring(6,cad.length());
    escribirIdentificador(cad);
    escribirClaseT(cad);
}
{extiende} {
    escribirPR("extiende");
    String cad = yytext();
    cad = cad.substring(9,cad.length());
    escribirIdentificador(cad);
}
{PUNTO} {
    escribirSigno(yytext());
}
{CONDICIONES} {
    escribirOperando(yytext());
}
{error} {
    System.out.println("Se encontro un error " + yytext());
}
{Nvariable} { 
   escribirIdentificador(yytext());
}
{Nclase} { 
   escribirIdentificador(yytext());
}
{DOSPUNTOS} {
    escribirSigno(":");
}
{COMILLAS} {
    escribirSigno(yytext());
}
{COMA} {
    escribirSigno(yytext());
}
{EspacioBlanco} {}
. {
    System.out.println("Se encontro un error " + yytext());
}
