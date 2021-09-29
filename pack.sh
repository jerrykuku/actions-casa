#!/bin/bash
final_path=casa/upload
sudo mkdir -p $final_path
pack_path=casa/casaos
path=casa/build
files=$(ls $path)
suffix="-casaos"
for filename in $files
do
  sudo rm -rf $pack_path
  sudo mkdir -p $pack_path  
  arch=$(echo $filename | sed 's/casa-//g')
  package_name=$arch$suffix
  upx --lzma --best $path/$filename
  sudo cp -r casa/conf $pack_path
  sudo cp -r casa/shell $pack_path
  sudo cp -rf $path/$filename $pack_path/casaos
  cd casa
  sudo tar zcvf "upload/${package_name}.tar.gz" casaos
  cd .. 
done
