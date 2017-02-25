THEME=hugo-multi-bootswatch

all: build

build:
	hugo --theme ${THEME}

serve:
	hugo serve --theme ${THEME}

upload: build
	rsync -avz --exclude ".git" --progress public/ patrick@pridkett.xen.prgmr.com:public_html
