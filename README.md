# php-docker

Docker image for PHP under build environments

[View latest container image](https://github.com/enginedigital/php-docker/pkgs/container/php-docker)

### Includes

- [PHP v8.2.17](https://hub.docker.com/layers/library/php/8.2.17-cli/images/sha256-89dfe022094474dcc4e2b605da350b7d8ae1dafb50f8ff0ccca5b193df428a39?context=explore)
- `zip`
- `autoconf`
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
docker build -t php82 .
```

### Running Locally

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash php82
```

### Running Remotely

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash ghcr.io/enginedigital/php-docker:main
```
