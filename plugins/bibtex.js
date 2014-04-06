var fs = require("fs");
var bibtex = require("bibtex-parse-js");

module.exports = function(env, callback) {
    env.helpers.bibtex = {};

    env.helpers.bibtex.parse = function(filename) {
	var text = fs.readFileSync(filename, "utf8");
	var json = bibtex.toJSON(text);
	return json;
    };

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
	console.log(fd.length);
	return fd;
    };

    callback();
};
