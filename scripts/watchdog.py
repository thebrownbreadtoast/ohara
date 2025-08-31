import sys
import time
import yaml
import requests
import docker

def load_config(path):
    with open(path, 'r') as f:
        return yaml.safe_load(f)

def get_container_health(client, name):
    try:
        container = client.containers.get(name)
        return container.attrs['State']['Health']['Status']
    except Exception:
        return None

def ping_healthchecks(uuid, status):
    url = f'https://hc-ping.com/{uuid}'
    if status == 'healthy':
        requests.get(url, timeout=5)
    else:
        requests.get(url + '/fail', timeout=5)

def main():
    if len(sys.argv) < 2:
        print('Usage: watchdog.py <config.yml>')
        sys.exit(1)
    config = load_config(sys.argv[1])
    client = docker.DockerClient(base_url='unix://var/run/docker.sock')
    while True:
        for svc in config.get('services', []):
            name = svc['name']
            uuid = svc['uuid']
            status = get_container_health(client, name)
            if status:
                ping_healthchecks(uuid, status)
        time.sleep(60)

if __name__ == '__main__':
    main()
