#!/bin/bash

source ./logtee.sh

# DEBUG: (un)comment for testing
#echo "set -e" && set -e

echo "==== example begin ===="
sleep 3

# DEBUG: (un)comment for testing
#echo "TEST error(1)" && false

# DEBUG: (un)comment for testing
#echo "TEST exit(2)" && exit 2

echo "==== example end ===="

