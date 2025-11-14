#Install New apps
Write-Output "Installing Apps"
$apps = @(
    @{name = "Mozilla.Firefox" }, 
    @{name = "Microsoft.VisualStudioCode" }, 
    @{name = "7zip.7zip" }, 
    @{name = "Git.Git" }, 
    @{name = "Obsidian.Obsidian" },
    @{name = "Valve.Steam"  },
    @{name = "Spotify.Spotify" },
    @{name = "Discord.Discord" },
    @{name = "Stremio.Stremio" },
    @{name = "Microsoft.PowerToys" },
    @{name = "JanDeDobbeleer.OhMyPosh" },
    @{name = "Syncthing.Syncthing" },
    @{name = "voidtools.Everything" },
    @{name = "Google.PlatformTools" },
    @{name = "Armin2208.WindowsAutoNightMode" },
    @{name = "AntibodySoftware.WizTree" },
    @{name = "WerWolv.ImHex" },
    @{name = "PersepolisDownloadManager.Persepolis" },
    @{name = "CPUID.HWMonitor" },
    @{name = "qBittorrent.qBittorrent.Qt6" },
    @{name = "t1m0thyj.WinDynamicDesktop" },
    @{name = "zyedidia.micro" },
    @{name = "Nvidia.GeForceNow" },
    @{name = "KDE.KDEConnect" },
    @{name = "OO-Software.ShutUp10" },
    @{name = "cebby2420.VIADesktop" },
    @{name = "MullvadVPN.MullvadVPN" },
    @{name = "MullvadVPN.MullvadBrowser" }
);
Foreach ($app in $apps) {
    $listApp = winget list --exact -q $app.name --accept-source-agreements 
    if (![String]::Join("", $listApp).Contains($app.name)) {
        Write-host "Installing:" $app.name
        if ($app.source -ne $null) {
            winget install --exact --silent $app.name --source $app.source --accept-package-agreements
        }
        else {
            winget install --exact --silent $app.name --accept-package-agreements
        }
    }
    else {
        Write-host "Skipping Install of " $app.name
    }
}
