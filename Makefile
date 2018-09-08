#!/usr/bin/make -f
SHELL=/bin/sh

git-whoami:
	crystal build src/git-whoami.cr

.PHONY: build
build: git-whoami

.PHONY: clean
clean:
	yes | rm git-whoami git-whoami.dwarf || true
