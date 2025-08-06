# n8n-local

Local Docker Compose setup to run n8n

## Requirements

- Docker and Docker Compose
- [Stonehenge](https://github.com/druidfi/stonehenge)

## Usage

Prepare configuration:

Copy `.env.dist` to `.env` and adjust the values.

## Start the containers:

```console
docker compose up --wait
```

Open https://n8n.docker.so

## Connect to locally running OpenAI in LM Studio

On the OpenAI credential dialog, use the following info:

- Base URL: http://host.docker.internal:1234/v1
- API Key: `whatever`
