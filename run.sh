#!/bin/bash


ROOT=/home/user/EvoCodeBench

Source_Code_Root=/data/Source_Code
Dependency_Root=/data/Dependency_Data

completion_file=$1
dump_dir=$2

source activate EvoCodeBench && pip install func-timeout==4.3.5 numpy==2.1.2 tqdm==4.66.5 psutil==6.0.0 tiktoken==0.8.0 tree-sitter==0.21.3

python prompt/process_completion.py \
    --model_type "gpt" \
    --completion_file "${completion_file}" \
    --output_file "outputs/output.jsonl" \

python check_source_code.py $Source_Code_Root
python pass_k.py \
    --output_file $ROOT/outputs/output.jsonl \
    --log_file $ROOT/outputs/test_results.jsonl \
    --data_file /data/data.jsonl \
    --source_code_root $Source_Code_Root \
    --dump-dir ${dump_dir} \
    --ecb-path ${completion_file} \
    --k 1 \
    --n 1 \
