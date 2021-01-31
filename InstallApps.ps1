$chocoAppList = "7zip,winrar,googlechrome,firefox,discord,telegram,crystaldiskinfo,obs,vlc,git,firacode,nodejs,yarn,vscode,choco,install,microsoft-windows-terminal,adobereader,jre8,malwarebytes,skype,ccleaner,dotnet3.5,zoom,winamp,whatsapp,telegram,openvpn,nvidia-display-driver,office2019proplus,opera,internet-download-manager,lightshot.install"


if ([string]::IsNullOrWhiteSpace($chocolateyAppList) -eq $false -or [string]::IsNullOrWhiteSpace($dismAppList) -eq $false) {
    try {
        choco config get cacheLocation
    }
    catch {
        Write-Output "Chocolatey not detected, trying to install now"
        iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }
}

if ([string]::IsNullOrWhiteSpace($chocoAppList) -eq $false) {
    
    $appsToInstall = $chocoAppList -split "," | foreach { "$($_.Trim())" }

    foreach ($app in $appsToInstall) {
        Write-Host "Instalando $app"
        & choco install $app /y /source windowsf
    }
}