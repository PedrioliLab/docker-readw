#!/bin/bash

## Execute CMD passed by the user when statrting the image
exec /usr/local/bin/gosu user "$@"

