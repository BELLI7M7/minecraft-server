@echo off
rem Starts the server with 2 GB of RAM. Adjust -Xmx/-Xms to taste.
cd /d "%~dp0"
java -Xms2G -Xmx2G -jar server.jar nogui
pause
