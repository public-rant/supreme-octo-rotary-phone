default: tests
tests:
	-mkdir $@
	@echo $(TESTS) | base64 -d | jq -r 'map("-e collection=\"\(.use.collection)\" tests/\(.name).spec.ts")[]' | xargs $(MAKE)



tests/%.spec.ts: tests
	@pandoc -M name=$* -M collection=$(collection) -f html -t gfm  --template draft.md $@ -o $@

dispatch:
	curl -L \
		-X POST \
		-H "Accept: application/vnd.github+json" \
		-H "Authorization: Bearer $$(gh auth token)" \
		-H "X-GitHub-Api-Version: 2022-11-28" \
		https://api.github.com/repos/public-rant/supreme-octo-rotary-phone/dispatches \
		-d '{ "event_type": "test", "client_payload": { "versions": ["$(TESTS)"] } }'
