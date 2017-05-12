THEME=hugo-multi-bootswatch
HUGO_BUILD_OPTS="--log --logFile hugo.log"
HUGO_SERVE_OPTS=""

all: build

build:
	hugo ${HUGO_BUILD_OPTS} --theme ${THEME}

serve:
	hugo serve ${HUGO_SERVE_OPTS} --theme ${THEME}

upload: build
	rsync -avz --exclude ".git" --progress public/ patrick@pridkett.xen.prgmr.com:public_html
