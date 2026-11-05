#!/usr/bin/env bash
# Starts the server with 12 GB of RAM. Needs a machine with 16 GB+ RAM. Lower -Xmx/-Xms if not.
cd "$(dirname "$0")" || exit 1
java -Xms12G -Xmx12G -jar server.jar nogui
