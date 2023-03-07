#!/bin/bash

# DEBUG: (un)comment for testing
set -e

source ./logtee.sh

echo "example begin"
sleep 3

# DEBUG: (un)comment for testing
false

# DEBUG: (un)comment for testing
exit 1

echo "example end"

