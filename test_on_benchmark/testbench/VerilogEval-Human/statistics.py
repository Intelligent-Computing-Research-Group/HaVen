import os
from scipy.special import comb

def cal_atk(dic_list, n, k):
    #syntax 
    sum_list = []
    for design in dic_list.keys():
        c = dic_list[design]['syntax_success']
        sum_list.append(1 - comb(n - c, k) / comb(n, k))
    #sum_list.append(0)
    syntax_passk = sum(sum_list) / len(sum_list)
    
    #func
    sum_list = []
    for design in dic_list.keys():
        c = dic_list[design]['func_success']
        sum_list.append(1 - comb(n - c, k) / comb(n, k))
    #sum_list.append(0)
    func_passk = sum(sum_list) / len(sum_list)
    print(f'syntax pass@{k}: {syntax_passk},   func pass@{k}: {func_passk}')

def test_one_file(result_dic, design_name):
    for design in design_name:
        if os.path.exists(f"{design}/makefile"):
            os.chdir(design)
            if os.path.exists("simv"):
                result_dic[design]['syntax_success'] += 1

                if os.path.exists("output.txt"):
                    with open("output.txt", "r") as file:
                        output = file.read()
                        if "Pass" in output or "pass" in output or "Total mismatched samples is 0" in output:
                            result_dic[design]['func_success'] += 1
            os.chdir("..")
    return result_dic

def print_RTLLM_result():
    design_name = ['accu', 'adder_8bit', 'adder_16bit', 'adder_32bit', 'adder_pipe_64bit', 'asyn_fifo', 'calendar', 'counter_12', 'edge_detect',
                'freq_div', 'fsm', 'JC_counter', 'multi_16bit', 'multi_booth_8bit', 'multi_pipe_4bit', 'multi_pipe_8bit', 'parallel2serial' , 'pe' , 'pulse_detect', 
                'radix2_div', 'RAM', 'right_shifter',  'serial2parallel', 'signal_generator','synchronizer', 'alu', 'div_16bit', 'traffic_light', 'width_8to16']


    path = "/data/Synopsys/YYY/RTLLMs/chatgpt4/_chatgpt4"
    result_dic = {key: {} for key in design_name}
    for item in design_name:
        result_dic[item]['syntax_success'] = 0
        result_dic[item]['func_success'] = 0

    file_id = 1
    n = 0
    while os.path.exists(os.path.join(path, f"t{file_id}")):
        # if file_id == 5:
        #     break
        result_dic = test_one_file(result_dic, design_name)
        n += 1
        file_id += 1

    cal_atk(result_dic, n, 1)
    total_syntax_success = 0
    total_func_success = 0
    for item in design_name:
        if result_dic[item]['syntax_success'] != 0:
            total_syntax_success += 1
        if result_dic[item]['func_success'] != 0:
            total_func_success += 1
    print(f'total_syntax_success: {total_syntax_success}/{len(design_name)}')
    print(f'total_func_success: {total_func_success}/{len(design_name)}')

def print_verilog_eval_result():
    path = "./"
    design_name = [f for f in os.listdir(path) if os.path.isdir(os.path.join(path, f))]
    result_dic = {key: {} for key in design_name}
    for item in design_name:
        result_dic[item]['syntax_success'] = 0
        result_dic[item]['func_success'] = 0
    result_dic = test_one_file(result_dic, design_name)
    n = 1
    cal_atk(result_dic, n, 1)
    total_syntax_success = 0
    total_func_success = 0
    func_failed = []
    for item in design_name:
        if result_dic[item]['syntax_success'] != 0:
            total_syntax_success += 1
        if result_dic[item]['func_success'] != 0:
            total_func_success += 1
        if result_dic[item]['func_success'] == 0:
            func_failed.append(item)
        # if result_dic[item]['syntax_success'] == 0:
        #     os.makedirs(f"../../failed_verilog_evals/Human", exist_ok=True)
        #     os.system(f"cp ../../new_verilogeval_result/gpt4/Human/{item}.v ../../failed_verilog_evals/Human/")
    print(f'total_syntax_success: {total_syntax_success}/{len(design_name)}')
    print(f'total_func_success: {total_func_success}/{len(design_name)}')
    print(func_failed)

if __name__ == "__main__":
    print_verilog_eval_result()