#!/bin/bash

# Start controller
echo "Starting Controller"
python3 -m fastchat.serve.controller --host 0.0.0.0 --port 21001&
#Wait till it's up
sleep 5
# Then, launch the model worker(s)
echo "Loading Model $MODEL"
python3 -m fastchat.serve.model_worker --model-path $MODEL --device cpu --controller-address http://127.0.0.1:21001 --host 0.0.0.0 --port 21002 &
# Wait for the model to be loaded
sleep 20
# Finally, launch the RESTful API server
echo "Starting Server on $HOST:$PORT"
python3 -m fastchat.serve.openai_api_server --host $HOST --port $PORT --controller-address http://127.0.0.1:21001 &

# Keep script running (this feels like a hack. but if it works...)
tail -f /dev/null