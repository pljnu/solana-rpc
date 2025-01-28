#!/bin/bash

exec jito-shredstream-proxy shredstream \
    --block-engine-url https://ny.mainnet.block-engine.jito.wtf \
    --auth-keypair /home/sol/my_keypair.json \
    --desired-regions ny \
    --dest-ip-ports 127.0.0.1:8001