PHONY :=

PHONY += update
update:
	docker compose up --wait
	docker image prune -a --force --filter "label=org.opencontainers.image.source=https://github.com/n8n-io/n8n"

.PHONY: $(PHONY)
