. $PSScriptRoot\config.ps1

function SwitchToTab {
    param (
        [int] $tabIndex
    )

    $wpf.TabControl.SelectedIndex = $tabIndex
}

function AddBacktickForBracket {
    param (
        [Parameter(Mandatory = $true)]
        [string] $directory
    )

    $bracketPattern = '[\[\]]'
    if ($directory -match $bracketPattern) {
        $directory = $directory -replace '\[', '`[' -replace '\]', '`]'
    }

    return $directory
}

function RemoveBackticksFromDirectory {
    param (
        [Parameter(Mandatory = $true)]
        [string] $directory
    )

    if ($directory -match '`') {
        $directory = $directory -replace '`', ''
    }

    return $directory
}

function HandleFiles {
    param (
        [Parameter(Mandatory = $true)]
        [string] $serverDirectory,
        [bool] $installVMenu
    )

    # Set location in order to use ".\"
    Set-Location -Path $serverDirectory\FXServer

    # Download files
    if ($installVMenu -eq $true) {
        Start-BitsTransfer -Source $downloadLinks.serverArtifacts, $downloadLinks.serverData, $downloadLinks.serverFiles, $downloadLinks.vMenu -Destination $serverDirectory\FXServer\server.7z, $serverDirectory\FXServer\server-data.zip, $serverDirectory\FXServer\server-files.zip, $serverDirectory\FXServer\vMenu.zip
    } else {
        Start-BitsTransfer -Source $downloadLinks.serverArtifacts, $downloadLinks.serverData, $downloadLinks.serverFiles -Destination $serverDirectory\FXServer\server.7z, $serverDirectory\FXServer\server-data.zip, $serverDirectory\FXServer\server-files.zip
    }

    $serverDirectory = RemoveBackticksFromDirectory($serverDirectory)

    # Extract files
    Expand-7Zip -ArchiveFileName server.7z -TargetPath server
    Expand-Archive -LiteralPath $serverDirectory\FXServer\server-data.zip -DestinationPath $serverDirectory\FXServer\server-data
    Expand-Archive -LiteralPath $serverDirectory\FXServer\server-files.zip -DestinationPath $serverDirectory\FXServer\server-files
    if ($installVMenu -eq $true) {
        Expand-Archive -LiteralPath $serverDirectory\FXServer\vMenu.zip -DestinationPath $serverDirectory\FXServer\vMenu
    }

    # Move files
    Move-Item -Path .\server-data\cfx-server-data-master\* -Destination .\server-data
    Move-Item -Path .\server-files\*\* -Destination .\server-data
    if ($installVMenu -eq $true) {
        Move-Item -Path .\vMenu -Destination .\server-data\resources
    }

    # Delete files
    Remove-Item -Path .\server.7z
    Remove-Item -Path .\server-data.zip
    Remove-Item -Path .\server-files.zip
    Remove-Item -Path .\server-files -Recurse
    Remove-Item -Path .\server-data\cfx-server-data-master -Recurse
    if ($installVMenu -eq $true) {
        Remove-Item -Path .\vMenu.zip
    }
}

function ConfigureServer {
    param (
        [Parameter(Mandatory = $true)]
        [string] $serverDirectory,
        [string] $serverName,
        [string] $serverDescription,
        [int] $maxPlayers,
        [string] $steamApiKey,
        [string] $licenseKey,
        [int] $gameBuild,
        [bool] $installVMenu
    )

    $serverDirectory = RemoveBackticksFromDirectory($serverDirectory)

    # Configure server.cfg file
    if ($serverName) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.serverName - 1] = 'sets sv_projectName "' + $serverName + '"'
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    }

    if ($serverDescription) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.serverDescription - 1] = 'sets sv_projectDesc "' + $serverDescription + '"'
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    }

    if ($maxPlayers) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.maxPlayers - 1] = 'sv_maxclients ' + $maxPlayers
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    }

    if ($steamApiKey) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.steamApiKey - 1] = 'set steam_webApiKey ' + $steamApiKey
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    }

    if ($licenseKey) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.licenseKey - 1] = "sv_licenseKey $licenseKey`n"
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    } elseif ($gameBuild) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.licenseKey - 1] = "sv_licenseKey changeme`n"
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    } else {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.licenseKey - 1] = "sv_licenseKey changeme"
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    }

    if ($gameBuild) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.gameBuild - 1] = "`n# GTA Game Build`nsv_enforceGameBuild $gameBuild"
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
    }

    if ($installVMenu -eq $true) {
        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg
        $fileContent[$serverCfgLines.vMenu - 1] = "`n# vMenu Permissions`nexec @vMenu/config/permissions.cfg`n"
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\server.cfg

        $fileContent = Get-Content -LiteralPath $serverDirectory\FXServer\server-data\resources.cfg
        $fileContent[$resourcesCfgLines.vMenu - 1] = "`n# Custom`nensure vMenu"
        $fileContent | Set-Content -LiteralPath $serverDirectory\FXServer\server-data\resources.cfg
    }
}

function CreateServer {
    param (
        [Parameter(Mandatory = $true)]
        [string] $serverDirectory,
        [string] $serverName,
        [string] $serverDescription,
        [int] $maxPlayers,
        [string] $steamApiKey,
        [string] $licenseKey,
        [int] $gameBuild,
        [bool] $installVMenu
    )

    # Add backtick ('`') for brackets so that server directory is detected correctly
    $serverDirectory = AddBacktickForBracket($serverDirectory)

    # Check if folder named 'FXServer' already exists (remove if already exists)
    if (-not (Test-Path -Path $serverDirectory\FXServer)) {
        New-Item -Path $serverDirectory -ItemType Directory -Name 'FXServer'
    } else {
        Remove-Item -Path $serverDirectory\FXServer -Recurse
        New-Item -Path $serverDirectory -ItemType Directory -Name 'FXServer'
    }

    # Handle files
    HandleFiles -serverDirectory $serverDirectory -installVMenu $installVMenu

    # Configure server.cfg
    ConfigureServer -serverDirectory $serverDirectory -serverName $serverName -serverDescription $serverDescription -maxPlayers $maxPlayers -steamApiKey $steamApiKey -licenseKey $licenseKey -gameBuild $gameBuild -installVMenu $installVMenu

    # Finished message
    Write-Host 'Finished! Make sure to configure your server.cfg file' -ForegroundColor Green
}
