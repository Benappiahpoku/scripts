#!/bin/bash

# Message to start process
echo " "
echo "Your changes are ready for the web browser"


# watch the index and serve files

browser-sync start --server --files .
