# Use the image as specified
FROM python:3-slim-bookworm

# Update and upgrade the existing packages 
RUN apt-get update && apt-get upgrade -y && apt-get install -y --no-install-recommends \
    python3 \
    python3-pip \
    ninja-build \
    libopenblas-dev \
    build-essential \
    pkg-config \
    git

RUN python3 -m pip install --upgrade pip
RUN python3 -m pip install --upgrade pip pytest cmake scikit-build setuptools fastapi uvicorn sse-starlette pydantic-settings starlette-context
WORKDIR /llama_cpp
RUN git clone https://github.com/tpfau/llama-cpp-python.git && cd llama-cpp-python && git checkout stream_testing && git submodule init && git submodule update
RUN CMAKE_ARGS="-DGGML_BLAS=ON -DGGML_BLAS_VENDOR=OpenBLAS -DLLAMA_AVX2=ON -DLLAMA_AVX2=ON -DLLAMA_FMA=ON " pip install /llama_cpp/llama-cpp-python[server]
    
ENV HOST="localhost" \
    PORT="8000" \        
    CHATFORMAT="chatml"

WORKDIR /app

COPY start_server.sh /app/entrypoint.sh

ENTRYPOINT ["/app/entrypoint.sh"]
