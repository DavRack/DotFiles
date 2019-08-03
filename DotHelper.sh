#!/bin/bash
home="$HOME/Documentos/DotFiles/home"
function ayuda (){
    echo "ayuda"
}
function setDots (){
    for i in $(find $home)
    do
        relativePathFromHome=$(echo $i | sed "s|^$home||")
        if [[ -d $i ]]; then # si es un directorio
            mkdir -p $HOME$relativePathFromHome

        elif [[ -f $i ]]; then # si es un archivo
            cp $home$relativePathFromHome $HOME$relativePathFromHome
        fi
    done
}
function backDots (){
    argumentoLimpio=$(echo $1 | sed "s|\(.*\)\/|\1|")
    relativePathFromHome=$(echo "$(pwd)/$argumentoLimpio" | sed "s|^$HOME/||")
    makeFolders $argumentoLimpio $relativePathFromHome
    if [[ -d $1 ]]; then # si es un directorio
        full="$(pwd)/$argumentoLimpio/"
        cp $full* $home/$relativePathFromHome
    elif [[ -f $1 ]]; then # si es un archivo
        absolute="$(pwd)/$1"
        cp $absolute $home/$relativePathFromHome
    fi

}
function makeFolders (){
    relativePathFromHome=$(echo "$2")
    echo "haciendo directorios"
    if [[ -d $1 ]]; then # si es un directorio
        echo "$1 es una carpeta"
        mkdir -p $home/$relativePathFromHome
    elif [[ -f $1 ]]; then # si es un archivo
        echo "$1 es un archivo"
        cleanFolderEstructure=$(echo $relativePathFromHome | sed "s|\(.*\)$1|\1|")
        echo $home/$cleanFolderEstructure
        mkdir -p $home/$cleanFolderEstructure
    fi

}
function updateDots (){
    for i in $(find $home)
    do
        if [[ -f $i ]]; then # si es un archivo
            relativePathFromHome=$(echo $i | sed "s|^$home||")
            relativeDirFromHome=$(dirname $relativePathFromHome)
            cp $HOME$relativePathFromHome $home$relativeDirFromHome
        fi
    done

}
if [ "$1" == "-b" ]
then
    echo "Hacer BackUp de los DotFiles a la base de datos"
    backDots "$2"
elif [ "$1" == "-s" ]
then
    echo "Colocar los DotFiles en lugar de destino"
    setDots "$2"
elif [ "$1" == "-u" ]
then
    updateDots
elif [ "$1" == "-h" ] || [ "$1" == "--help" ] || [ "$1" == "" ]
then
    ayuda
else
    ayuda
fi

