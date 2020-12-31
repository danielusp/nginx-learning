pull:
	docker pull nginx:alpine
	docker pull node:current-alpine3.12

stop:
	@echo "Stopping..."
	@docker stop dev-nginx

	@echo "Stopped..."

sh:
	@docker exec -it dev-nginx sh

simpleserver:
	@echo "Loading simple server..."
	@docker run --rm -p 8080:8080 --name dev-nginx -v ${PWD}/examples/simple-server/configs/nginx.conf:/etc/nginx/nginx.conf -v ${PWD}/examples/simple-server/www:/usr/share/nginx/simple-server:ro -d nginx:alpine

	@echo "Simple server up and running"

locationserver:
	@echo "Loading location server..."
	@docker run --rm -p 8080:8080 --name dev-nginx -v ${PWD}/examples/location/configs/nginx.conf:/etc/nginx/nginx.conf -v ${PWD}/examples/location:/usr/share/nginx/location:ro -d nginx:alpine
	
	@echo "Location server up and running"

proxyserver:
	@echo "Loading proxy server..."
	@docker run --rm -p 8080:8080 -p 8888:8888 --name dev-nginx -v ${PWD}/examples/proxy/configs/nginx.conf:/etc/nginx/nginx.conf -v ${PWD}/examples/proxy:/usr/share/nginx/proxy:ro -d nginx:alpine
	
	@echo "Proxy server up and running"

loadbalance:
	@echo "Loading Node servers..."
	@bash ${PWD}/examples/loadbalance/run.sh

	@sleep 20

	@echo "Loading NGINX load balance..."
	@docker run --rm --network="host" --name dev-nginx -v ${PWD}/examples/loadbalance/configs/nginx.conf:/etc/nginx/nginx.conf:ro -d nginx:alpine

	@docker ps

	@echo "Load balance up and running"

loadbalancestop:
	@echo "Stopping load balance..."
	@docker stop NODE-APP-1 NODE-APP-2 NODE-APP-3 dev-nginx
	
	@echo "Load balance stopped"