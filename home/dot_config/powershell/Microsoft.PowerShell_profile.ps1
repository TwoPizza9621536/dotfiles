# SPDX-License-Identifier: CC0-1.0
Import-Module posh-git
Import-Module Terminal-Icons
Import-Module PSReadLine
Import-Module PSDscResources

# Theme
oh-my-posh --init --shell pwsh --config ~/.config/p10k.omp.json | Invoke-Expression
$env:POSH_GIT_ENABLED = $true

# PSReadLine
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadLineOption -EditMode Vi
Set-PSReadLineOption -MaximumHistoryCount 10000
Set-PSReadLineOption -PredictionViewStyle ListView
Set-PSReadLineOption -ViModeIndicator Cursor

# Do Not Add Secret History
Set-PSReadLineOption -AddToHistoryHandler {
  param([string]$line)

  $sensitive = "password|asplaintext|token|key|secret|TOKEN|KEY|SECRET"
  return ($line -notmatch $sensitive)
}
Set-PSReadlineKeyHandler -Key Tab -Function MenuComplete
Set-PSReadlineKeyHandler -Key UpArrow -Function HistorySearchBackward
Set-PSReadlineKeyHandler -Key DownArrow -Function HistorySearchForward
Set-PSReadLineKeyHandler -Key Ctrl+d -Function DeleteCharOrExit

# Aliases
New-Alias -Name "cat" -Value "bat" -Force
New-Alias -Name "find" -Value "fd"
New-Alias -Name "fzf" -Value "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
New-Alias -Name "grep" -Value "rg"
New-Alias -Name "neofetch" -Value "hyfetch"
New-Alias -Name "tb" -Value "toolbox enter"

Invoke-Expression "$(thefuck --alias)"

if ($env:TERM_PROGRAM -ne "vscode") {
  neofetch
}
