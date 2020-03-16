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
   echo -e "             \e[101m\e[1;37m  ❀  O R C H I D  ❀ \e[0m\n"
echo -e "\e[101m\e[1;37m| [!]  | Yet Another Server Management Script | V 0.1.0  |\e[0m\n"
}

function verify_sudo {
    if [[ $(dpkg -s sudo | grep Status) = "Status: install ok installed" ]]; then
        echo "sudo is installed"
    else
        su -c 'apt install sudo'
        echo "sudo won't have any default configurations, do it manually from this point on"
    fi
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
show_banner # && arch_check && verify_sudo && check_git && check wget && sleep 1
