ROOT_DIR=$(realpath .)
MACRO_SRC=$(ROOT_DIR)/macros
MACRO_DIR=$(ROOT_DIR)/macros.processed
SITE_DIR=site
PUBLISH_DIR=publish

TIDYP_CONFIG=$(MACRO_DIR)/tidyp.config
GPP_OPTIONS=-H -I $(MACRO_DIR) --include macros.gpp -DRELBASE=$(pdpath)
PANDOC_OPTIONS=-f markdown -t html5
TIDYP_OPTIONS=-config $(TIDYP_CONFIG)
RSYNC_OPTIONS=-rva --exclude="*.md"

MD_FILES := $(shell find $(SITE_DIR) -type f -name '*.md')
HTML_FILES := $(patsubst $(SITE_DIR)/%.md, $(PUBLISH_DIR)/%.html,$(MD_FILES))

.PHONE: all

all: $(MACRO_DIR) $(HTML_FILES)
	rsync $(RSYNC_OPTIONS) site/ publish

# this is a set of BSD specific commands to remove leading spaces from the
# templates. Without this set of commands pandoc tends to choke on the HTML
$(MACRO_DIR):
	mkdir -p $(MACRO_DIR)
	cp -r $(MACRO_SRC)/* $(MACRO_DIR)
	find $(MACRO_DIR) -name "*.html" -exec sed -i'' -r -E "s/^[[:space:]]+//" '{}' \;

# publish/%.html: pdpath = "$(shell dirname $< | sed -e 's|[^/]||g' | sed -e 's|/|../|g')"
publish/%.html: pdpath = "$(shell python -c "import os.path; print os.path.relpath('$(ROOT_DIR)/$(PUBLISH_DIR)', '$(@D)')")"

publish/%.html: site/%.md
	mkdir -p "$(@D)"
	gpp $(GPP_OPTIONS) $< | pandoc $(PANDOC_OPTIONS) | tidy $(TIDYP_OPTIONS) -o $@

dummy:
	#pdpath := $(shell dirname $< | sed -e 's/[\^\/]//g')
	# pdpath := $(shell dirname $< | sed -e 's/[^\/]//g' | sed -e 's/\//..\//g' | sed -e 's/^$/\//')

clean:
	rm -rf publish $(MACRO_DIR)
