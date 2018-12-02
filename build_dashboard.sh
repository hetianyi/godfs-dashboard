#!/bin/sh
git clone https://github.com/hetianyi/godfs
cd godfs
sh make.sh
rm -rf bin/storage
rm -rf bin/tracker
rm -rf bin/client
mkdir -p godfs/data
mv bin godfs
mv conf godfs
mv godfs/conf/storage.db godfs/data
cd ..
npm install --save && npm run build
