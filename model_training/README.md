# LLaMA-Factory for Training and Fine-tuning
This repository leverages [LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory) to perform LoRA fine-tuning of base models on our dataset. Below is a brief guide for installation and usage relevant to this repository.

## Installation

1. **Clone the LLaMA-Factory Repository**  
   Clone the official LLaMA-Factory repository for access to fine-tuning scripts and tools:  
   ```bash
   git clone https://github.com/hiyouga/LLaMA-Factory.git
   cd LLaMA-Factory
   ```
2. **Install Dependencies**
   Ensure all necessary dependencies are installed by running:
   ```bash
   pip install -r requirements.txt
   ```

## Usage
Use the provided fine-tuning script to train the model. Below is an example command:
```bash
python finetune.py \
  --base_model <base_model_path_or_name> \
  --data_path <path_to_your_dataset> \
  --output_dir <path_to_save_finetuned_model> \
  --lora_rank 8 \
  --batch_size 32 \
  --num_epochs 3
```