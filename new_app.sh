#!/usr/bin/env zsh

# input : app_name
# output:
# app_name
# ├── .alias
# ├── .path
# ├── .source


# check input
if [ -z "$1" ]; then
    echo "Usage: new.sh <app_name>"
    exit 1
fi

# create folder
mkdir -p $1

# create subfolders
mkdir -p $1/.alias
mkdir -p $1/.path
mkdir -p $1/.source
