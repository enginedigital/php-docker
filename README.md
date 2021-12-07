# php-docker

Docker image for PHP under build environments

### Building

```sh
docker build -t php81 .
```

### Running

```sh
docker run -it --volume="$PWD:/app" --workdir="/app" --entrypoint=/bin/bash php81
```
