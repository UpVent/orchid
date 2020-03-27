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

case $1 in
    help) help ;;

    on)
        sudo systemctl start apache2 && sudo systemctl enable apache2 ;;

    *) help;;
esac
# 2020 - VentGrey
