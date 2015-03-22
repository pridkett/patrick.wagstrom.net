all: personal weblog

personal:
	cd new; npm install
	cd new; bower install
	cd new; wintersmith build
	rsync -avz new/build/ public

weblog:
	cd engineer; engineer build
	rsync -avz engineer/output/ public/weblog

serve:
	cd public; python -m SimpleHTTPServer 8000

upload:
	rsync -avz --progress --delete public/ patrick@pridkett.xen.prgmr.com:/www/patrick

clean:
	rm -rf engineer/output
	rm -rf new/build
