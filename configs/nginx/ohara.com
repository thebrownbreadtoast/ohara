server {
    listen 80;

    server_name ohara.com;

    location / {
        proxy_pass http://192.168.0.111:8080;
    }
}

server {
    listen 80;

    server_name jellyfin.ohara.com;

    location / {
        proxy_pass http://192.168.0.111:8096;
    }
}

server {
    listen 80;

    server_name qbit.ohara.com;

    location / {
        proxy_pass http://192.168.0.111:8081;

        # Also enable "Enable reverse proxy support" in Setting>WebUI and use "nginx" as value Trusted proxies list
        proxy_set_header   Host               $proxy_host;
        proxy_set_header   X-Forwarded-For    $proxy_add_x_forwarded_for;
        proxy_set_header   X-Forwarded-Host   $http_host;
        proxy_set_header   X-Forwarded-Proto  $scheme;
    }
}

#server {
#    listen 80;
#
#    server_name komga.ohara.com;
#
#    location / {
#        proxy_pass http://192.168.0.111:25600;
#    }
#}

server {
    listen 80;

    server_name pihole.ohara.com;

    location / {
        proxy_pass http://192.168.0.111:8888;
    }
}

server {
    listen 80;

    server_name copyparty.ohara.com;

    location / {
        proxy_pass http://192.168.0.111:3923;

        proxy_redirect off;

        # disable buffering (next 4 lines)
        proxy_http_version 1.1;
        client_max_body_size 0;
        proxy_buffering off;
        proxy_request_buffering off;

        # improve download speed from 600 to 1500 MiB/s
        proxy_buffers 32 8k;
        proxy_buffer_size 16k;
        proxy_busy_buffers_size 24k;

        proxy_set_header   Connection        "Keep-Alive";
        proxy_set_header   Host              $host;
        proxy_set_header   X-Real-IP         $remote_addr;
        proxy_set_header   X-Forwarded-Proto $scheme;
        proxy_set_header   X-Forwarded-For   $proxy_add_x_forwarded_for;
    }
}

server {
    listen 80;

    server_name 2fa.ohara.com;

    location / {
        proxy_pass http://192.168.0.111:8004;
    }
}

server {
    listen 80;

    server_name ost.ohara.com;

    location / {
        proxy_pass http://192.168.0.111:3000;

        client_max_body_size 0;
    }
}
