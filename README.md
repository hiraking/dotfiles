# dotfiles

## Setup

### PowerShell (Windows)

**管理者権限 PowerShell で** 実行してください。シンボリックリンク作成のために elevation が必要です。

```powershell
cd C:\path\to\dotfiles
.\PowerShell\setup.ps1
```

これで以下が行われます:

- `winget` 経由で zoxide / fzf / ripgrep / bat / Starship をインストール
- Terminal-Icons モジュールをインストール
- `$PROFILE` を `PowerShell\profile.ps1` へのシンボリックリンクに差し替え
- `~\.config\starship.toml` を `.config\starship.toml` へのシンボリックリンクに差し替え

#### 任意: 管理者権限なしで symlink を作れるようにする

Windows の **Developer Mode** を有効にすると、以降 symlink 作成が通常ユーザー権限で可能になります。日常的に symlink を扱うなら便利です。

```
設定 > システム > 開発者向け > 開発者モード: ON
```

ただし、法人管理PCでは無効化されている場合があります。その場合は上記のとおり admin 実行で問題ありません。
