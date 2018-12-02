#!/bin/sh
git clone https://github.com/hetianyi/godfs
cd godfs
sh make.sh
rm -rf bin/storage
rm -rf bin/tracker
rm -rf bin/client
mkdir -p /tmp/godfs/bin
mkdir -p /tmp/godfs/data
cp bin/dashboard /tmp/godfs/bin
mv conf /tmp/godfs
mv /tmp/godfs/conf/storage.db /tmp/godfs/data
cd ..
npm run build
