# DotFiles!

Este repositorio contiene los archivos de configuracion que uso en mis computadores que corren linux y consiste basicamente de dos partes:

1. Una serie de carpetas que contienen los archivos de configuracion

2. Un script llamado DotHelper.py que se encarga de instalar y actualizar los Dotfiles automaticamente

Sientase en la libertad de usar estas configuraciones y/o los scripts que aquí se encuentran.

Para copiar ésta carpeta a su dispositivo escriba la siguiente orden en la terminal:

git clone https://

## Los DotFiles y sus carpetas

Cada carpeta contiene dos archivos, el **archivo de configuracion** (Dotfile) y un archivo **path.txt** este ultimo contiene la direccion absuluta del archivo de configuracion por lo que es completamente indispensable que ambos archivos se encuentren el la carpeta

### Cómo agregar un nuevo dotfile

1. Dentro de la carpeta DotFiles cree una nueva carpeta y nombrela como desee (este nombre unicamente tiene propositos de organizacion y no afecta de ninguna forma la instalación)

2. Dentro de la carpeta creeada agrege un archivo path.txt y en el añada la ruta absoluta del Dotfile a respaldar. **Ejemplo ~/.config/nvim**

3. Tiene dos opciones:
    1. Copie el archivo deseado a la carpeta que acaba de crear
    2. Ejecute el programa **DotHelper.py** con la orden **./DotHelper.py -a** esto actualizará (todos) los Dotfiles y copiará el que ha recien añadido a la carpeta recien creada 

## El script DotHelper.py

DotHelper.py es un script que automatiza la instalacion y actualizacion de los Dotfiles y se usa de la siguiente forma:

Se ejecuta con **./DotHelper.py** -[argumento]

Se le debe asignal uno y solo uno de los siguientes argumentos:

+ **c : Copia los Dotfiles a la carpeta destino**
+ **a : Actualiza los Dotfiles**
+ **h : Muestra ayuda"**

**Ejemplo de uso:**

**./DotHelper.py -c**


## Dependencias

**Python3**




