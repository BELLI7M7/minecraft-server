@echo off
rem Starts the server with 12 GB of RAM. Needs a PC with 16 GB+ RAM. Lower -Xmx/-Xms if not.
cd /d "%~dp0"
java -Xms12G -Xmx12G -jar server.jar nogui
pause
