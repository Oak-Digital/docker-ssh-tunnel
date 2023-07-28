#! /usr/bin/env sh
ssh -nNT -o ServerAliveInterval=$ALIVE_INTERVAL -o StrictHostKeyChecking=no -i $KEYFILE_LOCATION -L *:$LOCAL_PORT:0.0.0.0:${REMOTE_TARGET_PORT} $REMOTE_USER@$REMOTE_HOST -p $REMOTE_PORT
