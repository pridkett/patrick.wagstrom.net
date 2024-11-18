THEME=hugo-theme-patrick-custom
HUGO_BUILD_OPTS=--log --logFile hugo.log --verbose
HUGO_SERVE_LOGFILE=hugo_serve.log
HUGO_SERVE_OPTS=-v --debug --logLevel info  --disableFastRender -D -F

all: build

build:
	hugo ${HUGO_BUILD_OPTS} --theme ${THEME}

serve:
	hugo server ${HUGO_SERVE_OPTS} --theme ${THEME}

upload: build
	rsync -avz --exclude ".git" --progress public/ patrick@pridkett.xen.prgmr.com:public_html
