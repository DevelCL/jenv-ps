jenv-ps
=======================================

jenv PowerShell Edition, refer https://github.com/linux_china/jenv-ps

### Install
Execute following command In your power shell console

     (new-object Net.WebClient).DownloadString("http://get.jenv.io/GetJenv.ps1") | iex

if you use ps-get, please use following command:

     install-module -ModuleUrl https://jenv.io/jenv-ps.zip

### Development
 
    set-executionpolicy remotesigned
    git clone  git@github.com:linux-china/jenv-ps.git  C:\Users\xxxxx\Documents\WindowsPowerShell\Modules\jenv
    Get-Module -ListAvailable
    Import-Module -Verbose -Name jenv

### Power Shell Alias

CmdLet	Alias
Add-Content	Ac
Add-PSSnapin	Asnp
Clear-Content	Clc
Clear-Host	Clear
Clear-Host	Cls
Clear-Item	Cli
Clear-ItemProperty	Clp
Clear-Variable	Clv
Compare-Object	Diff
Convert-Path	Cvpa
Copy-Item	Copy
Copy-Item	Cp
Copy-Item	Cpi
Copy-ItemProperty	Cpp
Export-Alias	Epal
Export-Csv	Epcsv
ForEach-Object	%
ForEach-Object	Foreach
Format-Custom	Fc
Format-List	Fl
Format-Table	Ft
Format-Wide	Fw
Get-Alias	Gal
Get-ChildItem	Dir
Get-ChildItem	Gci
Get-ChildItem	Ls
Get-Command	Gcm
Get-Content	Cat
Get-Content	Gc
Get-Content	Type
Get-History	Ghy
Get-History	H
Get-History	History
Get-Item	Gi
Get-ItemProperty	Gp
Get-Location	Gl
Get-Location	Pwd
Get-Member	Gm
Get-Process	Gps
Get-Process	Ps
Get-PSDrive	Gdr
Get-PSSnapin	Gsnp
Get-Service	Gsv
Get-Unique	Gu
Get-Variable	Gv
Get-WmiObject	Gwmi
Group-Object	Group
Import-Alias	Ipal
Import-Csv	Ipcsv
Invoke-Expression	Iex
Invoke-History	Ihy
Invoke-History	R
Invoke-Item	Ii
Move-Item	Mi
Move-Item	Move
Move-Item	Mv
Move-ItemProperty	Mp
New-Alias	Nal
New-Item	Ni
New-PSDrive	Mount
New-PSDrive	Ndr
New-Variable	Nv
Out-Host	Oh
Out-Printer	Lp
Pop-Location	Popd
Push-Location	Pushd
Remove-Item	Del
Remove-Item	Erase
Remove-Item	Rd
Remove-Item	Ri
Remove-Item	Rm
Remove-Item	Rmdir
Remove-ItemProperty	Rp
Remove-PSDrive	Rdr
Remove-PSSnapin	Rsnp
Remove-Variable	Rv
Rename-Item	Ren
Rename-Item	Rni
Rename-ItemProperty	Rnp
Resolve-Path	Rvpa
Select-Object	Select
Set-Alias	Sal
Set-Content	Sc
Set-Item	Si
Set-ItemProperty	Sp
Set-Location	Cd
Set-Location	Chdir
Set-Location	Sl
Set-Variable	Set
Set-Variable	Sv
Sort-Object	Sort
Start-Service	Sasv
Start-Sleep	Sleep
Stop-Process	Kill
Stop-Process	Spps
Stop-Service	Spsv
Tee-Object	Tee
Where-Object	?
Where-Object	Where
Write-Output	Echo
Write-Output	Write