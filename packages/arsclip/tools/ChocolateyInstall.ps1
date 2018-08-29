$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'http://www.joejoesoft.com/cms/file.php?f=userupload/8/files/acv527.zip'
$checksum     = 'cbf9a8195577228e0d20dba3782e04ac2593418575fcaaa8e88d48910e24994a'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

# Resolve download link
$url = (Invoke-WebRequest -Uri $url).ParsedHtml.querySelector(".content a").href
Write-Verbose "Resolved download URL to $url"

Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $tempDir -Checksum $checksum -ChecksumType 'sha256'
Install-ChocolateyInstallPackage -PackageName $packageName -FileType 'exe' -SilentArgs $silentArgs -File $fileLocation
