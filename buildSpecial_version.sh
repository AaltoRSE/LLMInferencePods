#!/bin/bash

## Builds the docker image and pushes it to harbor. Needs to be logged in to harbor to be able to do this.
cd llama-cpp-python
docker build --file ./Dockerfile_gpu -t harbor.cs.aalto.fi/aaltorse-public/llm_llamacpp_$1 .
docker push harbor.cs.aalto.fi/aaltorse-public/llm_llamacpp_$1
cd -

