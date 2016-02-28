'use strict';

var fs = require('fs');
var bibtex = require('bibtex-parse-js');

const SOURCE_FILE = 'content/publications/papers.bib';

const FILTERS = [
    { tag : 'mypapers:journal', prefix : 'J', outfile : 'data/bib/journal.json'},
    { tag : 'mypapers:conference', prefix : 'C', outfile: 'data/bib/conference.json'},
    { tag : 'mypapers:workshop', prefix : 'W', outfile: 'data/bib/workshop.json'},
    { tag : 'mypapers:bookchapter', prefix : 'BC', outfile: 'data/bib/bookchapter.json'},
    { tag : 'mypapers:poster', prefix : 'P', outfile: 'data/bib/poster.json'},
    { tag : 'mypapers:techreport', prefix : 'TR', outfile: 'data/bib/techreport.json'},
];

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
function filterEntries (data, filter) {
    if (!(filter instanceof Function)) {
        var ft = filter;
        filter = function (indata) {
            var keywords = indata.entryTags.keywords || '';
            keywords = keywords.split(',').map(function (d) { return d.trim(); });
            return keywords.indexOf(ft) !== -1;
        };
    }

    var fd = data.filter(filter);
    return fd;
};

/**
 * given a list of BibTeX entries, create a nice list of formatted citations
 */
function toHtmlList (data, prefix, digits) {

    /**
     * given a set of entryTags create a valid javascript date from the object
     */
    function generateDate(entry) {
        var monthMapping = { "jan": 0, "feb": 1, "mar": 2, "apr": 3,
                             "may": 4, "jun": 5, "jul": 6, "aug": 7,
                             "sep": 8, "oct": 9, "nov": 10, "dec": 11 },
            year = 1969,
            month = 0,
            day = 1;

        year = parseInt(entry.entryTags.year, 10);
        if (entry.entryTags.month) {
            month = monthMapping[entry.entryTags.month.toLowerCase().trim()];
        }

        if (month === null || month === undefined) {
            month = 0;
        }

        return new Date(year, month, day);
    }

    function zeropad(num, digits) {
        var pad = '000000000000000000000',
            rv = num.toString();

        digits = digits || 2;

        if (rv.length >= digits) {
            return rv;
        }
        return pad.slice(rv.length - digits) + rv;
    }

    var allEntries = [];
    prefix = prefix || '';
    digits = digits || 2;
    data.forEach(function (elem, idx, arr) {
        data[idx].date = generateDate(elem);
    });

    data.sort(function (a,b) {
        return a.date - b.date;
    });

    data.forEach(
        function (elem, idx, arr) {
            // extract the URL from the file
            var linkstart = '',
                linkstop = '',
                edstring,
                thisentry,
                entrycounter = prefix + zeropad(idx + 1, digits);

            (elem.entryTags.file || '').split(';').forEach(function (f) {
                // parts = shortname, longname, mime
                var parts = f.split(':');
                if (parts.pop() === 'application/pdf') {
                    linkstart = '<a href="' + parts[0] + '">';
                    linkstop = '</a>';
                }
            });

            thisentry = '<li class="bibliograph-entry"><span class="counter">[' + entrycounter + ']</span><span class="authors">' + elem.entryTags.author + '</span><span class="title">' + linkstart + elem.entryTags.title.replace(/[{}]/g, '') + linkstop + '</span>';

            switch (elem.entryType) {
            case 'article':
                thisentry += '<span class="journal">' + elem.entryTags.journal.replace(/[{}]/g, '') + '</span>';
                break;
            case 'incollection':
                thisentry += 'in <span class="booktitle">' + elem.entryTags.booktitle.replace(/[{}]/g, '') + '</span>';
                break;
            case 'techreport':
                thisentry += 'Technical Report &mdash;';
                break;
            default:
                thisentry += 'in <span class="booktitle">' + elem.entryTags.booktitle.replace(/[{}]/g, '') + '</span>';
                break;
            }

            if (elem.entryTags.editor !== undefined) {
                edstring = ' Ed';
                if (elem.entryTags.editor.indexOf(' and ') !== -1) {
                    edstring = ' Eds';
                }
                thisentry += '<span class="editors">' + elem.entryTags.editor + edstring + '</span>';
            }

            if (elem.entryTags.address !== undefined) {
                thisentry += '<span class="address">' + elem.entryTags.address.replace(/[{}]/g, '') + '</span>';
            }
            
            if (elem.entryTags.publisher !== undefined) {
                thisentry += '<span class="publisher">' + elem.entryTags.publisher.replace(/[{}]/g, '') + '</span>';
            }
            
            if (elem.entryTags.volume !== undefined) {
                thisentry += '<span class="volume"> vol. ' + elem.entryTags.volume + '</span>';
            }
            
            if (elem.entryTags.number !== undefined) {
                thisentry += '<span class="number">no. ' + elem.entryTags.number.replace(/[{}]/g, '') + '</span>';
            }
            
            if (elem.entryTags.pages !== undefined) {
                thisentry += '<span class="pages">pp ' + elem.entryTags.pages.replace(/--/g, '&mdash;') + '</span>';
            }
            
            if (elem.entryTags.year !== undefined || elem.entryTags.month !== undefined) {
                thisentry += '<span class="date">';
                if (elem.entryTags.month !== undefined) {
                    var month = elem.entryTags.month;
                    month = month.charAt(0).toUpperCase() + month.slice(1);
                    thisentry += '<span class="month">' + month + '</span>';
                }
                
                if (elem.entryTags.year !== undefined) {
                    thisentry += '<span class="year">' + elem.entryTags.year + '</span>';
                }
                thisentry += '</span>';
            }
            
            if (elem.entryTags.doi !== undefined) {
                thisentry += '<span class="doi"><a href="http://dx.doi.org/' + elem.entryTags.doi + '">' + elem.entryTags.doi + '</a></span>';
            }
            
            thisentry += '</li>';
            allEntries.push(thisentry);
        }
    );
    return allEntries.join('\n');
};

function dumpFile(data) {
    var json = bibtex.toJSON(data);
    FILTERS.map((filter) => {
        let html = toHtmlList(filterEntries(json, filter.tag), filter.prefix);
        fs.writeFile(filter.outfile, JSON.stringify({html: html}), (err) => {
            if (err) {
                throw err;
            }
        });
    });
}

fs.readFile('content/publications/papers.bib', (err, data) => {
    if (err) {
        throw err;
    }

    // work around a bug in Zotero where not all months are enclosed in braces
    data = data.toString('UTF-8').replace(/month\s*=\s*([a-zA-Z]+)/g, 'month = {$1}');
    dumpFile(data);
});

