#!/bin/bash
PACK_PATH=casaos
BUILD_PATH=build
SUFFIX="-casaos"
files=$(ls $BUILD_PATH)
for filename in $files
do
  sudo rm -rf $PACK_PATH
  sudo mkdir -p $PACK_PATH  
  arch=$(echo $filename | sed 's/casa-//g')
  package_name=$arch$SUFFIX
  upx --lzma --best $BUILD_PATH/$filename
  sudo cp -r casa/conf $PACK_PATH
  sudo cp -r casa/shell $PACK_PATH
  sudo cp -rf $BUILD_PATH/$filename $PACK_PATH/casaos
  sudo tar zcvf "${package_name}.tar.gz" $PACK_PATH
  ls
done
