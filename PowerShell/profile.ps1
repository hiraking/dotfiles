# Load Utility explicitly. Otherwise the first Utility cmdlet (Write-Host,
# Out-String, ...) triggers command auto-discovery, which scans every module
# in PSModulePath. With many modules installed (e.g. Az) that costs ~1.5s warm
# and ~18s on a cold start.
Import-Module Microsoft.PowerShell.Utility

# Force UTF-8 for console I/O (fixes mojibake on Japanese Windows)
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Starship prompt
Invoke-Expression (&starship init powershell)
Enable-TransientPrompt

# zoxide (must come after anything that redefines `prompt`)
Invoke-Expression (& { (zoxide init powershell | Out-String) })
