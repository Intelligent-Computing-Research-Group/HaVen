import os
import json

def jsonline_iter(file_path: str):
    with open(file_path, "r") as f:
        for line in f:
            yield json.loads(line)

def example_to_jsonline(examples: dict, save_file: str):
    with open(save_file, "a") as f:
            f.write(json.dumps(examples) + "\n")

def parse_code(raw_code: str):
    # extract code from the answer:
    if "```verilog\n" in raw_code and "```" in raw_code:
        code = raw_code.split("```verilog\n")[1].split("```")[0]
    elif "```verilog\n" in raw_code and not "```" in raw_code:
        code = raw_code.split("```verilog\n")[1]
    elif "```" in raw_code and not "```verilog\n" in raw_code:
        code = raw_code.split("```")[1]
    elif not "```verilog\n" in raw_code:
        code = raw_code

    s_full = code
    s = s_full.rsplit('endmodule', 1)[0] + "\n" + "endmodule"
    index = s.find('endmodule')
    if index != -1:
        s = s[:index] + "endmodule"
    return s.lstrip(' \n')

def build_verilog_file(input_jsonl, output_dir):
    num_of_each_task = {}
    for item in jsonline_iter(input_jsonl):
        task_id = item["task_id"]
        code = item["res"]
        code = parse_code(code)
        if task_id not in num_of_each_task:
            num_of_each_task[task_id] = 1
        else:
            num_of_each_task[task_id] += 1
        os.makedirs(f"{output_dir}/test_{num_of_each_task[task_id]}", exist_ok=True)
        with open(f"{output_dir}/test_{num_of_each_task[task_id]}/{task_id}.v", "w") as f:
            f.write(code)

if __name__ == "__main__":
    build_verilog_file("example.jsonl", "output_dir")