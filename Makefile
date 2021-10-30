.PHONY: post
post:
	hugo new posts/$(postname).md

.PHONY: dev
dev:
	hugo serve -D