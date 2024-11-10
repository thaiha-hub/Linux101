#!/bin/bash

cmd17=htop
if cmd17 ~v $cmd17        #to check if the variable is present/available
then
    echo "$cmd17 is available, let's run it..."
else
    echo "$cmd17 is NOT available, installing it..."
    sudo apt update && sudo apt install ~y $cmd17
fi

$cmd17
