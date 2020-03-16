#! /usr/bin/env bash

# Variables
# Colors
Black='\e[0;30m'        # Black
Red='\e[0;31m'          # Red
Green='\e[0;32m'        # Green
Yellow='\e[0;33m'       # Yellow
Blue='\e[0;34m'         # Blue
Purple='\e[0;35m'       # Purple
Cyan='\e[0;36m'         # Cyan
White='\e[0;37m'        # White

# Bold
BBlack='\e[1;30m'       # Black
BRed='\e[1;31m'         # Red
BGreen='\e[1;32m'       # Green
BYellow='\e[1;33m'      # Yellow
BBlue='\e[1;34m'        # Blue
BPurple='\e[1;35m'      # Purple
BCyan='\e[1;36m'        # Cyan
BWhite='\e[1;37m'       # White

# Default
DefaultColor='\e[39m'   # Default foreground color

b='\033[1m'
u='\033[4m'
bl='\E[30m'
r='\E[31m'
g='\E[32m'
y='\E[33m'
bu='\E[34m'
m='\E[35m'
c='\E[36m'
w='\E[37m'
endc='\E[0m'
enda='\033[0m'

function arch_check {
    if [[ $(uname -m ) = x86_64 ]]; then
        echo -e "\e[32m[-] multilib is already Enabled!\e[0m"
    else
        echo -e "\e[35m[X] multilib has no guarantee to work here!\e[0m"
    fi
}

function show_banner {
    # Thou shall be called "Orchid", like the first Opeth Album!
   echo -e "             \e[101m\e[1;37m  ❀  O R C H I D  ❀ \e[0m\n"
   echo -e "\e[101m\e[1;37m| [!]  | Yet Another Server Management Script | V 0.1.0  |\e[0m\n"
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


# Init script
# Just fucking call all the functions at once
show_banner # && arch_check && verify_sudo && check_git && check_wget && sleep 1
clear


# Menu to call different scripts
while :
do
    echo -e "      ${BRed}[ORCHID MENU]${enda}"
    echo -e "      ${BRed}Select an Orchid breed${enda}"
    # Print a Pretty menu here
    echo -e "

    [1] - Webserver Breed
    [2] - Database Breed
    [3] - Dev Lang Breed
    [4] - DevOps Breed


        [a] - about this script   [q] - quit
    "

    echo

    echo -en "Select a Breed: "
    read -r breed

    case $breed in

        # Down menu Options
        1) breeds/web-servers/mainwebservers.sh;;
        2) breeds/databases/maindb.sh;;
        3) breeds/dev-lang/mainlang.sh;;
        4) breeds/dev-ops/maindevops.sh;;
        a) about ;;
    esac

    function about {

        release=`( lsb_release -ds || cat /etc/*release || uname -om ) 2>/dev/null | head -n1`

        clear
        echo "+--------- O R C H I D -----------------+
          | A simple script for server management |
          |---------------------------------------|
          | OS:       ${release}          |
          | Version:            ALPHA             |
          +---------------------------------------+

          ${Red}About${enda}

          Orchid is a personal script I made for managing servers without
          overcomplicating stuff like making new dir structures for apache,
          managing systemd services, adding, removing, restricting and other
          helpful server administration things made simpler using a CLI.
"

        echo && echo -en "${Yellow}Press Enter to return to the main menu${endc}"
        read -r input
    }


    done
