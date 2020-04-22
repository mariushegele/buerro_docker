
# Instructions

```
git submodule update --init --recursive
docker build -t buerro .
docker run -p 49160:8080 -d buerro
```

## Run Mock Tests

```
docker run -it buerro make test
```

## Deploy

This requires setting API keys as environment variables (`.env`) in the `buerro` directory.

Open your browser at `localhost:49160`.

To stop the docker use `docker ps` and `docker stop <container id>`.
