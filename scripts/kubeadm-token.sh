#!/usr/bin/env bash

set -e

# Extract "host" and ""ssh_key" arguments from the input into respective shell variables
eval "$(jq -r '@sh "HOST=\(.host) SSH_KEY=\(.ssh_key)"')"

# Fetch the join command
CMD=$(ssh -i ${SSH_KEY} -o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null \
    root@$HOST kubeadm token create --print-join-command)

# Produce a JSON object containing the join command
jq -n --arg command "$CMD" '{"command":$command}'
