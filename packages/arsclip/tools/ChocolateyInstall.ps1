$packageName  = 'arsclip'
$tempDir      = Join-Path $env:TEMP $packageName
$url          = 'http://www.joejoesoft.com/cms/file.php?f=userupload%2f8%2ffiles%2facv507.zip'
$fileLocation = Join-Path $tempDir 'setup.exe'
$silentArgs   = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'
$options = @{
  Headers = @{
    Referer = 'http://www.joejoesoft.com/vcms/97/';
  }
}

Install-ChocolateyZipPackage $packageName $url $tempDir -options $options
Install-ChocolateyInstallPackage $packageName 'exe' $silentArgs $fileLocation
