# README

## 1. LLM生成代码

通常，LLM生成的代码结果会保存为`jsonl`格式，其中每一行都是一个字典，必须包含以下两个字段：
- `task_id`：用于区分不同题目的作答。
- `response`：LLM生成的内容。

## 2. 过滤代码并存入`.v`文件

代码过滤与存储过程在`test_on_benchmark/jsonl2v.py`中实现。
- `parse_code`函数：从LLM的生成内容中提取Verilog代码。由于LLM的输出通常包含额外的无关文本，并可能将代码框在` ```verilog ... ``` `中，因此需要该函数来提取纯净的代码。
- `build_verilog_file`函数：由于同一道题可能会生成多个答案，我们需要将其分别存储到不同的目录中，并保存为`.v`文件。

## 3. 运行测试脚本，获取测试结果

测试流程可通过`test_on_benchmark/run.sh`脚本执行。使用前需要设置以下参数：

- `TASK_FILE`：一个文本文件，其中每一行是待测试的task名称，指定要测试的任务。
- `path`：Verilog代码所在的路径，该路径下应包含`test_1`、`test_2`等目录，每个目录存放所有待测试的Verilog代码，并以`{task_name}.v`命名。
- `benchmark_name`：基准测试的路径，该路径下应为每个task创建一个目录，其中包含该task的testbench和Makefile。
- `files_to_run`：指定每个task需要运行的Verilog文件数量，即代码候选数量。举例而言，若设置`files_to_run=5`，则从`test_1`到`test_5`的目录依次进行测试。

通过设置上述参数并运行脚本，即可自动化完成Verilog代码的测试流程，获得最终的pass@k结果。

