---
layout: page
permalink: /quickhelp
title: Quickhelp
sidebar_link:  true
feature_text: | 
    ## CMD
feature_image: "/assets/header_image.jpg"
---

##  If you've found this... well done

This is a quick list of commands / scripts that can be run to assist you.

## Back up all users data to c:\temp

Open Powershell ISE with elevated rights.

Copy and paste the below.

Update variables.

Execute.

### The script

```powershell
# Define source and destination
$SourceRoot = "C:\Users"
$BackupRoot = "C:\Temp\Backups"

# Folders we want to grab
$TargetFolders = @("Documents", "Pictures", "Music", "Desktop")

if (!(Test-Path $BackupRoot)) {
    New-Item -Path $BackupRoot -ItemType Directory | Out-Null
}

$UserProfiles = Get-ChildItem -Path $SourceRoot -Directory | Where-Object { 
    $_.Name -notmatch "Public|Default|All Users" 
}

foreach ($User in $UserProfiles) {
    $UserName = $User.Name
    Write-Host "`n>>> Processing User: $UserName <<<" -ForegroundColor Cyan

    foreach ($Folder in $TargetFolders) {
        $SourcePath = Join-Path $User.FullName $Folder
        $DestPath = Join-Path $BackupRoot "$UserName\$Folder"

        if (Test-Path $SourcePath) {
            Write-Host "Syncing $Folder..." -ForegroundColor Gray
            
            # ROBOCOPY COMMAND EXPLAINED:
            # /E        : Copy subdirectories, including empty ones.
            # /B        : Copy files in Backup mode (overrides most permission issues).
            # /R:0      : Zero retries on failed files (stops it from hanging on locked system files).
            # /W:0      : Zero seconds wait time between retries.
            # /XJ       : Exclude Junction points (prevents infinite loops in older Windows setups).
            # /NFL /NDL : Don't log every single file/dir name (keeps the console clean).
            
            robocopy $SourcePath $DestPath /E /B /R:0 /W:0 /XJ /NFL /NDL
        }
    }
}

Write-Host "`nBackup process complete! Check $BackupRoot" -ForegroundColor Green
```
