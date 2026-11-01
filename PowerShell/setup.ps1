winget install ajeetdsouza.zoxide
winget install fzf
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.bat
winget install Starship.Starship

Install-Module -Name Terminal-Icons

function New-DotfileSymlink {
    param(
        [Parameter(Mandatory)] [string]$LinkPath,
        [Parameter(Mandatory)] [string]$TargetPath
    )

    $linkDir = Split-Path -Parent $LinkPath
    if (-not (Test-Path $linkDir)) {
        New-Item -ItemType Directory -Path $linkDir -Force | Out-Null
    }

    if (Test-Path -Path $LinkPath) {
        $response = Read-Host "$LinkPath は既に存在します。上書きしますか？ (y/n)"
        if ($response -ne 'y' -and $response -ne 'yes') {
            Write-Host "$LinkPath のリンク作成をスキップします。"
            return
        }
        Remove-Item -Path $LinkPath -Force
    }

    New-Item -ItemType SymbolicLink -Path $LinkPath -Target $TargetPath | Out-Null
    Write-Host "Linked: $LinkPath -> $TargetPath"
}

$dotfilesRoot = Split-Path -Parent $PSScriptRoot

New-DotfileSymlink `
    -LinkPath $PROFILE `
    -TargetPath (Join-Path $PSScriptRoot "profile.ps1")

New-DotfileSymlink `
    -LinkPath (Join-Path $HOME ".config\starship.toml") `
    -TargetPath (Join-Path $dotfilesRoot ".config\starship.toml")
