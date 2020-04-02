$winVer = [int](Get-Item "HKLM:SOFTWARE\Microsoft\Windows NT\CurrentVersion").GetValue('ReleaseID')
if ($winVer -lt 2004) {
  Write-Host "😭 Cannot have fun WSL 2 FUN"
  exit 1
}
# https://docs.microsoft.com/en-us/windows/wsl/wsl2-install
Enable-WindowsOptionalFeature -Online -FeatureName @('Microsoft-Windows-Subsystem-Linux', 'VirtualMachinePlatform') -All -NoRestart
# https://docs.docker.com/docker-for-windows/install/
choco install docker-desktop -y

# install Ubuntu 18.04 or head to Microsoft Store and search "linux"
$item = "wsl-ubuntu-1804"
$file = "$env:TEMP\$item.appx"
Write-Host "Downloading $item"
curl.exe -sL https://aka.ms/$item -o $file
Add-AppxPackage $file
Remove-Item $file

Ubuntu1804 install
