# Menu for Webserver
while :
do
    echo -e "      ${BRed}[WEBSERVER BREED]${enda}"
    echo -e "      ${BRed}Select an Option${enda}"
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
        a) about_script ;;
        q) quit_script;;
    esac

    function about_script {

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
        read -r breed
    }

    function quit_script {
        echo
        sleep 1
        exit
    }
    done
}
