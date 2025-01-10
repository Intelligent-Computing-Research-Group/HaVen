import os
import json

def jsonline_iter(file_path: str):
    with open(file_path, "r") as f:
        for line in f:
            yield json.loads(line)

def example_to_jsonline(examples: dict, save_file: str):
    with open(save_file, "a") as f:
            f.write(json.dumps(examples) + "\n")

def build_v_file(input_jsonl, model_name, bench_type):
    i = 1
    for item in jsonline_iter(input_jsonl):
        task_id = item["task_id"]
        code = item["response"]
        os.makedirs(f"model_output/{model_name}/{bench_type}/test_{i}", exist_ok=True)
        with open(f"model_output/{model_name}/{bench_type}/test_{i}/{task_id}.v", "w") as f:
            f.write(code)

if __name__ == "__main__":
    input_jsonl = "fix_syntax.jsonl"
    model_name = "gpt4"
    bench_type = "Human"
    build_v_file(input_jsonl, model_name, bench_type)