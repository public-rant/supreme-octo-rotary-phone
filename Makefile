default:
	curl -L \
		-X POST \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $$(gh auth token)" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		https://api.github.com/repos/public-rant/$$(dirname $(shell pwd)))/dispatches \
		-d '{ "event_type": "test", "client_payload": { "versions": ["18.x"] } }'

	
