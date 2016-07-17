THEME=hugo-multi-bootswatch

all: weblog

weblog:
	hugo --theme ${THEME}

serve:
	hugo serve --theme ${THEME}

upload:
	rsync -avz --exclude ".git" --delete --progress public/ patrick@pridkett.xen.prgmr.com:/www/patrick

dockerize:
	rsync -avz --exclude ".git" --delete --progress . core@104.131.98.133:www

clean:
	rm -rf engineer/output
	rm -rf new/build
