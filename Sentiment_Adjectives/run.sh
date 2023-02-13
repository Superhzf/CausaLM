#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=8
#SBATCH --mem=64G
#SBATCH --time=12:00:00
#SBATCH --partition=gpu
#SBATCH --gres=gpu:rtx_6000:1

cd /work/LAS/cjquinn-lab/zefuh/CausaLM/CausaLM/Sentiment_Adjectives

module load miniconda3/4.10.3-svrr7oe

source activate causalm

python lm_finetune/pregenerate_training_data.py