# Kubernetes pod instructions for LLM deployment

This repository will contain all set up and Dockerfile routines for the LLM deployment.
Each subfolder contains a type of pod that should be deployable along with some instructions for it.

The nginxPod folder contains some settings for the up-front nginx server, which will in the end perform an Auth check.
The compose_test is a simple testing approach for the interaction between the nginx pod and the FastChat.
