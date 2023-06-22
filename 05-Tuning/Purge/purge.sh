#!/bin/bash

SCRIPTNAME=${0##*/}

function print_usage() {
    echo "$SCRIPTNAME <URI (grep pattern)> <cache directory>."
}

if [ $# -ne 2 ]; then
    print_usage
    exit 1
fi

function get_cache_files() {
    local max_parallel=${3-16}
    find $2 -maxdepth 1 -type d | xargs -P $max_parallel -n 1 grep -ERl "^KEY:.*$1" | sort -u
}

function nginx_cache_purge_item() {
    local cache_files

    [ -d $2 ] || exit 2
    cache_files=$(get_cache_files "$1" $2)

    if [ -n "$cache_files" ]; then
        for i in $cache_files; do
            [ -f $i ] || continue
            echo "Deleting $i from $2."
            rm $i
        done
    else
        echo "$1 is not cached."
        exit 3
    fi
}

nginx_cache_purge_item $1 $2
