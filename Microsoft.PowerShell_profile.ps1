Import-Module -Name CompletionPredictor
Import-Module -Name Terminal-Icons
Import-Module -Name ZLocation

Import-Module -Name pure-pwsh
# ANSI escape sequence "38;2;r;g;b"
$pure.PwdColor    = "38;2;129;145;255"
$pure.PromptColor = "38;2;61;216;255"
$pure.ErrorColor  = "38;2;255;70;70"

$env:PYTHONIOENCODING="utf-8"
iex "$(thefuck --alias)"
