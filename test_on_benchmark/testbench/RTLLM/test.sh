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

add() {
    increment_syntax_success "accu"
    increment_func_success "accu"
}

add
echo ${result_dic["accu"]}