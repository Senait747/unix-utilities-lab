#!/bin/bash

# Task 7: Employee Salary Classifier

read -p "Enter salary: " salary

if ! [[ "$salary" =~ ^[0-9]+$ ]]; then
    echo "Error: Non-numeric value" >&2
    exit 1
elif [ $salary -lt 60000 ]; then
    echo "Entry Level"
elif [ $salary -le 89999 ]; then
    echo "Mid Level"
elif [ $salary -le 119999 ]; then
    echo "Senior Level"
else
    echo "Executive Level"
fi
