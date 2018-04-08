#!/bin/bash
PKG_BUILD_DIR=$1
curl http://ftp.apnic.net/apnic/stats/apnic/delegated-apnic-latest | grep -F ipv4 | grep -F CN | awk -F\| '{ printf("%s/%d\n", $4, 32-log($5)/log(2)) }' >"$PKG_BUILD_DIR/chnroute_new.txt"
[ -s "$PKG_BUILD_DIR/chnroute_new.txt" ] && cp -f "$PKG_BUILD_DIR/chnroute_new.txt" "$PKG_BUILD_DIR/chnroute.txt"
gzip -c "$PKG_BUILD_DIR/chnroute.txt" >"$PKG_BUILD_DIR/chnroute.gz"
