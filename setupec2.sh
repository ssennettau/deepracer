#!/bin/bash
# Clone git repository
cd ~
git clone --recurse-submodules https://github.com/crr0004/deepracer.git

# Pull and Run Minio in background
cat deepracer/rl_coach/env.sh | sed --expression='s/export //g' > miniovars.list
docker run -p 9000:9000 --env-file miniovars.list -v /mnt/data:/data minio/minio server /data > /dev/null 2>&1 &

# Getting Public IP
curl http://169.254.169.254/latest/meta-data/public-ipv4

