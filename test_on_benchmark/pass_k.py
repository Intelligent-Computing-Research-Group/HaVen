import os
import json
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
    
def jsonline_iter(file_path: str):
    with open(file_path, "r") as f:
        for line in f:
            yield json.loads(line)

def example_to_jsonline(examples: dict, save_file: str):
    with open(save_file, "a") as f:
            f.write(json.dumps(examples) + "\n")
result_dic = {
'accu': {"syntax_success": 0, "func_success": 0},
'adder_8bit': {"syntax_success": 0, "func_success": 0},
'adder_16bit': {"syntax_success": 0, "func_success": 0},
'adder_32bit': {
  "syntax_success": 3,
  "func_success": 0
},
'adder_pipe_64bit': {
  "syntax_success": 2,
  "func_success": 0
},
'asyn_fifo': {
  "syntax_success": 1,
  "func_success": 0
},
'calendar': {
  "syntax_success": 3,
  "func_success": 0
},
'counter_12': {
  "syntax_success": 2,
  "func_success": 2
},
'edge_detect': {
  "syntax_success": 4,
  "func_success": 4
},
'freq_div': {
  "syntax_success": 5,
  "func_success": 0
},
'fsm': {
  "syntax_success": 5,
  "func_success": 0
},
'JC_counter': {
  "syntax_success": 5,
  "func_success": 0
},
'multi_16bit': {
  "syntax_success": 2,
  "func_success": 2
},
'multi_booth_8bit': {
  "syntax_success": 3,
  "func_success": 1
},
'multi_pipe_4bit': {
  "syntax_success": 3,
  "func_success": 0
},
'multi_pipe_8bit': {
  "syntax_success": 3,
  "func_success": 0
},
'parallel2serial': {
  "syntax_success": 3,
  "func_success": 2
},
'pe': {"syntax_success": 0, "func_success": 0},
'pulse_detect': {
  "syntax_success": 2,
  "func_success": 0
},
'radix2_div': {"syntax_success": 0, "func_success": 0},
'RAM': {"syntax_success": 0, "func_success": 0},
'right_shifter': {
  "syntax_success": 3,
  "func_success": 3
},
'serial2parallel': {
  "syntax_success": 4,
  "func_success": 0
},
'signal_generator': {
  "syntax_success": 3,
  "func_success": 1
},
'synchronizer': {
  "syntax_success": 2,
  "func_success": 2
},
'alu': {"syntax_success": 0, "func_success": 0},
'div_16bit': {
  "syntax_success": 2,
  "func_success": 0
},
'traffic_light': {
  "syntax_success": 4,
  "func_success": 1
},
'width_8to16': {
  "syntax_success": 2,
  "func_success": 0
},
}
if __name__ == "__main__":
    cal_atk(result_dic, 5, 1)
    cal_atk(result_dic, 5, 5)