#!/bin/bash
final_path=$1
ls
#sudo mkdir -p $final_path
pack_path=casaos
path=build
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
  sudo tar zcvf "${package_name}.tar.gz" casaos
  ls
done
