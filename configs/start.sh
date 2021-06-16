#!/bin/bash

set -e

# Run the entrypoint
/config > /dev/stdout 2> /dev/stdout || exit 1
