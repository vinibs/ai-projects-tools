#!/bin/sh

# First, pull the desired LLM
# make ollama-pull model=llama3.2

curl --location 'localhost:11434/api/generate' \
--header 'Content-Type: application/json' \
--data '{
    "model": "llama3.2",
    "prompt": "generate a simple regex for matching an 8-digit number",
    "stream": false
}'