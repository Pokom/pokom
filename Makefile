.PHONY: post
post:
	hugo new posts/$(postname).md

.PHONY: dev
dev:
	hugo serve -D

baseurl = http://localhost:8081/public
.PHONY: build
build:
	hugo -D -b $(baseurl)