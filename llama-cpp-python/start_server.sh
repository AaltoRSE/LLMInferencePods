#!/bin/bash

# Start controller
echo "Starting Server"
python3 -m llama_cpp.server --host $HOST --model /models/$MODEL --port $PORT --chat_format $CHATFORMAT
