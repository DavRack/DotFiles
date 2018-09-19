import subprocess
import os
usuario = os.path.expanduser("~")

def colocar_Dotfiles():
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

            if os.path.exists(path): #si existe la carpeta de destino se copria el dotfile
                comando = "ls "+carpeta 
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
    pass

def nuevo_dotfile():
    """agregar un nuevo dotfile, pedir al usuario nombre del programa y ruta del archivo"""
    pass

            
colocar_Dotfiles()
        











