<# A mods template for apps
Possible use cases:
"$Mods\AppID-preinstall.ps1"
"$Mods\AppID-install.ps1"
"$Mods\AppID-upgrade.ps1"
"$Mods\AppID-installed.ps1"
"$Mods\AppID-notinstalled.ps1"
#>

<# FUNCTIONS #>
. $PSScriptRoot\_Mods-Functions.ps1

# Remove file/directory, multiple: "file1","file2" Example:
# $DelFile = @("${env:ProgramFiles}\PowerToys\PowerToys.Update.exe")
$DelFile = @("${env:ProgramData}\Microsoft\Windows\Start Menu\Programs\Git")

<# MAIN #>
if ($RunSystem) {
    Invoke-ModsApp $RunSystem $RunSwitch $RunWait ""
}
if ($Proc) {
    Stop-ModsProc $Proc
}
if ($Svc) {
    Stop-ModsSvc $Svc
}
if ($Wait) {
    Wait-ModsProc $Wait
}
if ($WingetIDInst) {
    Install-WingetID $WingetIDInst
}
if ($WingetIDUninst) {
    Uninstall-WingetID $WingetIDUninst
}
if ($AppUninst) {
    Uninstall-ModsApp $AppUninst $AllVersions
}
if ($Lnk) {
    Remove-ModsLnk $Lnk
}
if ($AddKey -and $AddValue -and $AddTypeData -and $AddType) {
    Add-ModsReg $AddKey $AddValue $AddTypeData $AddType
}
if ($DelKey) {
    Remove-ModsReg $DelKey $DelValue
}
if ($DelFile) {
    Remove-ModsFile $DelFile
}
if ($RenFile -and $NewName) {
    Rename-ModsFile $RenFile $NewName
}
if ($CopyFile -and $CopyTo) {
    Copy-ModsFile $CopyFile $CopyTo
}
if ($File -and $FindText -and $ReplaceText) {
    Edit-ModsFile $File $FindText $ReplaceText
}
if ($GrantPath) {
    Grant-ModsPath $GrantPath
}
if ($RunUser) {
    Invoke-ModsApp $RunUser "" "" $User
}


<# EXTRAS #>