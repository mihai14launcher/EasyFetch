@echo off
setlocal

:: Get OS information
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ProductName') do set "OS=%%a"
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v ReleaseId') do set "Version=%%a"
for /f "tokens=3" %%a in ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion" /v CurrentBuild') do set "Build=%%a"

:: Determine Windows version
if "%OS%"=="Microsoft Windows 10 Pro" set "OS=Windows 10"
if "%OS%"=="Microsoft Windows 11 Pro" set "OS=Windows 11"
if "%OS%"=="Microsoft Windows 7 Professional" set "OS=Windows 7"
if "%OS%"=="Microsoft Windows Vista" set "OS=Windows Vista"
if "%OS%"=="Microsoft Windows XP Professional" set "OS=Windows XP"

:: Get storage information
for /f "tokens=1,2" %%a in ('powershell -command "Get-PSDrive C | Select-Object @{Name='UsedGB';Expression={[math]::round($_.Used/1GB, 2)}}, @{Name='TotalGB';Expression={[math]::round($_.Used/1GB + ($_.Used/1GB * 0.5), 2)}} | Format-Table -HideTableHeaders"') do (
    set "UsedStorage=%%a"
    set "TotalStorage=%%b"
)
set "Storage=%UsedStorage%GB/%TotalStorage%GB"

:: Get RAM information
for /f "tokens=1" %%a in ('powershell -command "Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty TotalVisibleMemorySize"') do set "TotalRAM=%%a"
for /f "tokens=1" %%a in ('powershell -command "Get-CimInstance -ClassName Win32_OperatingSystem | Select-Object -ExpandProperty FreePhysicalMemory"') do set "FreeRAM=%%a"
set /a UsedRAM=(%TotalRAM% - %FreeRAM%) / 1024
set /a TotalRAM_MB=%TotalRAM% / 1024
set "RAM=%UsedRAM%MB/%TotalRAM_MB%MB"

:: Get kernel version
for /f "tokens=2 delims=[]" %%a in ('ver') do set "Kernel=%%a"

:: Get shell
set "Shell=%ComSpec%"

:: Get resolution
for /f "tokens=1,2" %%a in ('powershell -command "Add-Type -AssemblyName System.Windows.Forms; $s = [System.Windows.Forms.Screen]::PrimaryScreen.Bounds; $s.Width + "x" + $s.Height"') do set "Resolution=%%a x %%b"

:: Get terminal
set "Terminal=%TERM%"

:: Get CPU info
for /f "tokens=*" %%a in ('powershell -command "Get-WmiObject -Class Win32_Processor | Select-Object -ExpandProperty Name"') do set "CPU=%%a"

:: Get GPU info
for /f "tokens=*" %%a in ('powershell -command "Get-WmiObject -Class Win32_VideoController | Select-Object -ExpandProperty Name"') do set "GPU=%%a"

:: Get uptime
for /f "tokens=*" %%a in ('powershell -command "((Get-CimInstance Win32_OperatingSystem).LastBootUpTime).ToString('yyyy-MM-dd HH:mm:ss')"') do set "Uptime=%%a"

:: Display OS image
echo           .---.
echo        .--------.
echo      .--( . . )--.
echo       (    \/    )
echo        `-------'

:: Display system information
echo Storage:        %Storage%
echo RAM:            %RAM%
echo Kernel:         %Kernel%
echo Shell:          %Shell%
echo Resolution:     %Resolution%
echo Terminal:       %Terminal%
echo CPU:            %CPU%
echo GPU:            %GPU%
echo Uptime:         %Uptime%
echo OS:             %OS% NULL

endlocal
pause
