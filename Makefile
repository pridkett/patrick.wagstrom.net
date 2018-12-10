THEME=hugo-multi-bootswatch
HUGO_BUILD_OPTS=--log --logFile hugo.log
HUGO_SERVE_LOGFILE=hugo_serve.log
HUGO_SERVE_OPTS=-v --debug --log --logFile ${HUGO_SERVE_LOGFILE} --verboseLog --disableFastRender

all: build

build:
	hugo ${HUGO_BUILD_OPTS} --theme ${THEME}

serve:
	hugo serve ${HUGO_SERVE_OPTS} --theme ${THEME}

upload: build
	rsync -avz --exclude ".git" --progress public/ patrick@pridkett.xen.prgmr.com:public_html
