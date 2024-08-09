Import-Module -Name Terminal-Icons

# ANSIエスケープシーケンスで色を指定
$colors = @{
  # "`e[38;2;{R};{G};{B}m"でRGBカラーを指定
  Path = "`e[38;2;100;134;207m"
  SymbolSuccess = "`e[38;2;107;255;191m"
  SymbolError = "`e[38;2;219;75;91m"
}

# 色を適用するためのフィルタ
filter fmtColor($color) { $_ ? "$color$_`e[0m" : '' }

# プロンプト関数
function prompt() {
    $isError = !$?

    # ドライブ名(C:) を除き、ホームディレクトリは ~ に変換する
    $drive = $pwd.Drive.Name
    $path = $pwd.path.Replace($HOME, "~").Replace("${drive}:", "")

    Write-Host ""
    Write-Host ($path | fmtColor $colors.Path)

    $symbolColor = if ($isError) { $colors.SymbolError } else { $colors.SymbolSuccess }
    Write-Host ("❯" | fmtColor $symbolColor) -NoNewLine

    return " "
}

# 文字化け対策
[System.Console]::OutputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")
[System.Console]::InputEncoding = [System.Text.Encoding]::GetEncoding("utf-8")

Invoke-Expression (& { (zoxide init powershell | Out-String) })
