#! /usr/bin/env sh
HOST_STRING="$REMOTE_USER@$REMOTE_HOST"

# If the password is defined add it to the host string
if [ -n "$REMOTE_PASS" ]; then
    sshpass -p $REMOTE_PASS \
        ssh -nNT \
            -o ServerAliveInterval=$ALIVE_INTERVAL \
            -o StrictHostKeyChecking=no \
            -i $KEYFILE_LOCATION \
            -L *:$LOCAL_PORT:0.0.0.0:${REMOTE_TARGET_PORT} $HOST_STRING \
            -p $REMOTE_PORT
else
    ssh -nNT \
        -o ServerAliveInterval=$ALIVE_INTERVAL \
        -o StrictHostKeyChecking=no \
        -i $KEYFILE_LOCATION \
        -L *:$LOCAL_PORT:0.0.0.0:${REMOTE_TARGET_PORT} $HOST_STRING \
        -p $REMOTE_PORT
fi

