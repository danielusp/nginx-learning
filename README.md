# NGINX examples (with docker)

## Start the examples

Download nginx image to your local machine 

```bash
make build
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

Look at a **host A** and return the content throw **host B**

In this example, nginx starts two pots, 8080 and 8888 at the same time. Port 8080 serves the real content (html/images), port 8888 is a proxy that watch at 8080

```bash
make proxyserver
```

- Access the root server at http://localhost:8080
- Access http://localhost:8080 through proxy http://localhost:8888 (same content from 8080)
- Access an image at http://localhost:8080/images/dog.jpg
- Access the image http://localhost:8080/images/dog.jpg through proxy http://localhost:8888/img/dog.jpg
- All configs and sources at *examples/proxy/*


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

Reload server with new configs

```bash
nginx -s reload
```

Run server

```bash
nginx
```

## Good resource

- https://www.youtube.com/watch?v=WC2-hNNBWII&t=126s