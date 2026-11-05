#!/usr/bin/env bash
# Starts the server with 2 GB of RAM. Adjust -Xmx/-Xms to taste.
cd "$(dirname "$0")" || exit 1
java -Xms2G -Xmx2G -jar server.jar nogui
