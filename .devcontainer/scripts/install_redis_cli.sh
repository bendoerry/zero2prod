#!/usr/bin/env bash
set -x
set -eo pipefail

curl -fsSL https://packages.redis.io/gpg | sudo gpg --dearmor -o /usr/share/keyrings/redis-archive-keyring.gpg

echo "deb [signed-by=/usr/share/keyrings/redis-archive-keyring.gpg] https://packages.redis.io/deb $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/redis.list

sudo apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && sudo apt-get -y install redis \
    && sudo apt-get autoremove -y && sudo apt-get clean -y
