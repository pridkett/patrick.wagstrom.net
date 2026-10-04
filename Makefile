HUGO ?= hugo
THEME=hugo-theme-patrick-custom
HUGO_BUILD_OPTS=--logLevel info
HUGO_SERVE_LOGFILE=hugo_serve.log
HUGO_SERVE_OPTS=--logLevel info  --disableFastRender -D -F

.PHONY: all build check serve upload

all: build

build:
	${HUGO} ${HUGO_BUILD_OPTS} --theme ${THEME}

check:
	python3 scripts/check-hugo.py --hugo "${HUGO}"

serve:
	${HUGO} server ${HUGO_SERVE_OPTS} --theme ${THEME}

upload: build
	rsync -avz --exclude ".git" --progress public/ patrick@pridkett.xen.prgmr.com:public_html
