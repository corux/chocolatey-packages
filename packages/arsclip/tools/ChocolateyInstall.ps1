$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'https://www.joejoesoft.com/cms/file.php?f=userupload/8/files/acv533.zip'
$checksum     = 'edbded2c0dae0896c772b00af466318cbfc897eb0eeaf7987c5c6470c1a1fd0a'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

# Resolve download link
$urlWithToken = ((Invoke-WebRequest -Uri $url -UseBasicParsing).Links | Where-Object { $_.href -Like "*.zip*" }).href.Replace("&amp;", "&")
$url = (New-Object System.Uri -ArgumentList @($url, $urlWithToken, $true)).AbsoluteUri
Write-Verbose "Resolved download URL to $url"

Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $tempDir -Checksum $checksum -ChecksumType 'sha256'
Install-ChocolateyInstallPackage -PackageName $packageName -FileType 'exe' -SilentArgs $silentArgs -File $fileLocation
