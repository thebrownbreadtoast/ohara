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
		proxy_set_header Referer '';
	}
}

server {
	listen 80;

	server_name komga.ohara.com;

	location / {
		proxy_pass http://192.168.0.111:25600;
	}
}

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
	}
}
