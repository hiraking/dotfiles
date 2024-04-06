winget install ajeetdsouza.zoxide
winget install fzf
winget install BurntSushi.ripgrep.MSVC
winget install sharkdp.bat

Install-Module -Name Terminal-Icons
Install-Module -Name pure-pwsh

# $PROFILE のシンボリックリンクを作成する
$targetProfilePath = Join-Path -Path $PSScriptRoot -ChildPath "profile.ps1"

# $PROFILEで指定されたパスに同名のファイルがすでに存在するか確認
if (Test-Path -Path $PROFILE) {
    # 存在する場合、ユーザーに上書き許可を尋ねる
    $response = Read-Host "$PROFILE は既に存在します。上書きしますか？ (y/n)"

    # ユーザーが 'y' または 'yes' と入力した場合のみファイルを削除
    if ($response -eq 'y' -or $response -eq 'yes') {
        Remove-Item -Path $PROFILE -Force
    } else {
        # ユーザーが上書きを拒否した場合、スクリプトを終了
        Write-Host "操作がキャンセルされました。"
        exit
    }
}

# $PROFILEで指定されたパスにシンボリックリンクを作成
New-Item -ItemType SymbolicLink -Path $PROFILE -Target $targetProfilePath
