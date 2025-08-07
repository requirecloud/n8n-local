# n8n-local

Local Docker Compose setup to run n8n

## Requirements

- Docker and Docker Compose
- [Stonehenge](https://github.com/druidfi/stonehenge) - Uses Traefik as reverse proxy and handles SSL certificates.

## Usage

Prepare configuration:

Copy `.env.dist` to `.env` and adjust the values.

## Start the containers:

```console
docker compose up --wait
```

Open https://n8n.docker.so

## Connect to locally running openai/gpt-oss-20b in LM Studio

On the OpenAI credential dialog, use the following info:

- Base URL: http://host.docker.internal:1234/v1
- API Key: `whatever`

## Files

A local directory `local-files` shared between the n8n instance and host. In n8n, use the `/files` path to read from
and write to this directory.

# Other information

This was made based on the example from [github.com/n8n-io](https://github.com/n8n-io/n8n-hosting/tree/main/docker-compose/withPostgresAndWorker).
