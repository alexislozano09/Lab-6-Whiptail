#!/bin/bash

while true; do
    whiptail --yesno "Proceed?" 8 40 || exit
    TOOL=$(whiptail --menu "Select tool" 12 40 2 awk "Use awk" grep "Use grep" 3>&1 1>&2 2>&3) || continue
    FILE=$(whiptail --menu "Select file" 12 40 2 fruits.csv "Fruits" vegetables.csv "Vegetables" 3>&1 1>&2 2>&3) || continue
    
    if [ "$TOOL" = "awk" ]; then
        RESULT=$(awk -F, '{print $2}' "$FILE")
    else
        RESULT=$(grep 'e' "$FILE")
    fi
    
    whiptail --msgbox "Result:\n$RESULT" 15 60

done
