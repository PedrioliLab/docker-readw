#!/bin/bash

# Allow ids of user inside the docker to be customized.
# Either use the LOCAL_USER_ID and LOCAL_GROUP_ID, if passed in at runtime or
# fallback

USER_ID=${LOCAL_USER_ID:-9001}
GROUP_ID=${LOCAL_GROUP_ID:-250}

echo usermod -u $USER_ID user
usermod -u $USER_ID user
echo groupmod -g $GROUP_ID userg
groupmod -g $GROUP_ID userg

## Execute CMD passed by the user when statrting the image
exec /usr/local/bin/gosu user "$@"

