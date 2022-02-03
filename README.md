# php-docker

Docker image for PHP under build environments

[View latest container image](https://github.com/enginedigital/php-docker/pkgs/container/php-docker)

### Includes

- [PHP 8.1](https://hub.docker.com/layers/php/library/php/8.1.0-cli/images/sha256-701743472c7523acb4bacb9adf9caf19fec27cd4486ec17e5d0fa89b7476582d?context=explore)
- `zip`
- `autoconf`
- `intl`
- `opcache`
- `gmp`
- increased `memory_limit`
- enabled `jit`

### Building

```sh
docker build -t php81 .
```

### Running Locally

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash php81
```

If you are using docker-compose, you may want to consider using [:cached](https://docker-docs.netlify.app/docker-for-mac/osxfs-caching/#tuning-with-consistent-cached-and-delegated-configurations) volumes to improve performance.

### Running Remotely

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash ghcr.io/enginedigital/php-docker:main
```
