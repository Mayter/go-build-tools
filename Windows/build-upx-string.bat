@echo off

:: 获取当前目录名
set curf=%~p0%
set curf=%curf:~0,-1%
:getfolder
FOR /F "tokens=1,* delims=\/" %%i in ("%curf%") do (
    if not "%%j"=="" (
        set curf=%%j
        goto getfolder
    )
)

echo %curf%
chdir
::set name="Aopo"
echo "正在编译: %curf%-Linux-amd64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_amd64
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Linux_amd64
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Linux_amd64

@echo off
echo "正在编译: %curf%-Linux-amd..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_amd
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Linux_amd
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Linux_amd

@echo off
echo "正在编译: %curf%-Linux-arm64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=arm64
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_arm64
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Linux_arm64
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Linux_arm64

@echo off
echo "正在编译: %curf%-Linux-arm..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_arm
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Linux_arm
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Linux_arm

echo "正在编译: %curf%-Windows-x64..."
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Windows_x64.exe
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Windows_x64.exe
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Windows_x64.exe

echo "正在编译: %curf%-Windows-x86..."
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Windows_x86.exe
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Windows_x86.exe
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Windows_x86.exe

echo "正在编译: %curf%-Mac-Intel..."
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Intel_amd64
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_Intel_amd64
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_Intel_amd64

echo "正在编译: %curf%-Mac-M1..."
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=arm64
go build -ldflags "-s -w" -o ./releases/%curf%_M1_arm64
echo "正在去除编译信息中..."
go_strip.exe -f ./releases/%curf%_M1_arm64
echo "正在upx加壳中..."
upx -9 ./releases/%curf%_M1_arm64

echo "=======================================END结束======================================="