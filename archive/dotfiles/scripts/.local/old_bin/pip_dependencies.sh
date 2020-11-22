#!/bin/sh
# This script checks the dependencies for a given
# pip package

PACKAGE=$1
pip3 download $PACKAGE -d /tmp --no-binary :all: \
| grep Collecting \
| cut -d' ' -f2 \
| grep -Ev "$PACKAGE(~|=|\!|>|<|$)"
