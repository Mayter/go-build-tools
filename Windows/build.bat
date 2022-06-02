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
echo "正在编译: %curf%_Linux-amd64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_amd64

@echo off
echo "正在编译: %curf%_Linux-amd..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_amd

@echo off
echo "正在编译: %curf%_Linux-arm64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=arm64
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_arm64

@echo off
echo "正在编译: %curf%_Linux-arm..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_arm

echo "正在编译: %curf%_Windows-64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Windows_64.exe

echo "正在编译: %curf%_Windows-86..."
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Windows_86.exe

echo "正在编译: %curf%_Mac-Intel..."
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Intel_amd64

echo "正在编译: %curf%_Mac-M1..."
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=arm64
go build -ldflags "-s -w" -o ./releases/%curf%_M1_arm64

echo "=======================================END结束======================================="