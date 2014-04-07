var fs = require("fs");
var bibtex = require("bibtex-parse-js");

module.exports = function(env, callback) {
    env.helpers.bibtex = {};

    /**
     * opens up a bibtex file and returns the content
     *
     * this is intentionally a synchronous method as the calling
     * functions inside of jinja templates don't appear to handle
     * asynchronous methods.
     *
     * @param {string{ filename the filename on the local filesystem to parse
     *
     * @return an {Array} of objects representing the bibtex output
     */
    env.helpers.bibtex.parse = function(filename) {
	var text = fs.readFileSync(filename, "utf8");
	// work around a bug in Zotero where not all months are enclosed in braces
	text = text.replace(/month\s*=\s*([a-zA-Z]+)/g,"month = {$1}");
	var json = bibtex.toJSON(text);
	return json;
    };

    /**
     * filters an array of BibTeX entries based on either the presence
     * of a keyword or an arbitrary function
     *
     * @param {Array} data an array of BibTeX entries, usually obtained from parse
     *
     * @param filter if a string then include only those entries with
     * that keyword set. If a function then use that function as the
     * filter function for the data.
     *
     * @return the filtered {Array} of entries
     */
    env.helpers.bibtex.filter = function(data, filter) {
	if (!(filter instanceof Function)) {
	    var ft = filter;
	    filter = function(indata) {
		var keywords = indata.entryTags.keywords || "";
		keywords = keywords.split(",").map(function(d) { return d.trim(); });
		return keywords.indexOf(ft) !== -1;
	    }
	}

	var fd = data.filter(filter);
	return fd;
    };

    callback();
};
