$packageName = 'strokesplus.portable'
$toolsDir    = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$url         = 'http://www.strokesplus.com/files/StrokesPlus_2.8.6.4_x86.zip'
$checksum    = '9d96c3b1b85aef044db79bd6dfc552bceb4bfe0e236cb92259de7f8a4de2450e'
$url64       = 'http://www.strokesplus.com/files/StrokesPlus_2.8.6.4_x64.zip'
$checksum64  = '55917a628d49c987550450b6ca0fb7429541d5ffa809b1815f66dae4925d95c3'
$zipFolder   = if (Get-ProcessorBits 32) { 'StrokesPlus_x86' } else { 'StrokesPlus_x64' }
$rmZipFolder = "${zipFolder}_Signed"

Install-ChocolateyZipPackage $packageName $url $toolsDir $url64 -Checksum $checksum -ChecksumType 'sha256' -Checksum64 $checksum64 -ChecksumType64 'sha256'
Remove-Item (Join-Path $toolsDir $rmZipFolder) -Force -Recurse

# copy user configuration to current user's %AppData% folder.
$configDir = $(Join-Path $ENV:AppData 'StrokesPlus')
if (!(Test-Path $configDir)) {
    New-Item -ItemType Directory -Path $configDir
}

$configFiles = @(
    'ActionHelp.xml',
    'StrokesPlus.lua',
    'StrokesPlus.xml'
)
$installDir = $(Join-Path $toolsDir $zipFolder)
foreach ($file in $configFiles) {
    if (!(Test-Path (Join-Path $configDir $file))) {
        Copy-Item (Join-Path $installDir $file) -Destination $configDir
    }
}
