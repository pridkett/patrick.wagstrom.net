#!/bin/sh
cat ipaddr.banned  | sed -e "s/^Host=\[\(\([0-9]\{1,3\}\.\)\{3\}[0-9]\{1,3\}\)\].*$/\1/" | sort | uniq
