$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'http://www.joejoesoft.com/cms/file.php?f=userupload/8/files/acv520.zip'
$checksum     = '0ba1a01bf1cbd160041e27bf3d683e923882f3b8f371c8c9eaf1839add3cf603'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

# Resolve download link
$url = (Invoke-WebRequest -Uri $url).ParsedHtml.querySelector(".content a").href

Install-ChocolateyZipPackage -PackageName $packageName -Url $url -UnzipLocation $tempDir -Checksum $checksum -ChecksumType 'sha256'
Install-ChocolateyInstallPackage -PackageName $packageName -FileType 'exe' -SilentArgs $silentArgs -File $fileLocation
