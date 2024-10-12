#!/bin/bash
. ./instance_helpers/colors.sh

main(){
        
    step1_option=$(pretty_read "
        ctrl+c or type ${Red}quit${Color_Off} to exit\n
        1 - Install system dependencies\n
        2 - Create system users\n
        3 - Create/Update instance\n
        Select an option:  ")

    if [ "$step1_option" = "" ]; then
        echo "must select an option"
    fi


    if [ "$step1_option" = "quit" ]; then
        echo "Good bye"
        exit 1
    fi


    case "$step1_option" in
    "1") 
        clear
        . ./DAACS-system-install.sh

    ;;

    "2") 
        clear
        . ./create_system_instance_users.sh

    ;;

    "3") 
        clear
        . ./create_daacs_instance.sh

    ;;

    *)
        echo "Invalid option"
        main

    ;;
    esac
}

main