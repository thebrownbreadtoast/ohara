## 🌐 Network & DNS Architecture

Ohara is designed for seamless access both at home and remotely:

- **Pi-hole** acts as the DNS server for your local network and for remote clients via Tailscale.
- Your router is configured to use Pi-hole as the default DNS, so all local devices resolve `ohara.com` to your homeserver.
- **Tailscale** is set up to use Pi-hole as its DNS, so when you are remote, `ohara.com` still resolves to your homeserver over the secure Tailscale network.
- This means you can access your homeserver at `http://ohara.com` from anywhere—no matter if you’re at home or away!

---

<p align="center">
	<img src="https://healthchecks.io/b/2/0a25792d-04b4-429d-84bb-0c93d3bd3c68.svg"/>
</p>

---

## 🏡 What is Ohara?

**Ohara** is a self-hosted, modular homeserver stack powered by Docker Compose. It brings together essential services for your home network, all managed with health monitoring and a beautiful dashboard.

---

## 🚀 Features

- **One-command deployment** with Docker Compose
- **Service health monitoring** with [Healthchecks.io](https://healthchecks.io)
- **Modern dashboard** with [Homer](https://github.com/bastienwirtz/homer)
- **Media streaming** ([Jellyfin](https://jellyfin.org)), **downloads** ([qBittorrent](https://www.qbittorrent.org)), **ad-blocking** ([Pi-hole](https://pi-hole.net)), and more!
- **Easy configuration** and extensibility

---


## 🧩 Included Services & Categories

| Category                | Service         | Description                | Port(s)   |
|-------------------------|-----------------|---------------------------|-----------|
| Monitoring & Dashboards | **Homer**       | Dashboard & links          | 8080      |
|                         | **Uptime Kuma** | Uptime/status monitoring   | 3001      |
| Entertainment           | **Jellyfin**    | Media streaming            | 8096      |
|                         | **Radarr**      | Movie automation           | 7878      |
| Tools                   | **qBittorrent** | Torrent downloads          | 8081      |
|                         | **Copyparty**   | File sharing               | 3923      |
|                         | **2FAuth**      | Authenticator              | 8004      |
| Networking              | **Pi-hole**     | Network ad-blocking        | 8888      |
|                         | **OpenSpeedTest**| Network speed test         | 3000      |
| Indexers                | **Prowlarr**    | Indexer manager            | 9696      |
| Integrations            | **Watchdog**    | Healthchecks.io integration| -         |


---

## 🛠️ Quick Start

```sh
# Clone the repo
$ git clone https://github.com/thebrownbreadtoast/ohara.git

```sh
# Clone the repo
git clone https://github.com/thebrownbreadtoast/ohara.git
cd ohara

# Copy and edit configs as needed
cp compose/env.bkp compose/.env

# Start all services (multi-file compose)
docker compose -f compose/docker-compose.homer.yml \
## 🩺 Health Monitoring

- Each service has a Docker `healthcheck`.
- The `watchdog` container reports health to [Healthchecks.io](https://healthchecks.io).
- Configure your Healthchecks UUIDs in `configs/watchdog/config.yml`.

---

## 📁 Directory Structure

# Or just Kuma (standalone):
docker compose up -d
```

```text
compose/         # All docker-compose YAMLs
configs/         # Service configs (nginx, homer, etc.)
scripts/         # Utility scripts (watchdog, setup, etc.)
assets/          # Logos and static assets
```

---


## ✨ Dashboards & Monitoring

- Main dashboard: [http://ohara.com](http://ohara.com)
- Uptime Kuma: [http://kuma.ohara.com](http://kuma.ohara.com)

All services are reverse-proxied via Nginx for easy access on your LAN or via Tailscale.

---

## 🤝 Contributing

PRs and suggestions welcome! See [LICENSE](LICENSE).

---

<p align="center">
	<sub>Made with ❤️ by thebrownbreadtoast</sub>
</p>