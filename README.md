# NGINX examples (with docker)

## Start examples

Download nginx image to your local machine 

```bash
make pull
```

### Simple server

Run a simple server into PORT 8080

```bash
make simpleserver
```

- Access the server at http://localhost:8080
- All configs and sources at *examples/simple-server/*

### Location server

Run example

```bash
make locationserver
```

- Access the root server at http://localhost:8080
- Access an image at http://localhost:8080/images/dog.jpg
- All configs and sources at *examples/location/*

### Proxy server

Look at a **host A** and return the content through **host B**

In this example, nginx starts two pots, 8080 and 8888 at the same time. Port 8080 serves the real content (html/images), port 8888 is a proxy that watch at 8080

```bash
make proxyserver
```

- Access the root server at http://localhost:8080
- Access http://localhost:8080 through proxy http://localhost:8888 (same content from 8080)
- Access an image at http://localhost:8080/images/dog.jpg
- Access the image http://localhost:8080/images/dog.jpg through proxy http://localhost:8888/img/dog.jpg
- All configs and sources at *examples/proxy/*

### Proxy load balance

Provides a load balance between servers by a proxy

In this example nginx make a load balance between three node servers at ports 1000, 2000 and 3000

```bash
make loadbalance
```

- At first we start three simple nodejs servers (http://localhost:1000/, http://localhost:2000/ and http://localhost:3000/)
- After that we start the nginx with a proxy balance.
- Access http://localhost. Every time we reload the server, nginx proxy connect us to a different node server
- All configs and sources at *examples/loadbalance/*

To stop this example

```bash
make loadbalancestop
```

### Stop nginx

Just run

```bash
make stop
```

## NGINX basic commands

In order to use these commands you need to log inside OS container

```bash
make sh
```

Stop server

```bash
nginx -s stop
```

Restart server

```bash
nginx -s reload
```

Run server

```bash
nginx
```

## Good resource

- https://www.youtube.com/watch?v=WC2-hNNBWII&t=126s