#!/bin/bash

# Start Xvfb
Xvfb :99 -screen 0 1280x1024x16 &

# Set display environment variable
export DISPLAY=:99

# Start Jupyter Notebook
start-notebook.sh "$@"
