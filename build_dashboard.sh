#!/bin/sh
git clone https://github.com/hetianyi/godfs
cd godfs
sh make.sh
rm -rf bin/storage
rm -rf bin/tracker
rm -rf bin/client
mkdir -p /tmp/godfs/data
cp bin /tmp/godfs
mv conf /tmp/godfs
mv /tmp/godfs/conf/storage.db /tmp/godfs/data
cd ..
npm install --save && npm run build
