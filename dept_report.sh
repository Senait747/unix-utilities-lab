#!/bin/bash

# Task 8: Department Report Generator

departments=("Engineering" "Marketing" "Finance" "HR")

for dept in "${departments[@]}"; do
    echo "=== $dept ==="
    
    awk -F',' -v d="$dept" '
        NR > 1 && $4 == d {
            print $2 " " $3 " - $" $6
        }
    ' employees.csv
    
    count=$(awk -F',' -v d="$dept" 'NR > 1 && $4 == d {count++} END {print count+0}' employees.csv)
    echo "Total employees: $count"
    echo "---"
    echo ""
done
