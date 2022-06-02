@echo off

:: ��ȡ��ǰĿ¼��
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
echo "���ڱ���: %curf%-Linux-amd64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_amd64
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Linux_amd64
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Linux_amd64

@echo off
echo "���ڱ���: %curf%-Linux-amd..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_amd
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Linux_amd
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Linux_amd

@echo off
echo "���ڱ���: %curf%-Linux-arm64..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=arm64
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_arm64
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Linux_arm64
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Linux_arm64

@echo off
echo "���ڱ���: %curf%-Linux-arm..."
set CGO_ENABLED=0
set GOOS=linux
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Linux_arm
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Linux_arm
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Linux_arm

echo "���ڱ���: %curf%-Windows-x64..."
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Windows_x64.exe
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Windows_x64.exe
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Windows_x64.exe

echo "���ڱ���: %curf%-Windows-x86..."
set CGO_ENABLED=0
set GOOS=windows
set GOARCH=386
go build -ldflags "-s -w" -o ./releases/%curf%_Windows_x86.exe
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Windows_x86.exe
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Windows_x86.exe

echo "���ڱ���: %curf%-Mac-Intel..."
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=amd64
go build -ldflags "-s -w" -o ./releases/%curf%_Intel_amd64
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_Intel_amd64
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_Intel_amd64

echo "���ڱ���: %curf%-Mac-M1..."
set CGO_ENABLED=0
set GOOS=darwin
set GOARCH=arm64
go build -ldflags "-s -w" -o ./releases/%curf%_M1_arm64
echo "����ȥ��������Ϣ��..."
go_strip.exe -f ./releases/%curf%_M1_arm64
echo "����upx�ӿ���..."
upx -9 ./releases/%curf%_M1_arm64

echo "=======================================END����======================================="