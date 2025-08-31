## 🌐 Network & DNS Architecture

Ohara is designed for seamless access both at home and remotely:

- **Pi-hole** acts as the DNS server for your local network and for remote clients via Tailscale.
- Your router is configured to use Pi-hole as the default DNS, so all local devices resolve `ohara.com` to your homeserver.
- **Tailscale** is set up to use Pi-hole as its DNS, so when you are remote, `ohara.com` still resolves to your homeserver over the secure Tailscale network.
- This means you can access your homeserver at `http://ohara.com` from anywhere—no matter if you’re at home or away!

---

<p align="center">
	<img src="https://img.shields.io/badge/status-active-brightgreen?style=flat-square"/>
	<img src="https://img.shields.io/badge/docker-compose-blue?logo=docker&style=flat-square"/>
	<img src="https://img.shields.io/badge/healthchecks.io-integrated-orange?style=flat-square"/>
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

## 🧩 Included Services

| Service         | Description                | Port(s)   | Healthcheck |
|-----------------|---------------------------|-----------|-------------|
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **Homer**        | Dashboard & links           | 8080      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **Jellyfin**     | Media streaming             | 8096      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **qBittorrent** | Torrent downloads           | 8081      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **Pi-hole**     | Network ad-blocking         | 8888      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **Copyparty**   | File sharing                | 3923      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **Radarr**      | Movie automation            | 7878      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **Prowlarr**    | Indexer manager             | 9696      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/docker/docker-original.svg" width="24"/> **OpenSpeedTest**| Network speed test          | 3000      | Yes         |
| <img src="https://cdn.jsdelivr.net/gh/devicons/devicon/icons/python/python-original.svg" width="24"/> **Watchdog**    | Healthchecks.io integration | -         | -           |

---

## 🛠️ Quick Start

```sh
# Clone the repo
$ git clone https://github.com/thebrownbreadtoast/ohara.git
$ cd ohara

# Copy and edit configs as needed
$ cp compose/env.bkp compose/.env

# Start all services
$ docker compose -f compose/docker-compose.homer.yml \
								 -f compose/docker-compose.jellyfin.yml \
								 -f compose/docker-compose.qbit.yml \
								 -f compose/docker-compose.pihole.yml \
								 -f compose/docker-compose.copyparty.yml \
								 -f compose/docker-compose.radarr.yml \
								 -f compose/docker-compose.prowlarr.yml \
								 -f compose/docker-compose.openspeedtest.yml \
								 -f compose/docker-compose.watchdog.yml up -d
```

---

## 🩺 Health Monitoring

- Each service has a Docker `healthcheck`.
- The `watchdog` container reports health to [Healthchecks.io](https://healthchecks.io).
- Configure your Healthchecks UUIDs in `configs/watchdog/config.yml`.

---

## 📁 Directory Structure

```text
compose/         # All docker-compose YAMLs
configs/         # Service configs (nginx, homer, etc.)
scripts/         # Utility scripts (watchdog, setup, etc.)
assets/          # Logos and static assets
```

---

## ✨ Dashboard

Access your dashboard at: [http://ohara.com](http://ohara.com)

---

## 🤝 Contributing

PRs and suggestions welcome! See [LICENSE](LICENSE).

---

<p align="center">
	<sub>Made with ❤️ by thebrownbreadtoast</sub>
</p>