default: tests
tests:
	-mkdir $@
	@echo $(TESTS) | base64 -d | jq -r 'map("-e collection=\"\(.use?.collection)\" tests/\(.name).spec.ts")[]' | xargs $(MAKE)



tests/%.spec.ts: tests
	@pandoc -M name=$* -M collection=$(collection) -f html -t gfm  --template draft.md $@ -o $@
