# Minecraft Server

A small, self-hosted Minecraft Java server for playing with friends.
Two ways to run it: **Docker** (recommended) or a plain **Java** jar.

> The server jar and world data are **not** stored in this repo (see `.gitignore`).

## Option 1: Docker (recommended)

1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/).
2. Open `docker-compose.yml`, read the [Minecraft EULA](https://aka.ms/MinecraftEULA), and if you accept it change `EULA: "FALSE"` to `EULA: "TRUE"`.
3. Start the server:

   ```bash
   docker compose up -d
   ```

4. Useful commands:

   ```bash
   docker compose logs -f              # watch the server log
   docker attach minecraft-server      # server console (detach with Ctrl+P, Ctrl+Q)
   docker compose down                 # stop the server
   ```

World, plugins and configs are saved in the `data/` folder.

## Option 2: Plain Java

1. Install Java 21 (Minecraft 1.21+ needs it).
2. Download a server jar (for example [PaperMC](https://papermc.io/downloads/paper) or the vanilla jar from minecraft.net) and rename it to `server.jar`, placed next to `start.bat` / `start.sh`.
3. Run `start.bat` (Windows) or `./start.sh` (Linux/macOS). The first run creates `eula.txt`: set `eula=true` after accepting the EULA, then run it again.

## Joining

- **Same Wi-Fi (LAN):** find the host's local IP with `ipconfig` (Windows) and join with `192.168.x.x:25565`.
- **Over the internet:** forward **TCP port 25565** on your router to the host machine, then share your public IP. Or use a tunnel / VPN such as Tailscale or ZeroTier to avoid port forwarding.
- Allow the port in the firewall if friends cannot connect.

## Configuration

Edit the environment section of `docker-compose.yml` (server type, version, memory, MOTD, max players, difficulty).
For the Java option, edit `server.properties` after the first run.

## Backups

Stop the server and copy the `data/` folder (or at least `data/world`).
