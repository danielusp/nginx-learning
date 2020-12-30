build:
	docker pull nginx:alpine

run:
	docker run --rm -p 80:80 --name dev-nginx -v ${PWD}/www:/usr/share/nginx/html:ro -d nginx:alpine

stop:
	docker stop dev-nginx

sh:
	docker exec -it dev-nginx sh

simpleserver:
	docker run --rm -p 8080:8080 --name dev-nginx -v ${PWD}/examples/simple-server/configs/nginx.conf:/etc/nginx/nginx.conf -v ${PWD}/examples/simple-server/www:/usr/share/nginx/simple-server:ro -d nginx:alpine

locationserver:
	docker run --rm -p 8080:8080 --name dev-nginx -v ${PWD}/examples/location/configs/nginx.conf:/etc/nginx/nginx.conf -v ${PWD}/examples/location:/usr/share/nginx/location:ro -d nginx:alpine

proxyserver:
	docker run --rm -p 8080:8080 -p 8888:8888 --name dev-nginx -v ${PWD}/examples/proxy/configs/nginx.conf:/etc/nginx/nginx.conf -v ${PWD}/examples/proxy:/usr/share/nginx/proxy:ro -d nginx:alpine