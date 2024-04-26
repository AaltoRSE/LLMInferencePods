#!/bin/bash

## Builds the docker image and pushes it to harbor. Needs to be logged in to harbor to be able to do this.
cd llama-cpp-python
docker build --build-arg llama_cpp_version=$1 --file ./Dockerfile_gpu -t harbor.cs.aalto.fi/aaltorse-public/llm_llmcpp_gpu:$1 .
docker push harbor.cs.aalto.fi/aaltorse-public/llm_llamacpp_gpu:$1
docker build --build-arg llama_cpp_version=$1 --file ./Dockerfile -t harbor.cs.aalto.fi/aaltorse-public/llm_llamacpp_cpu:$1 .
docker push harbor.cs.aalto.fi/aaltorse-public/llm_llamacpp_cpu:$1
cd -
