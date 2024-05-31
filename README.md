# Kubernetes pod instructions for LLM deployment

This repo contains instructions for deploying LLMs for the LLM gateway developed [here](https://github.com/AaltoRSE/LLMGateway/)
It consists of three main parts, Docker instructions for the inference containers, docker and configuration instructions for an nginx container placed in front of the LLM inference container, and helm templates for deploying these containers on a kubernetes cluster

## LLM inference container

The requirement for the LLM inference containers are two-fold.
1. provide a server with an OpenAI compatible API, along with an endpoint to calculate the number of tokens for prompts.
2. provide support for the underlying hardware, i.e. GPUs or CPUs. 

The latter is potentially problematic since for optimal use of the hardware, the recipies need to be adapted in order to make use of hardware specific features to make them as efficient as possible.
We provide a simple llama_cpp_python based docker reciepe in the `llama-cpp-python` folder, The docker reciepes require specification of the version of llama-cpp-python to be used.

## Nginx container

The nginx container we provide has a very simplistic spec. There are two features it provides above a simple reverse proxy to a basic nginx container:
1. It handles authorization. Essentially it handles the authorization step of the OpenAI api.
2. It provides a health check. This check essentially queries the inference containers /v1/models endpoint and uses the response to determine whether startup has completed and it can be used.

The latter is necessary for scale to 0 and proper request forwarding in kubernetes, since otherwise the container would be considered alive before the model has been loaded, leading to unexpected failing requests. 

## Helm templates and kubernetes templates

We provide three templates in our helm chart:
- Autoscaler 
    - this template provides the way the autoscaler works. It specifies the target of the scaler, along with the min/max number of pods. It also specifies the endpoint this scaler is for, and thus automatically intercepts requests going to the model of interest.
- Deployment
    - Specifies the interaction between the nginx pod and the llm pod.
- Service
   - Specify the service to which requests can be forwarded

In addition to the helm templates, we also need to specify the ingress location for our llms. 
This is specified in the kedaExternal and kedaingress yaml files.
