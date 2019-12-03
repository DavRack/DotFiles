# DotFiles!

Este repositorio contiene los archivos de configuracion que uso en mis computadores linux y consiste basicamente de dos partes:

1. Una "base de datos" que contiene los archivos de configuracion y carpetas

2. Un script llamado DotMaid que se encarga de instalar y actualizar los Dotfiles automaticamente

Sientase en la libertad de usar estas configuraciones y/o los scripts que aquí se encuentran.

Para copiar ésta carpeta a su dispositivo escriba la siguiente orden en la terminal:

cd ~ && git clone https://github.com/davidlo176/DotFiles

Para hacer uso del script "DotMaid" debe clonar este repositorio en la carpeta home del usuario

## La "base de datos"

En la carpeta "DotDataBase" se encuentran los archivos de configuracion, esta carpeta hace las veces de la carpeta "Home" de un usuario por ejemplo:
si un archivo de configuración se encuentra en la ruta ~/.config/nvim/init.vim este se copiará a la ruta DotDataBase/.config/nvim/init.vim

El archivo DotDataBaseList contiene la lista de los archivos añadidos a la base de datos, tanto archivos como carpetas. 
## Instalación

Ejecute el archivo "install.sh" y escriba su contraseña.
## Cómo agregar un nuevo dotfile

Escriba: DotMaid -a [ruta absoluta o relativa al archivo o carpeta]
### Ejemplo:

*DotMaid -a ~/.config/nvim/init.vim*
Lo anterior es equivalente a:
*cd ~/.config/nvim/*
*DotMaid -a init.vim*
