#! /usr/bin/env bash

function help {
    cat <<__EOF__

    usage: orcd apache [ on | off | restart | debug | new [URL] | del [URL] ]

    on: Turns on the apache webserver
    off: Turns off the apache webserver
    restart: Restarts the server gracefully
    debug: Use systemd to debug the apache service
    new: Writes a new virtual host under /etc/apache2/sites-available/
    del: Deletes a virtual host under /etc/apache2/sites-available/

__EOF__
}

function check_requirements {
    which apache2 > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
        # Duh
	    echo "[✔]::[apache2]: is installed!";
    else
        # Simple messages in case I turn into a moron someday
        echo "[x]::[warning]: Apache Breed requires apache!" ;
        echo "._. were you planning to use this without apache? wtf"
        echo "[!]::[please wait]: Installing apache for you..." ;
        sudo apt install apache2 -y
        echosleep 2
        echo ""
        clear
    fi
}

case $1 in
    help) help ;;

    on)
        # Just in case, "no vaya a ser"
        check_requirements;
        sudo systemctl start apache2 && sudo systemctl enable apache2 ;;

    *) help;;
esac
# 2020 - VentGrey
