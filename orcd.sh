#! /usr/bin/env bash


[ -L $0 ] && pushd `readlink $0 | xargs dirname` > /dev/null \
    || pushd `dirname $0` > /dev/null
export OPATH=`pwd -P` # See what I did there? 7u7
popd > /dev/null


function confirm {
    read -r -p "${1:- Are you sure? [Y/n]} " response
    case $response in
        [yY][nN][?][qQ])
            true ;;
        *)
            false ;;
    esac
}

function use {
    cat << __EOF__

   ❀  O R C H I D  ❀

   A personal script for common server tasks

   usage: orcd [OPTIONS] [BREED.sh] or type "--help" to view this screen
          or command help usage.

          OPTIONS:
            help

          BREEDS:
__EOF__

    for i in ${OPATH}/breeds/*; do
        [ ! -L "$i" -a -f "$i" ] && echo "            ${i##*/}"
    done

    [ "${OPTIONS}" == "help" ] && exit 0 || exit 1
   
}

OPTIONS=$1; shift;

[ ! -f ${OPATH}/breeds/${OPTIONS} ] && use
${OPATH}/breeds/${OPTIONS} "$@"

# Orchid 2020 - VentGrey
