#!/bin/bash

# created by JH Hacker
# This Is A Colorful Banner

# Function to print a colorful banner
main() {
    local message=$1
    local colors=("\033[33m" "\033[34m" "\033[35m" "\033[36m")
    local reset="\033[0m"
    local color_index=0

    for (( i=0; i<${#message}; i++ )); do
        echo -ne "${colors[$color_index]}${message:$i:1}${reset}"
        color_index=$(( (color_index + 1) % ${#colors[@]} ))
    done
    echo
}

# Print the banner
banner(){
banner "########################################"
banner "##                                    ##"
banner "##             IP Lookup              ##"
banner "##                                    ##"
banner "##        Created by JH Hacker        ##"
banner "##                                    ##"
banner "########################################"
}

# Function Called
main
banner
