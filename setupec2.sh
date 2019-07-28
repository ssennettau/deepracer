#!/bin/bash
# Clone ncessary git repositories
mkdir ~/deepracer
cd ~/deepracer
https://github.com/ssennettau/deepracer.git
mkdir ~/crr0004
cd ~/crr0004
git clone --recurse-submodules https://github.com/crr0004/deepracer.git
cd ~

# Pull and Run Minio in background
cat ~/crr0004/deepracer/rl_coach/env.sh | sed --expression='s/export //g' > ~/miniovars.list
docker run -p 9000:9000 --env-file ~/miniovars.list -v /mnt/data:/data ~/minio/minio server /data > /dev/null 2>&1 &

# Getting Public IP
echo
echo --- Minio Running ---
echo http://$(curl -s http://169.254.169.254/latest/meta-data/public-ipv4):9000
echo
