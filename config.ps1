$downloadLinks = @{
    serverArtifacts = 'https://runtime.fivem.net/artifacts/fivem/build_server_windows/master/5848-4f71128ee48b07026d6d7229a60ebc5f40f2b9db/server.7z'
    serverData      = 'https://github.com/citizenfx/cfx-server-data/archive/refs/heads/master.zip'
    serverFiles     = 'https://github.com/Rasinzz/fivem-server-setup-files-public/archive/heads/main.zip'
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
