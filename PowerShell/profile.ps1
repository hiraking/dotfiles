# Force UTF-8 for console I/O (fixes mojibake on Japanese Windows)
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
$OutputEncoding = [System.Text.Encoding]::UTF8

# Starship prompt
Invoke-Expression (&starship init powershell)
Enable-TransientPrompt
