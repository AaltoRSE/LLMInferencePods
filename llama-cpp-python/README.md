# FastChat Container

[FastChat](https://github.com/lm-sys/FastChat/tree/main) provides a simple way to set up a openAI compatblie API.
The container will need three environment variables

1. HOST
2. PORT
3. MODEL

The model needs to be a model compatible with FastChat and available on huggingface.

The container needs a binding of the huggingface cache folder to `/huggingface` within the container.

Only models that are already in the provided huggingface cache should be used in the container!
