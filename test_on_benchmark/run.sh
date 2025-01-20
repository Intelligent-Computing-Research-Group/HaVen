#!/bin/bash

declare -A result_dic=(
    [reduction]='{"syntax_success": 0, "func_success": 0}'
    [circuit5]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4k]='{"syntax_success": 0, "func_success": 0}'
    [always_case2]='{"syntax_success": 0, "func_success": 0}'
    [circuit8]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2013_q8]='{"syntax_success": 0, "func_success": 0}'
    [count15]='{"syntax_success": 0, "func_success": 0}'
    [2014_q4a]='{"syntax_success": 0, "func_success": 0}'
    [ringer]='{"syntax_success": 0, "func_success": 0}'
    [vector4]='{"syntax_success": 0, "func_success": 0}'
    [fsm3onehot]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4d]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q6c]='{"syntax_success": 0, "func_success": 0}'
    [dff8p]='{"syntax_success": 0, "func_success": 0}'
    [lfsr32]='{"syntax_success": 0, "func_success": 0}'
    [alwaysblock2]='{"syntax_success": 0, "func_success": 0}'
    [mux256to1]='{"syntax_success": 0, "func_success": 0}'
    [2012_q2b]='{"syntax_success": 0, "func_success": 0}'
    [mt2015_q4]='{"syntax_success": 0, "func_success": 0}'
    [hadd]='{"syntax_success": 0, "func_success": 0}'
    [fsm2]='{"syntax_success": 0, "func_success": 0}'
    [review2015_fsmonehot]='{"syntax_success": 0, "func_success": 0}'
    [circuit1]='{"syntax_success": 0, "func_success": 0}'
    [vector3]='{"syntax_success": 0, "func_success": 0}'
    [mt2015_q4b]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q6b]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4a]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2014_q5b]='{"syntax_success": 0, "func_success": 0}'
    [bugs_mux2]='{"syntax_success": 0, "func_success": 0}'
    [vector1]='{"syntax_success": 0, "func_success": 0}'
    [popcount3]='{"syntax_success": 0, "func_success": 0}'
    [rotate100]='{"syntax_success": 0, "func_success": 0}'
    [2014_q3fsm]='{"syntax_success": 0, "func_success": 0}'
    [circuit2]='{"syntax_success": 0, "func_success": 0}'
    [rule110]='{"syntax_success": 0, "func_success": 0}'
    [7420]='{"syntax_success": 0, "func_success": 0}'
    [mt2015_eq2]='{"syntax_success": 0, "func_success": 0}'
    [rule90]='{"syntax_success": 0, "func_success": 0}'
    [circuit3]='{"syntax_success": 0, "func_success": 0}'
    [mux2to1]='{"syntax_success": 0, "func_success": 0}'
    [history_shift]='{"syntax_success": 0, "func_success": 0}'
    [2014_q3bfsm]='{"syntax_success": 0, "func_success": 0}'
    [popcount255]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4c]='{"syntax_success": 0, "func_success": 0}'
    [kmap1]='{"syntax_success": 0, "func_success": 0}'
    [fsm2s]='{"syntax_success": 0, "func_success": 0}'
    [counter_2bc]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q6]='{"syntax_success": 0, "func_success": 0}'
    [review2015_shiftcount]='{"syntax_success": 0, "func_success": 0}'
    [2012_q2fsm]='{"syntax_success": 0, "func_success": 0}'
    [vectorgates]='{"syntax_success": 0, "func_success": 0}'
    [andgate]='{"syntax_success": 0, "func_success": 0}'
    [count10]='{"syntax_success": 0, "func_success": 0}'
    [bugs_addsubz]='{"syntax_success": 0, "func_success": 0}'
    [xnorgate]='{"syntax_success": 0, "func_success": 0}'
    [wire_decl]='{"syntax_success": 0, "func_success": 0}'
    [fsm3]='{"syntax_success": 0, "func_success": 0}'
    [lemmings1]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4h]='{"syntax_success": 0, "func_success": 0}'
    [conditional]='{"syntax_success": 0, "func_success": 0}'
    [gatesv100]='{"syntax_success": 0, "func_success": 0}'
    [fsm1s]='{"syntax_success": 0, "func_success": 0}'
    [count1to10]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2014_q3]='{"syntax_success": 0, "func_success": 0}'
    [dff8]='{"syntax_success": 0, "func_success": 0}'
    [countslow]='{"syntax_success": 0, "func_success": 0}'
    [2013_q2afsm]='{"syntax_success": 0, "func_success": 0}'
    [vectorr]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4f]='{"syntax_success": 0, "func_success": 0}'
    [gates100]='{"syntax_success": 0, "func_success": 0}'
    [truthtable1]='{"syntax_success": 0, "func_success": 0}'
    [always_nolatches]='{"syntax_success": 0, "func_success": 0}'
    [7458]='{"syntax_success": 0, "func_success": 0}'
    [fsm3comb]='{"syntax_success": 0, "func_success": 0}'
    [mt2015_muxdff]='{"syntax_success": 0, "func_success": 0}'
    [edgecapture]='{"syntax_success": 0, "func_success": 0}'
    [thermostat]='{"syntax_success": 0, "func_success": 0}'
    [dff8r]='{"syntax_success": 0, "func_success": 0}'
    [fsm_ps2]='{"syntax_success": 0, "func_success": 0}'
    [dff16e]='{"syntax_success": 0, "func_success": 0}'
    [vector0]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2013_q7]='{"syntax_success": 0, "func_success": 0}'
    [2014_q3c]='{"syntax_success": 0, "func_success": 0}'
    [fsm_ps2data]='{"syntax_success": 0, "func_success": 0}'
    [timer]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2013_q2]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4g]='{"syntax_success": 0, "func_success": 0}'
    [review2015_count1k]='{"syntax_success": 0, "func_success": 0}'
    [fsm_onehot]='{"syntax_success": 0, "func_success": 0}'
    [edgedetect2]='{"syntax_success": 0, "func_success": 0}'
    [mt2015_q4a]='{"syntax_success": 0, "func_success": 0}'
    [bugs_case]='{"syntax_success": 0, "func_success": 0}'
    [gates]='{"syntax_success": 0, "func_success": 0}'
    [fsm3s]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4i]='{"syntax_success": 0, "func_success": 0}'
    [shift4]='{"syntax_success": 0, "func_success": 0}'
    [circuit6]='{"syntax_success": 0, "func_success": 0}'
    [review2015_fsmseq]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4b]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2013_q12]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2014_q4]='{"syntax_success": 0, "func_success": 0}'
    [vector5]='{"syntax_success": 0, "func_success": 0}'
    [mux9to1v]='{"syntax_success": 0, "func_success": 0}'
    [fadd]='{"syntax_success": 0, "func_success": 0}'
    [norgate]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4e]='{"syntax_success": 0, "func_success": 0}'
    [gates4]='{"syntax_success": 0, "func_success": 0}'
    [always_casez]='{"syntax_success": 0, "func_success": 0}'
    [lfsr5]='{"syntax_success": 0, "func_success": 0}'
    [alwaysblock1]='{"syntax_success": 0, "func_success": 0}'
    [kmap3]='{"syntax_success": 0, "func_success": 0}'
    [kmap2]='{"syntax_success": 0, "func_success": 0}'
    [vector100r]='{"syntax_success": 0, "func_success": 0}'
    [zero]='{"syntax_success": 0, "func_success": 0}'
    [step_one]='{"syntax_success": 0, "func_success": 0}'
    [fsm1]='{"syntax_success": 0, "func_success": 0}'
    [mux256to1v]='{"syntax_success": 0, "func_success": 0}'
    [dff8ar]='{"syntax_success": 0, "func_success": 0}'
    [always_case]='{"syntax_success": 0, "func_success": 0}'
    [circuit7]='{"syntax_success": 0, "func_success": 0}'
    [dualedge]='{"syntax_success": 0, "func_success": 0}'
    [circuit10]='{"syntax_success": 0, "func_success": 0}'
    [gatesv]='{"syntax_success": 0, "func_success": 0}'
    [dff]='{"syntax_success": 0, "func_success": 0}'
    [always_if]='{"syntax_success": 0, "func_success": 0}'
    [circuit9]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q4j]='{"syntax_success": 0, "func_success": 0}'
    [2013_q2bfsm]='{"syntax_success": 0, "func_success": 0}'
    [wire]='{"syntax_success": 0, "func_success": 0}'
    [mux2to1v]='{"syntax_success": 0, "func_success": 0}'
    [m2014_q3]='{"syntax_success": 0, "func_success": 0}'
    [review2015_fsmshift]='{"syntax_success": 0, "func_success": 0}'
    [vector2]='{"syntax_success": 0, "func_success": 0}'
    [always_if2]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2014_q5a]='{"syntax_success": 0, "func_success": 0}'
    [edgedetect]='{"syntax_success": 0, "func_success": 0}'
    [2012_q1g]='{"syntax_success": 0, "func_success": 0}'
    [kmap4]='{"syntax_success": 0, "func_success": 0}'
    [ece241_2014_q1c]='{"syntax_success": 0, "func_success": 0}'
    [shift18]='{"syntax_success": 0, "func_success": 0}'
    [circuit4]='{"syntax_success": 0, "func_success": 0}'
    [notgate]='{"syntax_success": 0, "func_success": 0}'
    [wire4]='{"syntax_success": 0, "func_success": 0}'
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

# Function to calculate binomial coefficient
binomial() {
    local n=$1
    local k=$2
    if [ $k -gt $n ]; then
        echo 0
        return
    fi
    local result=1
    for ((i = 1; i <= k; i++)); do
        result=$((result * (n - i + 1) / i))
    done
    echo $result
}

# Function to calculate pass@k
calculate_pass_at_k() {
    local n=$1  # number of samples/attempts
    local k=$2  # k in pass@k
    local total_problems=${#design_name[@]}
    local syntax_pass_sum=0
    local func_pass_sum=0

    # Calculate for each problem
    for item in "${design_name[@]}"; do
        local syntax_success=$(echo "${filtered_dic[$item]}" | jq -r '.syntax_success')
        local func_success=$(echo "${filtered_dic[$item]}" | jq -r '.func_success')
        
        # Calculate for syntax success
        if [ $syntax_success -gt 0 ]; then
            local c=$syntax_success
            if [ $c -gt $n ]; then
                c=$n
            fi
            local n_minus_c=$((n - c))
            local binom_n_minus_c_k=$(binomial $n_minus_c $k)
            local binom_n_k=$(binomial $n $k)
            if [ $binom_n_k -ne 0 ]; then
                local pass_prob=$(bc -l <<< "scale=4; 1 - $binom_n_minus_c_k / $binom_n_k")
                syntax_pass_sum=$(bc -l <<< "scale=4; $syntax_pass_sum + $pass_prob")
            fi
        fi
        
        # Calculate for functional success
        if [ $func_success -gt 0 ]; then
            local c=$func_success
            if [ $c -gt $n ]; then
                c=$n
            fi
            local n_minus_c=$((n - c))
            local binom_n_minus_c_k=$(binomial $n_minus_c $k)
            local binom_n_k=$(binomial $n $k)
            if [ $binom_n_k -ne 0 ]; then
                local pass_prob=$(bc -l <<< "scale=4; 1 - $binom_n_minus_c_k / $binom_n_k")
                func_pass_sum=$(bc -l <<< "scale=4; $func_pass_sum + $pass_prob")
            fi
        fi
    done

    # Calculate average
    local syntax_pass_at_k=$(bc -l <<< "scale=4; ($syntax_pass_sum / $total_problems) * 100")
    local func_pass_at_k=$(bc -l <<< "scale=4; ($func_pass_sum / $total_problems) * 100")
    
    echo "pass@$k:"
    echo "  Syntax: $syntax_pass_at_k%"
    echo "  Functionality: $func_pass_at_k%"
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

test_one_file() {
    local testfile="$1"
    local benchmark_name="$2"
    success_keywords=("Passed" "passed" "Total mismatched samples is 0")

    for design in "${design_name[@]}"; do
        if [[ -f "testbench/${benchmark_name}/${design}/makefile" ]]; then
            local makefile_path="testbench/${benchmark_name}/${design}/makefile"
            local makefile_content=$(<"$makefile_path")
            local modified_makefile_content="${makefile_content//\$\{TEST_DESIGN\}/${path}\/${testfile}\/${design}}"
            echo -e "$modified_makefile_content" > "$makefile_path"

            # Run 'make vcs' in the design folder
            pushd "testbench/${benchmark_name}" > /dev/null
            pushd "$design" > /dev/null
            make clean
            make vcs
            # Check if the simv file is generated
            if [[ -f "simv" ]]; then
                current_value=${filtered_dic["$design"]}
                updated_syntax=$(echo "$current_value" | jq '.syntax_success += 1')
                filtered_dic["$design"]=$updated_syntax
                # Run 'make sim' and check the result
                exec_shell "make sim > output.txt"
                if [[ -f "output.txt" ]]; then
                    while IFS= read -r line; do
                    for keyword in "${success_keywords[@]}"; do
                        if [[ "$line" == *"$keyword"* ]]; then
                            current_value=${filtered_dic["$design"]}
                            updated_func=$(echo "$current_value" | jq '.func_success += 1')
                            filtered_dic["$design"]=$updated_func
                            break 2
                        fi
                    done
                    done < "output.txt"
                fi
            fi

            echo -e "$makefile_content" > "makefile"
            popd > /dev/null
            popd > /dev/null
            progress_bar=$((progress_bar + 1))
        fi
    done

    echo "${testfile} done"
}


# File containing the tasks
TASK_FILE="tasks_verilogeval_RTLLM.txt" # TODO

# Check if the file exists
if [[ ! -f $TASK_FILE ]]; then
    echo "Error: Task file '$TASK_FILE' not found!"
    exit 1
fi

# Read tasks from the file into an array
mapfile -t design_name < "$TASK_FILE"

for task in "${design_name[@]}"; do
    echo "  - $task"
done

# Declare a new dictionary for the filtered results
declare -A filtered_dic

# Loop through the desired keys and copy matching entries
for task in "${design_name[@]}"; do
    if [[ -v result_dic["$task"] ]]; then
        filtered_dic["$task"]="${result_dic["$task"]}"
    fi
done

# Print the filtered dictionary
for key in "${!filtered_dic[@]}"; do
    echo "[$key]=${filtered_dic[$key]}"
done

path="/data/YYY/LLM-verilog/rtllm_result" # TODO

benchmark_name="RTLLM" # TODO
file_id=1
n=0

files_to_run=5 # TODO

# three arguments are file of code to test, benchmark name, and filtered_dic
while ((n < files_to_run)); do
    test_one_file "test_${file_id}" "${benchmark_name}"
    ((n++))
    ((file_id++))
done

total_syntax_success=0
total_func_success=0
for item in "${design_name[@]}"; do
    syntax_success=$(echo "${filtered_dic[$item]}" | jq -r '.syntax_success')
    if ((syntax_success != 0)); then
        ((total_syntax_success++))
    fi
    func_success=$(echo "${filtered_dic[$item]}" | jq -r '.func_success')
    if ((func_success != 0)); then
        ((total_func_success++))
    fi
done

echo "${total_syntax_success}/${#design_name[@]}"
echo "${total_func_success}/${#design_name[@]}"

for item in "${design_name[@]}"; do
    echo "$item: ${filtered_dic[$item]}" # to calculate pass@k
done

echo "Calculating pass@k metrics..."
echo "------------------------"
if [ $files_to_run -ge 1 ]; then
    calculate_pass_at_k $files_to_run 1
fi
if [ $files_to_run -ge 5 ]; then
    calculate_pass_at_k $files_to_run 5
fi