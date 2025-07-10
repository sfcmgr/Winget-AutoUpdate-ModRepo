$appName = 'Git'
$desktopShortcut = Get-ChildItem -Path 'C:\Users\Public\Desktop' | Where-Object { ($_.Name -replace '\s', '') -match $appName } 
if ($desktopShortcut) {
    Remove-Item  -Path $desktopShortcut.FullName -Force -ErrorAction SilentlyContinue
}
Remove-Item -Path "$env:ProgramData\Microsoft\Windows\Start Menu\Programs\Git" -Recurse -Force -ErrorAction SilentlyContinue