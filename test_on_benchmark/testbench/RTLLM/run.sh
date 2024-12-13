#!/bin/bash

declare -A result_dic=(
    [accu]='{"syntax_success": 0, "func_success": 0}'
    [adder_8bit]='{"syntax_success": 0, "func_success": 0}'
    [adder_16bit]='{"syntax_success": 0, "func_success": 0}'
    [adder_32bit]='{"syntax_success": 0, "func_success": 0}'
    [adder_pipe_64bit]='{"syntax_success": 0, "func_success": 0}'
    [asyn_fifo]='{"syntax_success": 0, "func_success": 0}'
    [calendar]='{"syntax_success": 0, "func_success": 0}'
    [counter_12]='{"syntax_success": 0, "func_success": 0}'
    [edge_detect]='{"syntax_success": 0, "func_success": 0}'
    [freq_div]='{"syntax_success": 0, "func_success": 0}'
    [fsm]='{"syntax_success": 0, "func_success": 0}'
    [JC_counter]='{"syntax_success": 0, "func_success": 0}'
    [multi_16bit]='{"syntax_success": 0, "func_success": 0}'
    [multi_booth_8bit]='{"syntax_success": 0, "func_success": 0}'
    [multi_pipe_4bit]='{"syntax_success": 0, "func_success": 0}'
    [multi_pipe_8bit]='{"syntax_success": 0, "func_success": 0}'
    [parallel2serial]='{"syntax_success": 0, "func_success": 0}'
    [pe]='{"syntax_success": 0, "func_success": 0}'
    [pulse_detect]='{"syntax_success": 0, "func_success": 0}'
    [radix2_div]='{"syntax_success": 0, "func_success": 0}'
    [RAM]='{"syntax_success": 0, "func_success": 0}'
    [right_shifter]='{"syntax_success": 0, "func_success": 0}'
    [serial2parallel]='{"syntax_success": 0, "func_success": 0}'
    [signal_generator]='{"syntax_success": 0, "func_success": 0}'
    [synchronizer]='{"syntax_success": 0, "func_success": 0}'
    [alu]='{"syntax_success": 0, "func_success": 0}'
    [div_16bit]='{"syntax_success": 0, "func_success": 0}'
    [traffic_light]='{"syntax_success": 0, "func_success": 0}'
    [width_8to16]='{"syntax_success": 0, "func_success": 0}'
)

# Function to increment syntax_success for a specific design
increment_syntax_success() {
    local design="$1"
    
    # Increment the syntax_success value in the JSON string for the specified design
    result_dic["$design"]=$(echo "${result_dic[$design]}" | jq '.syntax_success += 1')
}

# Function to increment func_success for a specific design
increment_func_success() {
    local design="$1"
    
    # Increment the func_success value in the JSON string for the specified design
    result_dic["$design"]=$(echo "${result_dic[$design]}" | jq '.func_success += 1')
}

my_comb() {
    local n=$1
    local k=$2
    local result=1
    local i

    if [ $k -lt 0 ] || [ $k -gt $n ]; then
        echo 0
        return
    fi

    for ((i = 1; i <= k; i++)); do
        result=$((result * (n - i + 1) / i))
    done

    echo $result
}

exec_shell() {
    local cmd_str="$1"
    local timeout=8
    local start_time=$(date +%s)
    eval "$cmd_str" &
    local t=$!
    while true; do
        local now=$(date +%s)
        if ((now - start_time >= timeout)); then
            if ! ps -p "$t" > /dev/null; then
                return 1
            else
                return 0
            fi
        fi
        if ! ps -p "$t" > /dev/null; then
            return 1
        fi
        sleep 1
    done
}

print_result_dic() {
    for design in "${!result_dic[@]}"; do
        echo "$design: ${result_dic[$design]}"
    done
}

cal_atk() {
    local n="$1"
    local k="$2"

    # syntax
    local sum_list=()
    for design in "${!result_dic[@]}"; do
        local c=$(echo "${result_dic[$design]}" | jq -r '.syntax_success')
        echo "c1: $c"
        local n_sub_c=$((n - c))
        local comb_n_sub_c_k=$(my_comb $n_sub_c $k)
        local comb_n_k=$(my_comb $n $k)
        sum_list+=(1 - $(echo "scale=4; $comb_n_sub_c_k / $comb_n_k" | bc))
        #sum_list+=(1 - $(my_comb $((n - c)) $k) / $(my_comb $n $k))
    done
    sum_list+=(0)
    local total=0
    for val in "${sum_list[@]}"; do
        echo "val1: $val"
        total=$(echo "$total + $val" | bc)
    done
    local len_list=${#sum_list[@]}
    local syntax_passk=$(echo "scale=4; $total / $len_list" | bc)

    # func
    sum_list=()
    for design in "${!result_dic[@]}"; do
        c=$(echo "${result_dic[$design]}" | jq -r '.func_success')
        echo "c2: $c"
        sum_list+=(1 - $(my_comb $((n - c)) $k) / $(my_comb $n $k))
    done
    sum_list+=(0)
    total=0
    for val in "${sum_list[@]}"; do
        echo "val2: $val"
        total=$(echo "$total + $val" | bc)
    done
    len_list=${#sum_list[@]}
    local func_passk=$(echo "scale=4; $total / $len_list" | bc)

    echo "syntax pass@${k}: ${syntax_passk},   func pass@${k}: ${func_passk}"
}

test_one_file() {
    local testfile="$1"
    # local result_dic="$2"

    for design in "${design_name[@]}"; do
        if [[ -f "${design}/makefile" ]]; then
            local makefile_path="${design}/makefile"
            local makefile_content=$(<"$makefile_path")
            local modified_makefile_content="${makefile_content//\$\{TEST_DESIGN\}/${path}\/${testfile}\/${design}}"
            echo -e "$modified_makefile_content" > "$makefile_path"

            # Run 'make vcs' in the design folder
            pushd "$design" > /dev/null
            make clean
            make vcs
            # Check if the simv file is generated
            if [[ -f "simv" ]]; then
                (increment_syntax_success "$design")
                echo $result_dic["$design"]
                # Run 'make sim' and check the result
                exec_shell "make sim > output.txt"
                if [[ -f "output.txt" ]]; then
                    # Read the contents of output.txt into a variable called output
                    output=$(cat output.txt)

                    # Check if "Pass" or "pass" exists in the output (case-insensitive)
                    if echo "$output" | grep -iq "pass"; then
                        (increment_func_success "$design")
                        echo $result_dic["$design"]
                    fi
                fi
            fi

            echo -e "$makefile_content" > "makefile"
            popd > /dev/null
            progress_bar=$((progress_bar + 1))
        fi
    done

    echo "${testfile} done"
    #echo "$result_dic"
}

progress_bar=0
design_name=("accu" "adder_8bit" "adder_16bit" "adder_32bit" "adder_pipe_64bit" "asyn_fifo" "calendar" "counter_12" "edge_detect"
             "freq_div" "fsm" "JC_counter" "multi_16bit" "multi_booth_8bit" "multi_pipe_4bit" "multi_pipe_8bit" "parallel2serial" "pe" "pulse_detect"
             "radix2_div" "RAM" "right_shifter" "serial2parallel" "signal_generator" "synchronizer" "alu" "div_16bit" "traffic_light" "width_8to16")
path="/data/YYY/RTLLM/mix_tmp0.2"

file_id=1
n=0

test_one_file "test_${file_id}"
((n++))
((file_id++))
# while [[ -d "${path}/test_${file_id}" ]]; do
#     test_one_file "test_${file_id}"
#     ((n++))
#     ((file_id++))
# done


# for item in "${design_name[@]}"; do
#     echo "$item: ${result_dic[$item]},"
# done

# cal_atk "$n" 1
# print_result_dic

# total_syntax_success=0
# total_func_success=0
# for item in "${design_name[@]}"; do
#     syntax_success=$(echo "${result_dic[$item]}" | jq -r '.syntax_success')
#     if ((syntax_success != 0)); then
#         ((total_syntax_success++))
#     fi
#     func_success=$(echo "${result_dic[$item]}" | jq -r '.func_success')
#     if ((func_success != 0)); then
#         ((total_func_success++))
#     fi
# done

# echo "${total_syntax_success}/${#design_name[@]}"
# echo "${total_func_success}/${#design_name[@]}"
