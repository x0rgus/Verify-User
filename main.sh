#!/bin/bash
clear
if test `whoami` != root
then
echo ATENÇÃO
echo Você precisa ser ROOT para executar este programa.
exit 1
fi

RED="\e[1;31m"

GREEN="\e[1;32m"

YELLOW="\e[1;33m"

NC="\e[0m"

 

#echo -e $RED

#echo "teste"

#echo -e $NC

#echo -e "$RED This is red text $NC"

#echo -e "$GREEN This is green text $NC"

#echo -e "$YELLOW This is yellow text $NC"

 

#RETURN CODES 0 = nao 1 = sim 2 = erro

 

function verificar_usuario()

{

    usuario=$1

    while [ -n "$usuario" ]

    do

 

    echo -e "$YELLOW Validando usuario...$NC"

    if [[ $(grep -P (^|\s)\ $usuario (?=\s|$) /etc/passwd) -eq 0 ]]

    then

        echo -e "$RED $usuario e um usuario invalido!$NC"

        RETURN_CODE_CHECK=2

    else

        echo -e "$GREEN $usuario e um usuario valido! $NC"

        RETURN_CODE_CHECK=1

    fi

    return $RETURN_CODE_CHECK

    done

 

 

}

function criar_usuario_inexistente()

{

    if [ $RETURN_CODE_CHECK = 2 ]

    then

        echo "usuario $usuario nao existe! deseja criar agora? 1. sim 2. nao"

        read r

        case $r in

        1)

            echo "Utilizar nome de usuario $input_t ?"

        ;;

        2)

            echo

        ;;

        *)

            echo

        ;;

        esac

    fi

}

echo "##########################"

verificar_usuario debug

echo "return code:$RETURN_CODE_CHECK"

echo "##########################"

echo

 

echo "##########################"

verificar_usuario usuario_falso

echo "return code:$RETURN_CODE_CHECK"

echo "##########################"

echo

echo "digite um nome de usuario:"
read input_t
verificar_usuario $input_t
criar_usuario_inexistente