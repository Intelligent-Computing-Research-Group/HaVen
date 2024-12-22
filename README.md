<p align="center">
<img src="HaVen.webp" alt="HaVen" width="220" align="center">
</p>

<div align="center"><h1>&nbsp;HAVEN: Hallucination-Mitigated LLM for Verilog
Code Generation Aligned with HDL Engineers</h1></div>

<p align="center">
| <a href="http://arxiv.org/"><b>Paper</b></a> | <a href="http://arxiv.org/"><b>Blog</b></a> |
</p>


<p align="center">
  <a href="https://opensource.org/license/mulanpsl-2-0">
    <img src="https://img.shields.io/badge/License-MuLan_PSL_2.0-blue.svg" alt="License">
  </a>
  <a href="https://github.com/">
    <img src="https://img.shields.io/badge/Maintained%3F-yes-green.svg" alt="Maintenance">
  </a>
  <a href="https://github.com/">
    <img src="https://img.shields.io/badge/Contributions-welcome-brightgreen.svg?style=flat" alt="Contributions welcome">
  </a>
</p>


## Contents
- [News](#news)
- [Introduction](#introduction)
- [Installation](#installation)
- [Usage](#usage)
- [Citation](#citation)


## News

- [2024/6] First work-around of HaVen is done!

## Introduction

### HaVen: Hallucination-Mitigated LLM for Verilog Code Generation Aligned with HDL Engineers

This repository accompanies the paper **"HaVen: Hallucination-Mitigated LLM for Verilog Code Generation Aligned with HDL Engineers"**, accepted at DATE 2025. HaVen is a novel framework designed to enhance the alignment of large language models (LLMs) with hardware description language (HDL) engineering practices, mitigating logical, symbolic, and knowledge hallucinations in Verilog code generation.


## Installation 

## Usage
## Train and Fine-tuning
The training environment configuration and running methods refer to the llamafactory project.

## Quick Start

```python
from transformers import pipeline
import torch
prompt= "FILL IN THE QUESTION"
generator = pipeline(
  model="HaVen",
  task="text-generation",
  torch_dtype=torch.bfloat16,
  device_map="auto",
)
result = generator(prompt , max_length=2048,num_return_sequences=1, temperature=0.0)
response = result[0]["generated_text"]
print("Response:", response)
```
## Model Inference

## Models and Datasets

|      | Base Model                                                                                          | CodeV                                                               |
| ---- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| 6.7B | [deepseek-ai/deepseek-coder-6.7b-base](https://huggingface.co/deepseek-ai/deepseek-coder-6.7b-base) | Coming Soon                                                         |
| 7B   | [codellama/CodeLlama-7b-Python-hf](https://huggingface.co/codellama/CodeLlama-7b-Python-hf)         | Coming Soon                                                         |
| 7B   | [Qwen/CodeQwen1.5-7B-Chat](https://huggingface.co/Qwen/CodeQwen1.5-7B-Chat)                         | Coming Soon                                                         |

### Auto Test on Benchmarks

Our repository includes a script to evaluate the model's performance on **VerilogEval** and **RTLLM** benchmarks.

1. **Prepare Tasks**:
   - Write the names of tasks to evaluate in `test_on_benchmark/tasks_to_do.txt`.

2. **Configure Test Script**:
   - Open `test_on_benchmark/run.sh`.
   - Set the following variables:
     - `path`: Path to the directory containing the generated Verilog code.
     - `n`: Number of code candidates to evaluate per task.
   - The generated Verilog code for **HaVen** is available at:
     ```
     test_on_benchmark/model_output/HaVen
     ```

3. **Run the Script**:
   ```bash
   bash test_on_benchmark/run.sh

## Citation
If you find this repository or our research helpful, please cite our paper:
```
@inproceedings{haven2025,
  title     = {HaVen: Hallucination-Mitigated LLM for Verilog Code Generation Aligned with HDL Engineers},
  author    = {Yiyao Yang and Fu Teng and Pengju Liu and Mengnan Qi and Chenyang Lv and Ji Li and Xuhong Zhang and Zhezhi He},
  booktitle = {Design, Automation & Test in Europe (DATE)},
  year      = {2025}
}
```
For questions or issues, feel free to open an issue or contact the authors. Thank you for using HaVen!

