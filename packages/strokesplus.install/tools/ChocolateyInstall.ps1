$packageName = 'strokesplus.install'
$url         = 'http://www.strokesplus.com/files/StrokesPlusSetup_2.8.6.4_x86_Signed.exe'
$checksum    = 'd953de0fb8e5122261194c8b13d900d367ad5e2f33ac50a6e503e60936fe5bcb'
$url64       = 'http://www.strokesplus.com/files/StrokesPlusSetup_2.8.6.4_x64_Signed.exe'
$checksum64  = '235574d9cdffe55cf03ba26c9c13f470589cac5d6779ca55d39b6bd81781e551'
$silentArgs  = "/SP- /VERYSILENT /SUPPRESSMSGBOXES"

Install-ChocolateyPackage $packageName 'EXE' $silentArgs $url $url64 -Checksum $checksum -ChecksumType 'sha256' -Checksum64 $checksum64 -ChecksumType64 'sha256'
