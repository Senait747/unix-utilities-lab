#!/bin/bash

# Task 9: Data Filter Menu

while true; do
    echo ""
    echo "1) Show all active employees"
    echo "2) Show all inactive employees"
    echo "3) Show employees hired before 2020"
    echo "4) Show highest paid employee"
    echo "5) Exit"
    read -p "Choose option (1-5): " choice
    
    case $choice in
        1)
            echo ""
            echo "Active employees:"
            grep "active" employees.csv | cut -d',' -f2,3,6
            ;;
        2)
            echo ""
            echo "Inactive employees:"
            grep "inactive" employees.csv | cut -d',' -f2,3,6
            ;;
        3)
            echo ""
            echo "Hired before 2020:"
            awk -F',' '$7 ~ /^201[0-9]-/ {print $2,$3", "$7}' employees.csv
            ;;
        4)
            echo ""
            echo "Highest paid employee:"
            sort -t',' -k6 -rn employees.csv | head -1 | cut -d',' -f2,3,6
            ;;
        5)
            echo "Exiting..."
            exit 0
            ;;
        *)
            echo "Invalid option. Please try again."
            ;;
    esac
done
