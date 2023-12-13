#!/bin/bash

## Builds the docker image and pushes it to harbor. Needs to be logged in to harbor to be able to do this.
cd llama-cpp-python
docker build --file ./Dockerfile_gpu -t harbor.cs.aalto.fi/aaltorse-public/llm_llama_cpp_gpu .
docker push harbor.cs.aalto.fi/aaltorse-public/llm_llama_cpp_gpu
docker build --file ./Dockerfile -t harbor.cs.aalto.fi/aaltorse-public/llm_llama_cpp .
docker push harbor.cs.aalto.fi/aaltorse-public/llm_llama_cpp
cd -
