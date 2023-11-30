# Use the image as specified
FROM python:3-slim-bullseye

# Update and upgrade the existing packages 
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    ninja-build \
    libopenblas-dev \
    build-essential

RUN pip install llama-cpp-python[server]

ENV HOST="localhost" \
    PORT="8000" \        
    CHATFORMAT="chatml"

WORKDIR /app

COPY start_server.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
