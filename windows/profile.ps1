# Custom PowerShell Profile
# Owner : Patrick Horne


Set-Alias -Name zip -Value Compress-Archive -Option AllScope
Set-Alias -Name unzip -Value Extract-Archive -Option AllScope
if (Test-Path -Path $PROFILE )
	{ Set-Alias -Name sublime -Value "C:\Program Files\Sublime Text 3\sublime_text.exe" -Option AllScope}