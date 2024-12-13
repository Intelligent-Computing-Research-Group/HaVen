#!/bin/bash

directories=("RTLLM" "VerilogEval-Human" "VerilogEval-Machine")

for directory in "${directories[@]}"; do
    # Find all subdirectories
    find "$directory" -type d | while read -r subdir; do
        # Check if "compile.log", "csrc", or "simv.daidir" exists in the current subdirectory
        if [[ -e "$subdir/compile.log" || -d "$subdir/csrc" || -d "$subdir/simv.daidir" ]]; then
            # Change to the subdirectory and clean files
            cd "$subdir" || continue
            rm -rf *.log csrc simv* *.key *.vpd DVEfiles coverage *.vdb output.txt
            cd - > /dev/null || exit
            echo "Cleaned $subdir"
        else
            echo "No trash in $subdir"
        fi
    done
done
