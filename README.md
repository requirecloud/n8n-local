# n8n-local

Local Docker Compose setup to run n8n

## Requirements

- Docker and Docker Compose
- [Stonehenge](https://github.com/druidfi/stonehenge) - Uses Traefik as reverse proxy and handles SSL certificates.

## What is included?

- n8n main instance
- n8n worker instance
- Postgres database
- Valkey (opensource Redis alternative)

## Usage

Prepare configuration:

Copy `.env.dist` to `.env` and adjust the values.

## Start the containers:

```console
docker compose up --wait
```

Open https://n8n.docker.so

## Connect to locally running openai/gpt-oss-20b

On the OpenAI credential dialog, use the following info:

- Base URL with LM Studio: http://host.docker.internal:1234/v1
- Base URL with Ollama: http://host.docker.internal:11434/v1
- API Key: `whatever`

## Updating to new version

When Docker image tag for n8n updates in `compose.yaml:3` you can update to a new version with:

```console
docker compose up --wait
```

Then you can clean old image(s) with:

```console
docker image prune -a --force --filter "label=org.opencontainers.image.source=https://github.com/n8n-io/n8n"
```

## Files

A local directory `local-files` shared between the n8n instance and host. In n8n, use the `/files` path to read from
and write to this directory.

## Upgrading PostgreSQL

Check general instructions on https://blog.oxyconit.com/how-to-update-postgres-16-to-17-in-docker/

Create a backup in an old version:

```console
docker compose exec -it postgres /bin/bash -c 'pg_dumpall -U $POSTGRES_USER > /backup/dump.sql'
```

Import the backup in the new version:

```console
docker compose exec -it postgres /bin/bash -c 'psql -d $POSTGRES_DB -U $POSTGRES_USER < /backup/dump.sql'
```

# Other information

This was made based on the example from [github.com/n8n-io](https://github.com/n8n-io/n8n-hosting/tree/main/docker-compose/withPostgresAndWorker).
