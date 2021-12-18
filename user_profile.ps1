# Prompt
Import-Module posh-git
Import-Module oh-my-posh
Set-PoshPrompt Paradox

# load config
function Get-ScriptDirectory { Split-Path $MyInvocation.ScriptName }
$CONFIG = Join-Path (Get-ScriptDirectory) 'takuya.omp.json'
oh-my-posh --init --shell pwsh --config $CONFIG | Invoke-Expression

# icons
Import-Module Terminal-Icons

# PSReadLine
Set-PSReadLineOption -EditMode Emacs
Set-PSReadLineOption -BellStyle None
Set-PSReadLineKeyHandler -Chord 'Ctrl+d' -Function DeleteChar
Set-PSReadLineOption -PredictionSource History

# FZF
Import-Module PSFzf
Set-PsFzfOption -PSReadLineChordProvider 'Ctrl+f' -PSReadlineChordReverseHistory 'Ctrl+r'

# Alias
Set-Alias vim nvim
Set-Alias ll ls
Set-Alias g git
Set-Alias grep findstr
Set-Alias tig 'C:\Program Files\Git\usr\bin\tig.exe'
Set-Alias less 'C:\Program Files\Git\usr\bin\less.exe'

# Utilities
function which ($command) {
	Get-Command -Name $command -ErrorAction SilentlyContinue
		Select-Object -ExpandProperty Path -ErrorAction
	}
