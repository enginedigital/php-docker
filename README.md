# php-docker

Docker image for PHP under build environments

[View latest container image](https://github.com/enginedigital/php-docker/pkgs/container/php-docker)

### Building

```sh
docker build -t php81 .
```

### Running Locally

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash php81
```

### Running Remotely

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash ghcr.io/enginedigital/php-docker:main
```
