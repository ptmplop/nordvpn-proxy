#!/bin/bash

set -e

# Run the entrypoint
/config > /dev/stdout 2> /dev/stdout || exit 1

# Keep the container alive (is this the best way really?)
#while true; do sleep 1000; done
