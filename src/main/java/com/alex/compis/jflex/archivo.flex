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

/*manera de usar codigo de java en jflex*/
%init{ 
/*Se crear los archivos donde se guardan los tokens y la demas informacion a usar*/
    File archivo = new File("tokens.txt");
    archivo.delete();/*se elminia lo que se tenia antes para poder generar un archivo en limpio en cada ejecucion*/
    archivo = new File("tabla.txt");
    archivo.delete();
    archivo = new File("errores.txt");
    archivo.delete();
%init}

//-------------EscribirTokens---------------
%{
/*se crea el metodo escribir para insertar datos en las palabras reservadas*/

    void escribirPR(String nuevo) /*recibimos lo que posteriormente se dara su escritura*/
    {
/*abrimos el archivo tokens donde queremos escribir*/
        File archivo = new File("tokens.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
/*agreagamos los datos que corresponden*/
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);/*le damos un true para que siga escribiendo de corrido y no cmo algo nuevo*/
            linea = new PrintWriter(escribir);
            linea.println("PALABRA RESERVADA: "+nuevo);/*agregamos los datos*/
            linea.close();
            escribir.close();
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);/*capturamos posibles erroes*/
        }
    }
/*metodo para escribir identificadores en el archivo tokens*/
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
/*se crea el metodo para escribir los singos en la tabla tokens*/
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
/*se crea el metodo para escribir los operadores en la tabla tokens*/

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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
/*Se crea el metodo para escribir los operadores */
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
/*Escribimos los numeros en la tabla tokens con el sig metodo*/
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
%}
//-------------EscribirVariablesFuncionesClases---------------
%{
/*creamos el metodo para escribir las variables en "tabla.txt"*/
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
/*metodo para poder escribir los nombres de las clases en la tabla.txt*/
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
/*metodo para guardar los nombres de las funciones en la tabla */
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
            verificar();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
%}

//------------------EscribirErrores-----------------
%{
/*metodo para mostrar los erroes los cuales se guardaran en errores.txt es metodo elimina lo antes hecho y solo muestra los errores*/
    void escribirError(String nuevo)
    {
        File archivo = new File("tokens.txt");
        archivo.delete();
        archivo = new File("tabla.txt");
        archivo.delete();
        archivo = new File("errores.txt");
        FileWriter escribir;
        PrintWriter linea;
          try {
            archivo.createNewFile();
            escribir = new FileWriter(archivo, true);
            linea = new PrintWriter(escribir);
            linea.println("ERROR ENCONTRADO EN LA LINEA: "+nuevo);
            linea.close();
            escribir.close();
        } catch (Exception e) {
            System.out.println("ERROR : " + e);
        }
    }
%}
%{
/*verificamos los erroes */
    void verificar()
    {
        File archivo = new File("errores.txt");
        if(archivo.exists())
        {
            archivo = new File("tokens.txt");
            archivo.delete();
            archivo = new File("tabla.txt");
            archivo.delete();
        }
    }
%}
/*tabla de simbolos usados*/
L=[A-Z]+
l=[a-z]+
D=[0-9]+
/*declaramos las palabras reservadas a usar*/
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
Nvariable={l}({l}|{L}|{D}|{GUION})* /*tenemos las condiciones para la creacion de variables*/
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
    escribirSigno("Identacion " + yytext());
}
{vEntero} {
/*encotramos el texto y lo guardamos como string para su posterior uso*/
    String caden = yytext();
    caden = caden.substring(7,caden.length());/*usamos substring para mostra la posicion que deseamos obtener del texto*/
    escribirPR("entero"); /*usamos el metodo repectivo para guardar*/
    escribirIdentificador(caden);/*guardamos el texto de la manera especifica*/
    escribirVariable(caden);
}
{vReal} {
/*encotramos el texto y lo guardamos */
    String caden = yytext();
    caden = caden.substring(5,caden.length());
    escribirPR("real");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{vCadena} {
/*encotramos el texto y lo guardamos */
    String caden = yytext();
    caden = caden.substring(7,caden.length());
    escribirPR("cadena");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{vBool} {
/*encotramos el texto y lo guardamos */
    String caden = yytext();
    caden = caden.substring(8,caden.length());
    escribirPR("boleano");
    escribirIdentificador(caden);
    escribirVariable(caden);
}
{ComenA} {
/*encotramos el texto y lo guardamos */
    escribirSigno("//");
}
{ComenB} {
/*encotramos el texto y lo guardamos */
    escribirSigno("/*");
    escribirSigno("*/");
}
{IGUAL} {
/*encotramos el texto y lo guardamos */
    escribirOperando(yytext());
}
{D} {
/*encotramos el texto y lo guardamos */
    escribirNumero(yytext());
}
{numR} { 
/*encotramos el texto y lo guardamos */
    escribirNumero(yytext());
}
{cad} {
/*encotramos el texto y lo guardamos */
    escribirSigno("'");
    escribirSigno("'");
}
{ARITMETICA} {
/*encotramos el texto y lo guardamos */
    escribirOperandoA(yytext());
}
{PUNTOCOMA} {
/*encotramos el texto y lo guardamos */
    escribirSigno(yytext());
}
{PARENTESISA} {
/*encotramos el texto y lo guardamos */
    escribirSigno(yytext());
}
{PARENTESISC} {
/*encotramos el texto y lo guardamos */
    escribirSigno(yytext());
}
{PALABRAS_RESERVADAS} {
/*encotramos el texto y lo guardamos */
    escribirPR(yytext());
}
{funcion} {
/*encotramos el texto y lo guardamos */
   String cad1 = yytext();
   int r = 0;
    /*vereficamos si existe antes de guardar*/
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
/*encotramos el texto y lo guardamos */
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
/*encotramos el texto y lo guardamos */
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
/*encotramos el texto y lo guardamos */
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
/*encotramos el texto y lo guardamos */
    escribirPR("real");
    escribirPR("real");
    escribirSigno("(");
    escribirSigno(")");
    String cad1 = yytext();
    int r = 0;
/*verificamos si se existe */
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
/*encotramos el texto y lo guardamos */
    escribirPR("clase");
    String cad = yytext();
    cad = cad.substring(6,cad.length());
    escribirIdentificador(cad);
    escribirClaseT(cad);
}
{extiende} {
/*encotramos el texto y lo guardamos */
    escribirPR("extiende");
    String cad = yytext();
    cad = cad.substring(9,cad.length());
    escribirIdentificador(cad);
}
{PUNTO} {
/*encotramos el texto y lo guardamos */
    escribirSigno(yytext());
}
{CONDICIONES} {
/*encotramos el texto y lo guardamos */
    escribirOperando(yytext());
}
{error} {
/*encotramos el texto y lo guardamos */
    String linea = String.valueOf(yyline+1);
    escribirError(linea);
}
{Nvariable} { 
/*encotramos el texto y lo guardamos */
   escribirIdentificador(yytext());
}
{Nclase} { 
/*encotramos el texto y lo guardamos */
   escribirIdentificador(yytext());
}
{DOSPUNTOS} {
/*encotramos el texto y lo guardamos */
    escribirSigno(":");
}
{COMILLAS} {
/*encotramos el texto y lo guardamos */
    escribirSigno(yytext());
}
{COMA} {
/*encotramos el texto y lo guardamos */
    escribirSigno(yytext());
}
{EspacioBlanco} {}
. {
/*de cualquier error usamos el metodo para eliminar lo anterior y solo guarda el error*/
    String linea = String.valueOf(yyline+1);
    escribirError(linea);
}
