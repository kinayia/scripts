#!/usr/bin/env bash

set -e

function replace_str () {
    local workspace="${1}"
    local old_str="${2}"
    local new_str="${3}"
    if [ "${old_str}" = "${new_str}" ]; then
        return
    fi
    grep "${old_str}" -rl "${workspace}" |xargs -r sed -i "s/${old_str}/${new_str}/g"
}

function main () {
    if [ $# != 3 ]; then
        echo "usage: workspace old_str new_str"
        exit
    fi

    replace_str "$@"
}

main "$@"
