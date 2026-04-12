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

# Folders we want to grab from each user
$TargetFolders = @("Documents", "Pictures", "Music", "Desktop")

# Create the main backup directory if it doesn't exist
if (!(Test-Path $BackupRoot)) {
    New-Item -Path $BackupRoot -ItemType Directory | Out-Null
}

# Get all user folders (excluding system profiles)
$UserProfiles = Get-ChildItem -Path $SourceRoot -Directory | Where-Object { 
    $_.Name -notmatch "Public|Default|All Users" 
}

foreach ($User in $UserProfiles) {
    $UserName = $User.Name
    Write-Host "--- Processing User: $UserName ---" -ForegroundColor Cyan

    # Create a specific folder for this user in C:\Temp\Backups
    $UserDest = Join-Path $BackupRoot $UserName
    if (!(Test-Path $UserDest)) {
        New-Item -Path $UserDest -ItemType Directory | Out-Null
    }

    foreach ($Folder in $TargetFolders) {
        $SourcePath = Join-Path $User.FullName $Folder
        $DestPath = Join-Path $UserDest $Folder

        if (Test-Path $SourcePath) {
            Write-Host "Copying $Folder..." -ForegroundColor Gray
            try {
                # Copy-Item -Recurse handles the folder and all sub-files
                Copy-Item -Path "$SourcePath\*" -Destination $DestPath -Recurse -Force -ErrorAction SilentlyContinue
            }
            catch {
                Write-Host "Warning: Some files in $Folder could not be copied." -ForegroundColor Yellow
            }
        }
        else {
            Write-Host "Skip: $Folder does not exist for $UserName." -ForegroundColor DarkGray
        }
    }
}

Write-Host "Backup process complete! Check $BackupRoot" -ForegroundColor Green
```
