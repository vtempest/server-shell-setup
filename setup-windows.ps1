# Windows Powershell configuration file

# notepad $PSHOME\Profile.ps1 and save this file 

# Windows11 defaults remover
function Win11Debloat_Run {
    git clone https://github.com/Raphire/Win11Debloat
    cd Win11Debloat
    powershell  -executionpolicy bypass -File .\Win11Debloat.ps1
}; 
New-Alias Win11Debloat Win11Debloat_Run;


# Developer Tools
function setupWindowsDev {

    winget install wingetui
    winget install Microsoft.VisualStudioCode
    winget install Neovim.Neovim.Nightly
    winget install Google.Chrome
    winget install GitHub.GitHubDesktop
    winget install 7zip.7zip 
    winget install Git.Git 
    winget install Microsoft.WindowsTerminal.Preview
    winget install JetBrains.Toolbox
    winget install Python.Launcher
    winget install Giorgiotani.Peazip  
    winget install voidtools.Everything
    winget install Starship.Starship
    winget install DEVCOM.JetBrainsMonoNerdFont
    winget install CoreyButler.NVMforWindows
    winget install Chocolatey.Chocolatey
    winget install Docker.DockerDesktop


    nvm install node
    npm i -g pnpm 

    #Media Tools
    winget install qBittorrent.qBittorrent Valve.Steam  KDE.Krita "Adobe Creative Cloud"  VideoLAN.VLC Vivaldi 
};

New-Alias setup  setupWindowsDev;


#edit powershell config file 
function editConfigFile {
    notepad $PSHOME\Profile.ps1;
}; 
New-Alias config editConfigFile;

