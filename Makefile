ROOT_DIR=$(realpath .)
MACRO_SRC=$(ROOT_DIR)/macros
MACRO_DIR=$(ROOT_DIR)/macros.processed
SITE_DIR=site
PUBLISH_DIR=publish

TIDYP_CONFIG=$(MACRO_DIR)/tidyp.config
GPP_OPTIONS=-H -I $(MACRO_DIR) --include macros.gpp -DRELBASE=$(pdpath)
PANDOC_OPTIONS=-f markdown -t html5
TIDYP_OPTIONS=-m -config $(TIDYP_CONFIG)
RSYNC_OPTIONS=-rva --exclude="*.md"
SED_OPTIONS=-i'' -r

MD_FILES := $(shell find $(SITE_DIR) -type f -name '*.md')
HTML_FILES := $(patsubst $(SITE_DIR)/%.md, $(PUBLISH_DIR)/%.html,$(MD_FILES))

.PHONE: all

# Modify the sed options based on operating system
# I probably should also check $(OS) to see if it is WINDOWS_NT first,
# as explained in this answer:
# http://stackoverflow.com/questions/714100/os-detecting-makefile
UNAME := $(shell uname -s)
ifeq ($(UNAME), Linux)
	SED_OPTIONS += -e
endif
ifeq ($(UNAME), Darwin)
	SED_OPTIONS += -E
endif

all: $(MACRO_DIR) $(HTML_FILES)
	rsync $(RSYNC_OPTIONS) site/ publish

# this is a set of BSD specific commands to remove leading spaces from the
# templates. Without this set of commands pandoc tends to choke on the HTML
$(MACRO_DIR):
	mkdir -p $(MACRO_DIR)
	cp -r $(MACRO_SRC)/* $(MACRO_DIR)
	find $(MACRO_DIR) -name "*.html" -exec sed $(SED_OPTIONS) "s/^[[:space:]]+//" '{}' \;

# pdpath is an environment variable that is set for each file before it is
# processed by gpp. I forget what it originally stood for, but it is now used
# to set the value of the RELBASE macro used by gpp.
publish/%.html: pdpath = "$(shell python -c "import os.path; print os.path.relpath('$(ROOT_DIR)/$(PUBLISH_DIR)', '$(@D)')")"

publish/%.html: site/%.md
	mkdir -p "$(@D)"
	gpp $(GPP_OPTIONS) $< | pandoc $(PANDOC_OPTIONS) -o $@
	# tidy exits with error code 1 for warnings - not certain if we can have
	# make ignore just error code 0 and 1, so ignore them all
	-tidy $(TIDYP_OPTIONS) $@

clean:
	rm -rf publish $(MACRO_DIR)
