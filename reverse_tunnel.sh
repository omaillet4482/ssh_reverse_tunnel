#!/bin/bash
echo " Reverse tunnel "
echo "ssh -v -o \"StrictHostKeyChecking=accept-new\" -i ${KEY_FILE} -N -R ${FORWARD_PORT}:${FORWARD_HOST}:${REMOTE_PORT} ${TARGET_USER}@${TARGET_HOST}"
ssh -v -o "StrictHostKeyChecking=accept-new"  -i ${KEY_FILE} -N -R ${FORWARD_PORT}:${FORWARD_HOST}:${REMOTE_PORT} ${TARGET_USER}@${TARGET_HOST}

