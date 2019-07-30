#!/usr/bin/env bash

set -e

source ~/.secrets/.cloudflare

while read x; do
    echo "updating $x ..."
    flares --email=$CF_API_EMAIL --key=$CF_API_KEY  $x | grep -v ";;" > ./$x
done < ./domain-list

