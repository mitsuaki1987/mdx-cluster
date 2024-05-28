#!/usr/bin/bash -eux

TS=`date "+%Y%m%d-%H%M"`
mkdir -p /fast/MA-template/${TS}

# delete all files before starting to build VM images
make clean

# base ubuntu image
make ubuntu
rm -rf /mnt/ramfs/ubuntu-2204-cdinstall

# materiapps-live
make materiapps-live
cp /mnt/ramfs/ubuntu-2204-materiapps-live/ubuntu-2204-materiapps-live.ova /fast/MA-template/${TS}/
rm -rf /mnt/ramfs/ubuntu-2204-materiapps-live


