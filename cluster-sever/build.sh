#!/usr/bin/bash -eux

TS=`date "+%Y%m%d-%H%M"`
mkdir -p /fast/cluster-server-template/${TS}

# delete all files before starting to build VM images
make clean

# base ubuntu image
make ubuntu
rm -rf /mnt/ramfs/ubuntu-2204-cdinstall

# cluster
make cluster
cp /mnt/ramfs/ubuntu-2204-cluster-server/ubuntu-2204-cluster-server.ova /fast/cluster-server-template/${TS}/
rm -rf /mnt/ramfs/ubuntu-2204-cluster-server


