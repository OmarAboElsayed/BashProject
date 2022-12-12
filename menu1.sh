#!/bin/bash

# Color variables
export red='\033[0;31m'
export green='\033[0;32m'
export yellow='\033[0;33m'
export blue='\033[0;34m'
export magenta='\033[0;35m'
export Purple='\033[0;35m'
export Cyan='\033[0;36m' 
export IsNumber='^[0-9]+$'

# Examples
echo -e "${magenta}........ Project Engine Database Bash Script ............\n"
echo -e "${magenta}.......... Omar Mohamed & Mohamed Tharwat .......\n"
echo -e "${magenta}                  Welcome to Database                      \n"
echo -e "${blue}"
PS3="Please Enter your Options: "

options=("Create Database" "List Database" "Drop Database" "Connect to Database" "Exit" )

select i in "${options[@]}"
do 
    case $REPLY in 
        1) ./createDB.sh;;
        2)  echo -e "${green}" 
            ls ./db
            echo -e "${blue}" 
                        ;;
                    3) ./DropDB.sh;;
        4) ./connectDB.sh ;;
        5) break ;;
                                                                                                                                                                                             
        *)   echo -e "${red}invalid option $REPLY Click Enter"
             echo -e "${blue}"
             ;;
             
    esac

done
