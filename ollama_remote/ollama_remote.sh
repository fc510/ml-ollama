#!/usr/bin/env bash
exit

# Start the Ollama server manually
OLLAMA_HOST=0.0.0.0 OLLAMA_PORT=11434 ollama serve

# start as a service after editing the service file
sudo systemctl daemon_reload
sudo systemctl start ollama