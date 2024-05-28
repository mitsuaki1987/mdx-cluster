#!/usr/bin/bash -eux

TS=`date "+%Y%m%d-%H%M"`
mkdir -p /fast/cluster-client-template/${TS}

# delete all files before starting to build VM images
make clean

# base ubuntu image
make ubuntu
rm -rf /mnt/ramfs/ubuntu-2204-cdinstall

# cluster
make cluster
cp /mnt/ramfs/ubuntu-2204-cluster-client/ubuntu-2204-cluster-client.ova /fast/cluster-client-template/${TS}/
rm -rf /mnt/ramfs/ubuntu-2204-cluster-client


