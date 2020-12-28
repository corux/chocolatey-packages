$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'https://www.joejoesoft.com/cms/file.php?f=userupload/8/files/acv531.zip'
$checksum     = '34bdce7f040c3eabe783727223d62f0282906fd16996cacaac035de374a32719'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

# Resolve download link
$urlWithToken = ((Invoke-WebRequest -Uri $url -UseBasicParsing).Links | Where-Object { $_.href -Like "*.zip*" }).href.Replace("&amp;", "&")
$url = (New-Object System.Uri -ArgumentList @([System.Uri]$url, $urlWithToken)).AbsoluteUri
Write-Verbose "Resolved download URL to $url"

Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $tempDir -Checksum $checksum -ChecksumType 'sha256'
Install-ChocolateyInstallPackage -PackageName $packageName -FileType 'exe' -SilentArgs $silentArgs -File $fileLocation
