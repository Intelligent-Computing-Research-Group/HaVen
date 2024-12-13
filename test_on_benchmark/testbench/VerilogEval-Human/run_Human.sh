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
)
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
            local simv_generated=$?

            if ((simv_generated == 0)); then
                (increment_syntax_success "$design")
                # Run 'make sim' and check the result
                exec_shell "make sim > output.txt"
                local to_flag=$?
                if ((to_flag == 1)); then
                    local output=$(<output.txt)
                    if [[ "$output" == *"Pass"* || "$output" == *"pass"* ]]; then
                        (increment_func_success "$design")
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
design_name=("ece241_2013_q8" "reduction" "circuit5" "gshare" "m2014_q4k" "always_case2" "circuit8" "count15" "2014_q4a" "ringer" "vector4" "fsm3onehot" "m2014_q4d" "m2014_q6c" "dff8p" "lfsr32" "alwaysblock2" "mux256to1" "2012_q2b" "mt2015_q4" "hadd" "fsm2" "review2015_fsmonehot" "circuit1" "vector3" "mt2015_q4b" "m2014_q6b" "m2014_q4a" "ece241_2014_q5b" "bugs_mux2" "vector1" "popcount3" "rotate100" "2014_q3fsm" "circuit2" "rule110" "lemmings4" "fsm_serial" "7420" "mt2015_eq2" "rule90" "circuit3" "mux2to1" "history_shift" "2014_q3bfsm" "popcount255" "m2014_q4c" "kmap1" "fsm2s" "counter_2bc" "m2014_q6" "review2015_shiftcount" "2012_q2fsm" "vectorgates" "andgate" "countbcd" "conwaylife" "count10" "bugs_addsubz" "xnorgate" "wire_decl" "fsm3" "lemmings1" "review2015_fsm" "m2014_q4h" "conditional" "gatesv100" "fsm1s" "count1to10" "ece241_2014_q3" "dff8" "countslow" "2013_q2afsm" "vectorr" "m2014_q4f" "gates100" "truthtable1" "count_clock" "always_nolatches" "7458" "fsm3comb" "mt2015_muxdff" "edgecapture" "fsm_hdlc" "thermostat" "dff8r" "fsm_ps2" "dff16e" "vector0" "ece241_2013_q7" "2014_q3c" "fsm_ps2data" "timer" "ece241_2013_q2" "m2014_q4g" "review2015_count1k" "fsm_onehot" "edgedetect2" "mt2015_q4a" "bugs_case" "gates" "fsm_serialdata" "fsm3s" "m2014_q4i" "shift4" "circuit6" "review2015_fsmseq" "m2014_q4b" "ece241_2013_q12" "ece241_2014_q4" "vector5" "review2015_fancytimer" "mux9to1v" "ece241_2013_q4" "fadd" "norgate" "m2014_q4e" "gates4" "always_casez" "lfsr5" "alwaysblock1" "kmap3" "kmap2" "vector100r" "zero" "step_one" "fsm1" "mux256to1v" "dff8ar" "always_case" "circuit7" "dualedge" "circuit10" "gatesv" "dff" "always_if" "circuit9" "m2014_q4j" "2013_q2bfsm" "wire" "mux2to1v" "m2014_q3" "lemmings3" "review2015_fsmshift" "vector2" "always_if2" "lemmings2" "ece241_2014_q5a" "edgedetect" "2012_q1g" "kmap4" "ece241_2014_q1c" "shift18" "circuit4" "notgate" "wire4")

path="/data/YYY/LLM-verilog/new_verilogeval_result/Human_gt"

file_id="Human"
# n=0
# while [[ -d "${path}/${file_id}" ]]; do
#     test_one_file "${file_id}"
#     ((n++))
# done
test_one_file "Human"

#cal_atk "$n" 1
#print_result_dic

total_syntax_success=0
total_func_success=0
for item in "${design_name[@]}"; do
    syntax_success=$(echo "${result_dic[$item]}" | jq -r '.syntax_success')
    if ((syntax_success != 0)); then
        ((total_syntax_success++))
    fi
    func_success=$(echo "${result_dic[$item]}" | jq -r '.func_success')
    if ((func_success != 0)); then
        ((total_func_success++))
    fi
done

echo "${total_syntax_success}/${#design_name[@]}"
echo "${total_func_success}/${#design_name[@]}"
