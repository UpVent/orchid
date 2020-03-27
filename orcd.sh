#! /usr/bin/env bash

# TODO: Implement this function
function distro_check {
    if type lsb_release >/dev/null 2>&1 ; then
        distro=$(lsb_release -i -s)
    elif [ -e /etc/os-release ] ; then
        distro=$(awk -F= '$1 == "ID" {print $2}' /etc/os-release)
    elif [ -e /etc/some-other-release-file ] ; then
        distro=$(unknown)
fi

    distro=$(printf '%s\n' "$distro" | LC_ALL=C tr '[:upper:]' '[:lower:]')

    # Check if script is running in Funtoo or Debian
    # Otherwise tell this user not to be an idiot and read the README doc.
    case "$distro" in
        debian*)  return 1 ;;
        funtoo*)  return 2 ;;
        ubuntu*)  echo -e "This may or may not work in ubuntu"; return 1 ;;
        *)        echo "unknown distro: '$distro'" ; exit 1 ;;
    esac
}

function arch_check {
    if [[ $(uname -m ) = x86_64 ]]; then
        echo -e "\e[32m[-] multilib is already Enabled!\e[0m"
    else
        echo -e "\e[35m[X] multilib has no guarantee to work here!\e[0m"
    fi
}

# If using "su" convince the user to install ubuntu instead [WIP]

function verify_sudo {

	which sudo > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
	    echo [✔]::[sudo]: installation found!;
    else

        echo [x]::[warning]: Orchid requires sudo ;
        echo ""
        echo [!]::[please wait]: Installing sudo;
        su -c apt install sudo -y
        echosleep 2
        echo "You have to configure sudo manually in order to proceed"
        su -c nano /etc/sudoers
    fi
    sleep 1
}

# Requirements check
function check_git {
    which git > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
	    echo [✔]::[git]: installation found!;
    else

    # Git commit suicide
    echo [x]::[warning]: Orchid requires git;
    echo ""
    echo [!]::[please wait]: Installing git ..  ;

    sudo apt install git -y
    echo ""
fi
    sleep 1
}

# If this isn't present try not to die
function check_wget {
	which wget > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
	    echo [✔]::[wget]: installation found!;
    else

    echo [x]::[warning]: Orchid requires wget ;
    echo ""
    echo [!]::[please wait]: Installing Wget ;
    sudo apt install wget -y
    echosleep 2
    echo ""
fi
    sleep 1
}

[ -L $0 ] && pushd `readlink $0 | xargs dirname` > /dev/null \
    || pushd `dirname $0` > /dev/null
export MPATH=`pwd -P`
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

   usage: orcd



__EOF__

}

use

# Orchid 2020 - VentGrey
