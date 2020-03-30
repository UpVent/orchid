#! /usr/bin/env bash

function help {
    cat << __EOF__

    usage: storage ls | status <device> | fs |
                         unplug | check | repair <device> | help

    Commands:

    ls: lists all available disks
    status: shows information about the consulted device (eg: /dev/sdx)
    fs: lists all available filesystems
    unplug: unmounts ALL volumes [potentially dangerous]
    check: Check & Verify all disks available
    repair: Repairs a given volume (eg: /dev/sdx)
    help: show this message

__EOF__
}

function check_requirements {
    which smartctl > /dev/null 2>&1
	if [ "$?" -eq "0" ]; then
        # Duh
	    echo "[✔]::[smartmontools]: is installed!";
    else
        # Simple messages in case I turn into a moron someday
        echo "[x]::[warning]: Disks Breed requires smartmontools!" ;
        echo "[!]::[please wait]: Installing smartmontools for you..." ;
        sudo apt install smartmontools -y
        echosleep 2
        echo ""
        clear
    fi
}

function list {
    if [ -z "${1}" ]; then
        lsblk
    else
        lsblk "${1}"
    fi
}

function status {
    [ -z "${1}" ] && help && exit 1
    fdisk "${1}"
}

function filesys {
    mount | column -t
}

function unplug {
    read -p -r "This may cause data loss are you sure? Y/n" -n 1
    echo
    if [[ $REPLY =~ ^[Yy]$ ]]
    then
        sudo umount -a
    else
        echo "Invalid response, terminating for security reasons"
        exit 1
    fi
}

function check {
    check_requirements


    mount | grep "/dev/sd" | awk '{print $1}' | while read -r partition
    do
        echo "${partition:0:8}"
    done | sort | uniq | while read -r disk
    do
        #All sdX disks are parsed here using the $disk variable
        echo "Disk : $disk"
        #Insert your smartctl commands here e.g:
        sudo smartctl --smart=on --offlineauto=on --saveauto=on $disk
    done
}

function repair {
    sudo umount "$1"
    sudo fsck -y  "$1"
}

case $1 in
    help)  help ;;
    ls) shift list ;;
    status) shift status ;;
    fs) shift filesys ;;
    unplug) shift unplug ;;
    check) shift check ;;
    repair) shift repair "$@";;
    *) help ;;

esac

# 2020 - VentGrey
