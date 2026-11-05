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

### 12 GB of RAM

`MEMORY: "12G"` is already set. The PC running the server needs clearly more than 12 GB free (16 GB+ total recommended).
On Windows, Docker Desktop (WSL2) only gets about half of your RAM by default. To raise it, create `C:\Users\<you>\.wslconfig`:

```ini
[wsl2]
memory=14GB
```

then run `wsl --shutdown` and start Docker Desktop again.

### Cracked (non-premium) players

`ONLINE_MODE: "FALSE"` lets players join without a paid account. The downside: nothing proves who a player is, so anyone can join with any name, including an operator's. To stay safe:

- Turn on the whitelist (`WHITELIST` / `ENFORCE_WHITELIST` in the compose file) and only list your friends.
- Install a login plugin such as [AuthMe Reloaded](https://www.spigotmc.org/resources/authme-reloaded.6269/): download the jar and drop it into `data/plugins/`, then restart.
- Only share the server address with people you trust.

### Different Minecraft versions

The ViaVersion, ViaBackwards and ViaRewind plugins are installed automatically, so players on older or newer game versions than the server can usually join.

### Plugins vs mods

- **Plugins** (default, `TYPE: "PAPER"`): installed only on the server. Players join with a normal client. Put extra plugin jars in `data/plugins/`.
- **Mods** (`TYPE: "FABRIC"` or `"FORGE"`): every player must install the same mods on their own client too. Put server mod jars in `data/mods/`.
You can't mix the two on one server.

## Backups

Stop the server and copy the `data/` folder (or at least `data/world`).
