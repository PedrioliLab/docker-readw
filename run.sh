# Make sure to add /data/ in front of the file name to be converted.
#
# By default uid and gid of the converted files will match the ones of the current user.
# To override set the $USER_ID and $GROUP_ID to the desired target uid and gid

LOCAL_USER_ID=${USER_ID:-$(id -u)}
LOCAL_GROUP_ID=${GROUP_ID:-$(id -g)}

docker run -v $PWD:/data -e LOCAL_USER_ID=$LOCAL_USER_ID -e LOCAL_GROUP_ID=$LOCAL_GROUP_ID -it --rm ppatrick/readw wine /usr/local/bin/ReAdW.exe $@

