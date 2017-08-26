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
externalip=$MY_IP
server=1
listen=1
daemon=1
logtimestamps=1
bind=$MY_IP:18321
maxconnections=500
masternode=1
masternodeaddr=$MY_IP:18321
masternodeprivkey=XXXXXXXXX
stake=0
staking=0
EOF
