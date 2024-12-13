import os
design_name = ['accu', 'adder_8bit', 'adder_16bit', 'adder_32bit', 'adder_pipe_64bit', 'asyn_fifo', 'calendar', 'counter_12', 'edge_detect',
               'freq_div', 'fsm', 'JC_counter', 'multi_16bit', 'multi_booth_8bit', 'multi_pipe_4bit', 'multi_pipe_8bit', 'parallel2serial' , 'pe' , 'pulse_detect', 
               'radix2_div', 'RAM', 'right_shifter',  'serial2parallel', 'signal_generator','synchronizer', 'alu', 'div_16bit', 'traffic_light', 'width_8to16']
def test_one_file(testfile, result_dic):
    cnt = 0
    for design in design_name:
        if os.path.exists(f"{design}/makefile"):
            # os.chdir(design)
            make_file_content = ''
            with open(f"{design}/makefile", "r") as file:
                make_file_content = file.read()
                assert '.v testbench.v' in make_file_content or '.v  testbench.v' in make_file_content

            # if os.path.exists("simv"):
            #     result_dic[design]['syntax_success'] += 1

            #     if os.path.exists("output.txt"):
            #         with open("output.txt", "r") as file:
            #             output = file.read()
            #             if "Pass" in output or "pass" in output:
            #                 result_dic[design]['func_success'] += 1
            # os.chdir("..")
    return cnt



assert len(design_name) == 29
print(test_one_file("test_1", {}))