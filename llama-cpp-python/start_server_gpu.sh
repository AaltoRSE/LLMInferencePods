#!/bin/bash

# Start controller
echo "Starting Server"
env
python3 -m llama_cpp.server --n_gpu_layers -1 --host $HOST --model /models/$MODEL --port $PORT --chat_format $CHATFORMAT --n_threads $N_CPUS --n_ctx $N_CTX