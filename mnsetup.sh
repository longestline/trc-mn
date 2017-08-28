#!/bin/bash


MY_IP=`ip route get 1 | awk '{print $NF;exit}'`
RPCP=$(date +%s | sha256sum | base64 | head -c 32 ;)
mkdir -p ~/.terracoincore/


cat > ~/.terracoincore/terracoin.conf <<EOF
rpcuser=trc
rpcpassword=$RPCP
rpcallowip=127.0.0.1
rpcport=18320
port=18321
server=1
listen=1
daemon=1
logtimestamps=1
maxconnections=256
masternode=1
masternodeprivkey=XXXXXXXXX
EOF
