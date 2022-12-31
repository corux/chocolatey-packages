$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'http://www.joejoesoft.com/cms/file.php?f=userupload/8/files/acv535.zip'
$checksum     = '0E25BDCCEA1BE169C021E010B1CD0F151FC391446FE6B4760353175A18AA0B0D'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

# Resolve download link
$urlWithToken = ((Invoke-WebRequest -Uri $url -UseBasicParsing).Links | Where-Object { $_.href -Like "*.zip*" }).href.Replace("&amp;", "&")
$url = (New-Object System.Uri -ArgumentList @($url, $urlWithToken, $true)).AbsoluteUri
Write-Verbose "Resolved download URL to $url"

Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $tempDir -Checksum $checksum -ChecksumType 'sha256'
Install-ChocolateyInstallPackage -PackageName $packageName -FileType 'exe' -SilentArgs $silentArgs -File $fileLocation
