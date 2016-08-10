$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'http://www.joejoesoft.com/cms/file.php?f=userupload%2f8%2ffiles%2facv509.zip'
$checksum     = '80b41f8bb422e5848000932d53812a02f71d94de02c81a118d0ae9ac5c8beeff'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$options = @{
  Headers = @{
    Referer = 'http://www.joejoesoft.com/vcms/97/';
  }
}

Install-ChocolateyZipPackage $packageName $url $tempDir -Options $options -Checksum $checksum -ChecksumType 'sha256'
Install-ChocolateyInstallPackage $packageName 'exe' $silentArgs $fileLocation
