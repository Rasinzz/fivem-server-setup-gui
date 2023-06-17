Add-Type -AssemblyName PresentationCore, PresentationFramework, WindowsBase, System.Windows.Forms

$xaml = @"
<Window x:Class="FiveMServerCreator.MainWindow"
        xmlns="http://schemas.microsoft.com/winfx/2006/xaml/presentation"
        xmlns:x="http://schemas.microsoft.com/winfx/2006/xaml"
        xmlns:d="http://schemas.microsoft.com/expression/blend/2008"
        xmlns:mc="http://schemas.openxmlformats.org/markup-compatibility/2006"
        xmlns:local="clr-namespace:FiveMServerCreator"
        mc:Ignorable="d"
        WindowStartupLocation="CenterScreen"
        Title="FiveM Server Creator" Height="800" Width="1200">
    <Grid Background="#FF222222">
        <StackPanel Width="1200" Height="75" VerticalAlignment="Top" HorizontalAlignment="Center" Background="#FF777777" Orientation="Horizontal">
            <Button x:Name="WPF_ConfigureTab_Button" Content="Configure" Width="125" Height="50" Margin="75,0,0,0" BorderThickness="0,0,0,0" FontWeight="Bold" Foreground="White" Background="#FF222222" VerticalAlignment="Center" HorizontalAlignment="Left"/>
            <Button x:Name="WPF_MiscTab_Button" Content="Misc" Width="125" Height="50" BorderThickness="0,0,0,0" FontWeight="Bold" Foreground="White" Background="#FF333333" VerticalAlignment="Center" HorizontalAlignment="Left"/>
            <Button x:Name="WPF_InstallTab_Button" Content="Install" Width="125" Height="50" BorderThickness="0,0,0,0" FontWeight="Bold" Foreground="White" Background="#FF444444" VerticalAlignment="Center" HorizontalAlignment="Left"/>
        </StackPanel>

        <TabControl x:Name="TabControl" Height="650" Width="1150" HorizontalAlignment="Center" Margin="0,75,0,0" BorderThickness="0,0,0,0" Background="#FF777777">
            <TabItem x:Name="WPF_Configure_Tab" Header="Configure" Visibility="Collapsed">
                <Grid Background="#FF777777" HorizontalAlignment="Center" VerticalAlignment="Center" Width="1150" Height="650">
                    <Label Content="Server Name:" HorizontalAlignment="Left" Margin="10,10,0,0" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40"/>
                    <TextBox x:Name="ConfigureTab_ServerName_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="300" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="152,10,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>

                    <Label Content="Server Description:" HorizontalAlignment="Left" Margin="10,65,0,0" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40"/>
                    <TextBox x:Name="ConfigureTab_ServerDescription_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="300" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="204,65,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>

                    <Label Content="Max Players (default: 48):" HorizontalAlignment="Left" Margin="10,120,0,0" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40"/>
                    <TextBox x:Name="ConfigureTab_MaxPlayers_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="100" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="265,120,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>

                    <Label Content="Steam API Key:" HorizontalAlignment="Left" Margin="10,175,0,0" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40"/>
                    <TextBox x:Name="ConfigureTab_SteamApiKey_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="275" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="167,175,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>

                    <Label Content="License Key:" HorizontalAlignment="Left" Margin="10,230,0,0" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40"/>
                    <TextBox x:Name="ConfigureTab_LicenseKey_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="275" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="138,230,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>

                    <Label Content="Game Build:" HorizontalAlignment="Left" Margin="10,285,0,0" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40"/>
                    <TextBox x:Name="ConfigureTab_GameBuild_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="125" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="139,285,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>
                </Grid>
            </TabItem>

            <TabItem x:Name="WPF_Misc_Tab" Header="Misc" Visibility="Collapsed">
                <Grid Background="#FF777777" HorizontalAlignment="Center" VerticalAlignment="Center" Width="1150" Height="650">
                    <CheckBox x:Name="MiscTab_InstallVMenu_CheckBox" Content="Install vMenu" HorizontalAlignment="Left" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" HorizontalContentAlignment="Center" VerticalContentAlignment="Center" Margin="10,10,0,0"/>
                </Grid>
            </TabItem>

            <TabItem x:Name="WPF_Install_Tab" Header="Install" Visibility="Collapsed">
                <Grid Background="#FF777777" HorizontalAlignment="Center" VerticalAlignment="Center" Width="1150" Height="650">
                    <Label Content="Install" HorizontalAlignment="Left" VerticalAlignment="Top" Foreground="White" FontWeight="Bold" FontSize="20" Background="#FF444444" VerticalContentAlignment="Center" HorizontalContentAlignment="Center" Height="40" Margin="10,10,0,0" Width="400"/>

                    <Button x:Name="InstallTab_SelectServerFolder_Button" Content="Select Server Folder" HorizontalAlignment="Left" Margin="10,70,0,0" VerticalAlignment="Top" Background="#FF444444" Foreground="White" BorderBrush="White" Width="200" Height="40" FontWeight="Bold" FontSize="20"/>
                    <TextBox x:Name="InstallTab_ServerFolder_TextBox" HorizontalAlignment="Left" TextWrapping="Wrap" VerticalAlignment="Top" Width="300" Background="#FF444444" Foreground="White" BorderBrush="#FF444444" Height="40" Margin="215,70,0,0" HorizontalContentAlignment="Center" VerticalContentAlignment="Center"/>

                    <Button x:Name="InstallTab_CreateServer_Button" Content="Create Server" HorizontalAlignment="Right" Margin="0,0,10,10" VerticalAlignment="Bottom" Background="#FF00CB00" Foreground="White" FontWeight="Bold" FontSize="20" Width="200" Height="75" BorderBrush="White" Cursor="Hand"/>
                </Grid>
            </TabItem>
        </TabControl>
    </Grid>
</Window>
"@

$xaml = $xaml -replace 'mc:Ignorable="d"', '' -replace "x:N", 'N' -replace '^<Win.*', '<Window'

$reader = [System.Xml.XmlReader]::Create([System.IO.StringReader]::new($xaml))
$window = [Windows.Markup.XamlReader]::Load($reader)

#####################
###### Config #######
#####################

$downloadLinks = @{
    serverArtifacts = 'https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/server.7z'
    serverData      = 'https://github.com/citizenfx/cfx-server-data/archive/refs/heads/master.zip'
    serverFiles     = 'https://github.com/Rasinzz/fivem-server-setup-gui-files/archive/heads/main.zip'
    vMenu           = 'https://github.com/TomGrobbe/vMenu/releases/download/v3.5.0/vMenu-v3.5.0.zip'
}

$resourcesCfgLines = @{
    vMenu = 8
}

$serverCfgLines = @{
    serverName        = 29
    serverDescription = 32
    vMenu             = 48
    maxPlayers        = 53
    steamApiKey       = 56
    licenseKey        = 59
    gameBuild         = 60
}

#####################
##### Functions #####
#####################

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

########################
##### WPF Controls #####
########################

$wpf = @{
    button     = @{
        # Navigation
        configureTab_Button                  = $window.FindName('WPF_ConfigureTab_Button')
        miscTab_Button                       = $window.FindName('WPF_MiscTab_Button')
        installTab_Button                    = $window.FindName('WPF_InstallTab_Button')

        # Install Tab
        installTab_SelectServerFolder_Button = $window.FindName('InstallTab_SelectServerFolder_Button')
        installTab_CreateServer_Button       = $window.FindName('InstallTab_CreateServer_Button')
    }

    checkbox   = @{
        miscTab_InstallVMenu_CheckBox = $window.FindName('MiscTab_InstallVMenu_CheckBox')
    }

    tabControl = $window.FindName('TabControl')

    textbox    = @{
        # Configure Tab
        configureTab_ServerName_TextBox        = $window.FindName('ConfigureTab_ServerName_TextBox')
        configureTab_ServerDescription_TextBox = $window.FindName('ConfigureTab_ServerDescription_TextBox')
        configureTab_MaxPlayers_TextBox        = $window.FindName('ConfigureTab_MaxPlayers_TextBox')
        configureTab_SteamApiKey_TextBox       = $window.FindName('ConfigureTab_SteamApiKey_TextBox')
        configureTab_LicenseKey_TextBox        = $window.FindName('ConfigureTab_LicenseKey_TextBox')
        configureTab_GameBuild_TextBox         = $window.FindName('ConfigureTab_GameBuild_TextBox')

        # Install Tab
        installTab_ServerFolder_TextBox        = $window.FindName('InstallTab_ServerFolder_TextBox')
    }
}

# WPF Navigation Button Click Functions
$wpf.button.configureTab_Button.Add_Click(
    {
        SwitchToTab 0
    }
)

$wpf.button.miscTab_Button.Add_Click(
    {
        SwitchToTab 1
    }
)

$wpf.button.installTab_Button.Add_Click(
    {
        SwitchToTab 2
    }
)

# WPF Button Click Functions
$wpf.button.installTab_SelectServerFolder_Button.Add_Click(
    {
        $folderBrowser = [System.Windows.Forms.FolderBrowserDialog] @{
            Description         = 'Select server folder'
            ShowNewFolderButton = $true
        }

        if ($folderBrowser.ShowDialog() -eq 'OK') {
            $wpf.textbox.installTab_ServerFolder_TextBox.Text = $folderBrowser.SelectedPath
        }
    }
)

$wpf.button.installTab_CreateServer_Button.Add_Click(
    {
        # Validate server directory
        if (-not ($wpf.textbox.installTab_ServerFolder_TextBox.Text)) {
            $shell = New-Object -ComObject WScript.Shell
            $shell.Popup('Please enter a valid server directory', 0, 'Invalid Server Directory', 16)
            return
        }

        # Add backtick for brackets
        $wpf.textbox.installTab_ServerFolder_TextBox.Text = AddBacktickForBracket($wpf.textbox.installTab_ServerFolder_TextBox.Text)

        if (-not (Test-Path -Path $wpf.textbox.installTab_ServerFolder_TextBox.Text)) {
            $shell = New-Object -ComObject WScript.Shell
            $shell.Popup('Please enter a valid server directory', 0, 'Invalid Server Directory', 16)
            return
        }

        Write-Host 'Server Folder: ' $wpf.textbox.installTab_ServerFolder_TextBox.Text
        Write-Host 'Server Name: ' $wpf.textbox.configureTab_ServerName_TextBox.Text
        Write-Host 'Server Description: ' $wpf.textbox.configureTab_ServerDescription_TextBox.Text
        Write-Host 'Max Players: ' $wpf.textbox.configureTab_MaxPlayers_TextBox.Text
        Write-Host 'Steam API Key: ' $wpf.textbox.configureTab_SteamApiKey_TextBox.Text
        Write-Host 'License Key: ' $wpf.textbox.configureTab_LicenseKey_TextBox.Text
        Write-Host 'Game Build: ' $wpf.textbox.configureTab_GameBuild_TextBox.Text
        Write-Host 'Install vMenu: ' $wpf.checkbox.miscTab_InstallVMenu_CheckBox.IsChecked

        CreateServer -serverDirectory $wpf.textbox.installTab_ServerFolder_TextBox.Text -serverName $wpf.textbox.configureTab_ServerName_TextBox.Text -serverDescription $wpf.textbox.configureTab_ServerDescription_TextBox.Text -maxPlayers $wpf.textbox.configureTab_MaxPlayers_TextBox.Text -steamApiKey $wpf.textbox.configureTab_SteamApiKey_TextBox.Text -licenseKey $wpf.textbox.configureTab_LicenseKey_TextBox.Text -gameBuild $wpf.textbox.configureTab_GameBuild_TextBox.Text -installVMenu $wpf.checkbox.miscTab_InstallVMenu_CheckBox.IsChecked
    }
)

# Cleanup Window
$window.ShowDialog()
$window.Close()
