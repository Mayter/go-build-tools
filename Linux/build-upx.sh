#!/bin/sh
#需要安装upx

category_name=`pwd | awk -F "/" '{print $NF}'`
echo $category_name

echo "正在编译: $category_name-Linux-amd64..."
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -ldflags "-s -w" -o ./releases/${category_name}_Linux_amd64
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Linux_amd64

echo "正在编译: $category_name-Linux-amd..."
CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -ldflags "-s -w" -o ./releases/${category_name}_Linux_amd
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Linux_amd

echo "正在编译: $category_name-Windows-64..."
CGO_ENABLED=0 GOOS=windows GOARCH=amd64 go build -ldflags "-s -w" -o ./releases/${category_name}_Windows_64.exe
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Windows_64.exe

echo "正在编译: $category_name-Windows-386..."
CGO_ENABLED=0 GOOS=windows GOARCH=386 go build -ldflags "-s -w" -o ./releases/${category_name}_Windows_86.exe
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Windows_86.exe

echo "正在编译: $category_name-Linux-arm64..."
CGO_ENABLED=0 GOOS=linux GOARCH=arm64 go build -ldflags "-s -w" -o ./releases/${category_name}_Linux_arm64
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Linux_arm64

echo "正在编译: $category_name-Linux-386..."
CGO_ENABLED=0 GOOS=linux GOARCH=386 go build -ldflags "-s -w" -o ./releases/${category_name}_Linux_arm
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Linux_arm

echo "正在编译: $category_name-Mac-M1..."
CGO_ENABLED=0 GOOS=darwin GOARCH=arm64 go build -ldflags "-s -w" -o ./releases/${category_name}_Intel_arm64
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Intel_arm64

echo "正在编译: $category_name-Mac-Intel..."
CGO_ENABLED=0 GOOS=darwin GOARCH=amd64 go build -ldflags "-s -w" -o ./releases/${category_name}_Intel_amd64
echo "正在upx加壳中..."
./upx -9 ./releases/${category_name}_Intel_amd64
echo "=======================================END结束======================================="