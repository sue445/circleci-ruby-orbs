VERSION  := $(shell cat VERSION)

.PHONY: tag
tag:
	git tag -a $(VERSION) -m "Release v$(VERSION)"
	git push --tags

.PHONY: release
release: tag
	git push origin master
