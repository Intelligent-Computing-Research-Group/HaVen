<p align="center">
<img src="logo.jpg" alt="HaVen" width="220" align="center">
</p>

<div align="center"><h1>&nbsp;HAVEN: Hallucination-Mitigated LLM for Verilog
Code Generation Aligned with HDL Engineers</h1></div>

<p align="center">
| <a href="https://arxiv.org/pdf/2501.04908"><b>Preprint</b></a> | <a href="https://arxiv.org/pdf/2501.04908"><b>Paper</b></a> |
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
- [Reproducing_HaVen](#Reproducing_HaVen)
- [Installation](#installation)
- [Usage](#usage)
- [Citation](#citation)


## News
- [2024/12] Code of HaVen is Released.
- [2024/11] HaVen is accpeted by DATE 2025.

## Introduction

### HaVen: Hallucination-Mitigated LLM for Verilog Code Generation Aligned with HDL Engineers

This repository accompanies the paper **"HaVen: Hallucination-Mitigated LLM for Verilog Code Generation Aligned with HDL Engineers"**, accepted at DATE 2025. HaVen is a novel framework designed to enhance the alignment of large language models (LLMs) with hardware description language (HDL) engineering practices, mitigating logical, symbolic, and knowledge hallucinations in Verilog code generation.

## Reproducing_HaVen

To ensure accurate reproduction of results in our paper, **please follow the configuration guidelines below**. These settings are critical to achieving HaVen's full potential.

### ✅ 1. Use the SI-CoT Prompt
* **Location**: [`model_inference/model_input/SI-CoT_prompt.jsonl`](model_inference/model_input/SI-CoT_prompt.jsonl)
* When evaluating on VerilogEval-Human benchmark, please make sure to load and use the prompt exactly as provided when querying the model.

### ✅ 2. Properly Extract the Verilog Code

The raw output from HaVen is **not always in standardized code format**. Specifically:

* The model **may omit code blocks** like \`\`\`verilog and \`\`\`.
* The model **may generate incomplete module headers**, or occasionally omit them altogether. 

#### Why module headers may be missing:

This behavior typically occurs because the model is prompted with a module header at the **end of the SI-CoT prompt**, followed immediately by the model’s code generation. As a result, the model assumes the header has already been written and begins directly with the internal body of the module.

In such cases, the correct approach is to:

* **Extract the module header** from the end of the prompt.
* **Prepend it** to the model’s generated response to reconstruct a complete, well-formed Verilog module.

To address this, we include a dedicated **code extractor** that post-processes the raw output and retrieves well-formed Verilog code for further use or evaluation.
* **Location**: [`model_inference/postprocess.py`](model_inference/postprocess.py)

We recommend using `postprocess.py` for any benchmarking or integration work. It inserts missing module headers when necessary.

## Installation 
### 1. Install LLaMA-Factory for Training and Fine-tuning
For training and fine-tuning, install [LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory) by following their installation instructions.
## 2. Install Dependencies for Model Inference
```bash
pip install torch transformers
```
## 3. Install VCS for Auto Test on Benchmarks
VCS is a Verilog compiler required for automated testing on benchmarks. Follow these steps to install and configure VCS:
1. Obtain VCS from Synopsys. Ensure you have the required license to use it.
2. Install VCS following the instructions provided in the official Synopsys documentation.
3. Add the VCS executable to your system's PATH environment variable.

Verify the installation by running:
```bash
vcs -help
```

## Usage
### Train and Fine-tuning
The training environment configuration and running methods refer to the llamafactory project.

### Quick Start

```python
from transformers import pipeline
import torch
prompt= "FILL IN THE QUESTION"
generator = pipeline(
  model="HaVen-CodeQwen",
  task="text-generation",
  torch_dtype=torch.bfloat16,
  device_map="auto",
)
result = generator(prompt , max_length=2048,num_return_sequences=1, temperature=0.0)
response = result[0]["generated_text"]
print("Response:", response)
```
### Model Inference
To perform inference on the VerilogEval benchmark, use the script located at:  
`model_inference/inference_VerilogEval.py`  

#### Example Command  
The following example demonstrates inference using the `deepseek-coder-6.7b` model:  
```bash
python model_inference/inference_VerilogEval.py \
  --model deepseek-ai/deepseek-coder-6.7b-instruct \
  --n 1 \
  --temperature 1.0 \
  --gpu_name 7 \
  --output_dir ./your_output_path \
  --output_file your_output_file.jsonl \
  --bench_type Machine
```

To perform inference on the RTLLM benchmark, use the script located at:
`model_inference/inference_RTLLM.py`

#### Example Command
The following example demonstrates inference using the `deepseek-coder-6.7b` model:
```bash
python model_inference/inference_RTLLM.py \
  --model deepseek-ai/deepseek-coder-6.7b-instruct \
  --n 5 \
  --temperature 0.5 \
  --gpu_name 5 \
  --output_dir ./your_output_path
```

#### Parameters

Below is a description of the key parameters used in the inference scripts:

- `--model`  
  Specifies the pre-trained or fine-tuned model to use for inference. Example: `deepseek-ai/deepseek-coder-6.7b-instruct`.

- `--n`  
  The number of samples to generate for each input. A higher value increases diversity but requires more computational resources.

- `--temperature`  
  Controls the randomness of predictions. Values closer to `0` make the output more deterministic, while higher values (e.g., `1.0`) allow for more diversity.

- `--gpu_name`  
  Identifies the GPU to be used for running the inference. Specify the GPU ID (e.g., `0`, `1`, `7`).

- `--output_dir`  
  The directory where the inference results will be saved. Ensure the directory exists or can be created.

- `--output_file` (optional, VerilogEval-specific)  
  Specifies the name of the output file to save results. The file format is typically `.jsonl`.

- `--bench_type` (VerilogEval-specific)  
  Indicates the type of benchmark evaluation. Example: `Machine`. Refer to the benchmark documentation for valid types.

### Models

|      | Base Model                                                                                          | HaVen                                                               |
| ---- | --------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------- |
| 7B   | [Qwen/CodeQwen1.5-7B-Chat](https://huggingface.co/Qwen/CodeQwen1.5-7B-Chat)                         | [HaVen-CodeQwen](https://huggingface.co/yangyiyao/HaVen-CodeQwen)|

### Auto Test on Benchmarks

Our repository includes a script to evaluate the model's performance on **VerilogEval** and **RTLLM** benchmarks.

1. **Prepare Tasks**:
   - The task list of VerilogEval-Human is in `test_on_benchmark/tasks_verilogeval_human.txt`.
   - The task list of VerilogEval-Machine is in `test_on_benchmark/tasks_verilogeval_machine.txt`.
   - The task list of RTLLM is in `test_on_benchmark/tasks_verilogeval_RTLLM.txt`.
   - Or you can customize the names of tasks to evaluate in `test_on_benchmark/tasks_to_do.txt`.

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

### Datasets

Our dataset is available on [HaVen-KL-Dataset](https://huggingface.co/datasets/yangyiyao/HaVen-KL-Dataset).

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

