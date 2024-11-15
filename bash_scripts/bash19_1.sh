#!/usr/bin/env bash

release_file=/etc/os-release

if grep -q "Arch" $release_file
then
    #the host is based on Arch, run the pacman update command
    sudo pacman -Syu
fi

if grep -q "Ubuntu" $release_file
then
    # The host is based on Debian or Ubuntu,
    # Run the apt version of the command
    sudo apt update
    sudo apt dist-upgrade
fi
