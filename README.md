# php-docker

Docker image for PHP under build environments

[View latest container image](https://github.com/enginedigital/php-docker/pkgs/container/php-docker)

### Includes

- [PHP serversideup/php:8.3-cli](https://hub.docker.com/r/serversideup/php/tags?name=8.3-cli&page=1&ordering=-name)
- `zip`
- `intl`
- `opcache`
- `gd`
- `bcmath`
- `gmp`
- `exif`
- increased `memory_limit`
- enabled `jit`

### Building

```sh
docker build -t php-docker .
```

### Running Locally

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash php-docker:latest
```

### Running Remotely

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash ghcr.io/enginedigital/php-docker:main
```
