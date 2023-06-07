. $PSScriptRoot\functions.ps1

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

# WPF Controls
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
