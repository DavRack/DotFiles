#!/usr/bin/env python3
import subprocess
import sys
import os
usuario = os.path.expanduser("~")

def copiar_Dotfiles():
    """toma los Dotfiles de cada carpeta y los copia a la ruta especificada"""

    carpetas = subprocess.check_output("ls -d */",shell=True).decode("UTF-8").split("\n") #crea una lista con todas las carpetas del directorio 
    carpetas = carpetas[:-1]

    for carpeta in carpetas: # para cada carpeta verifica si existe el archivo path.txt de ser el caso lee su contenido en caso contrario lanza mensaje
        comando = carpeta+"path.txt"
        if os.path.exists(comando):
            comando = "cat "+carpeta+"path.txt"
            path = subprocess.check_output(comando,shell=True).decode("UTF-8")
            path = path.replace('~','')
            path = usuario + path
            path = path.replace('\n','')
            if path.endswith("/")==False:
                path = path+"/"

            if os.path.exists(path): #si existe la carpeta de destino se copria el dotfile
                comando = "ls -A "+carpeta 
                archivos = subprocess.check_output(comando,shell=True).decode("UTF-8").split("\n")[:-1]
                archivos.remove('path.txt')
                dotfile = archivos[0]
                comando = "cp "+carpeta+dotfile+" "+path
                subprocess.check_output(comando,shell=True)
                print(dotfile+" copiado correctamente")
            else:
                print("no existe la carpeta de destino para "+carpeta)

        else: print("falta el archivo path.txt de la carpeta "+carpeta)

def actualizar_Dotfiles():
    """para cada carpeta en DotFiles buscar el archivo destino y copiarlo a la carpeta"""
    carpetas = subprocess.check_output("ls -d */",shell=True).decode("UTF-8").split("\n") #crea una lista con todas las carpetas del directorio 
    carpetas = carpetas[:-1]

    for carpeta in carpetas: # para cada carpeta verifica si el archivo path.txt existe, de ser el caso copia el dotfile a su carpeta correspondiente en la carpeta DotFiles
        comando = carpeta+"path.txt"
        if os.path.exists(comando):
            comando = "cat "+carpeta+"path.txt"
            path = subprocess.check_output(comando,shell=True).decode("UTF-8")
            path = path.replace('~','')
            path = usuario + path
            path = path.replace('\n','')
            if path.endswith("/")==False:
                path = path+"/"

            if os.path.exists(path):
                comando = "ls -A "+carpeta
                archivos = subprocess.check_output(comando,shell=True).decode("UTF-8").split("\n")[:-1]
                archivos.remove('path.txt')
                dotfile = archivos[0]
                comando = "cp "+path+dotfile+" "+carpeta
                if os.path.exists(path+dotfile):
                    archivos = subprocess.check_output(comando,shell=True).decode("UTF-8").split("\n")[:-1]
                    print(dotfile+" se ha copiado a la carpeta DotFiles")

                else:
                    print("El archivo "+dotfile+" no existe")

            else:
                print("no existe la carpeta de destino para "+carpeta)

        else: print("falta el archivo path.txt de la carpeta "+carpeta)


def nuevo_dotfile():
    """Agregar un nuevo dotfile, pedir al usuario nombre del programa y ruta del archivo"""
    pass

def actualizar_Git():
    """Realiza un commit y copia todos los datos desde la repo online"""
    os.system("git add -A")
    os.system('git commit -m "DotFiles actualizados"')
    os.system('git fetch --all')
    os.system('git reset origin/master')

ayuda = "\
         -a : Actualiza los Dotfiles \n\
         -c : Copia los Dotfiles a la carpeta destino \n\
         -d : Actualiza el repositorio git \n\
         -h : Muestra ésta ayuda"


if len(sys.argv) == 2:
    argumento = sys.argv[1]

    if argumento == "-c":
        copiar_Dotfiles()

    elif argumento == "-a":
        actualizar_Dotfiles()

    elif argumento == "-d":
        actualizar_Git()

    elif argumento == "-h":
        print(ayuda)


elif len(sys.argv) == 1:
    print("Se necesita un argumento")
    print(ayuda)

elif len(sys.argv) > 2:
    print("demasiados argumentos")










