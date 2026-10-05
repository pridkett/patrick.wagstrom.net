HUGO ?= hugo
HUGO_BUILD_OPTS=--logLevel info
HUGO_SERVE_LOGFILE=hugo_serve.log
HUGO_SERVE_OPTS=--logLevel info  --disableFastRender -D -F

.PHONY: all build check check-feeds-http serve upload

all: build

build:
	${HUGO} ${HUGO_BUILD_OPTS}

check:
	python3 scripts/check-hugo.py --hugo "${HUGO}"

# Optional server integration check; requires Caddy in addition to Hugo.
check-feeds-http:
	python3 scripts/check-feed-http.py --hugo "${HUGO}"

serve:
	${HUGO} server ${HUGO_SERVE_OPTS}

upload: build
	rsync -avz --exclude ".git" --progress public/ patrick@pridkett.xen.prgmr.com:public_html
