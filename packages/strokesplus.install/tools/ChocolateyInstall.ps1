$packageName = 'strokesplus.install'
$url         = 'http://www.strokesplus.com/files/StrokesPlusSetup_2.8.6.4_x86_Signed.exe'
$url64       = 'http://www.strokesplus.com/files/StrokesPlusSetup_2.8.6.4_x64_Signed.exe'
$silentArgs  = "/SP- /VERYSILENT /SUPPRESSMSGBOXES"

Install-ChocolateyPackage $packageName 'EXE' $silentArgs $url $url64
