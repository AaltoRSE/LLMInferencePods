FROM python:3.10-slim-bullseye

COPY requirements.txt .
RUN pip install -r requirements.txt 

ENV HOST="localhost" \
    PORT="5000" \
    MODEL="lmsys/vicuna-7b-v1.5" \
    HF_HOME="/huggingface"

WORKDIR /app

COPY start_FastChat.sh /app/entrypoint.sh

EXPOSE $PORT

ENTRYPOINT ["/app/entrypoint.sh"]
