#!/usr/bin/env bash
# https://collabnix.com/getting-started-with-ollama-and-docker/#CPU_Only

# CONTAINER_BIN=docker
CONTAINER_BIN=podman

function ollama_in_container_cpu(){
    $CONTAINER_BIN run -d \
        -v ollama:/root/.ollama \
        -p 11434:11434 \
        --name ollama \
        ollama/ollama
}


function ollama_in_container_gpu(){
    curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg

    curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

    sudo apt-get update

    $CONTAINER_BIN run -d \
        --gpus=all \
        -v ollama:/root/.ollama \
        -p 11434:11434 \
        --name ollama \
        ollama/ollama
}

function ollama_run(){
    $CONTAINER_BIN exec -it ollama ollama run llama2
}