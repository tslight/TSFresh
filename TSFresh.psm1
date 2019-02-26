#region get public and private function definition files.
$Public  = @( Get-ChildItem -Path $PSScriptRoot\Public\*.ps1 -ErrorAction SilentlyContinue )
$Private = @( Get-ChildItem -Path $PSScriptRoot\Private\*.ps1 -ErrorAction SilentlyContinue )
#endregion

#region source the files
foreach ($import in @($Public + $Private)) {
    Try {
	. $import.fullname
    } Catch {
	Write-Error -Message "Failed to import function $($import.fullname): $_"
    }
}
#endregion

#region read in or create an initial config file
$ConfigFile = "Config.psd1"
if (Test-Path "$PSScriptRoot\$ConfigFile") {
    try {
	$Config             = Import-LocalizedData -BaseDirectory $PSScriptRoot -FileName $ConfigFile
	$FreshAPIKeyFile    = $Config.FreshAPIKeyFile
	$FreshAPIKey	    = ConvertFrom-SecureFile $FreshAPIKeyFile
	$EncodedCredentials = [Convert]::ToBase64String([Text.Encoding]::ASCII.GetBytes(("{0}:{1}" -f $FreshAPIKey,$null)))
	$HTTPHeaders	    = @{
	    'Authorization' = ("Basic {0}" -f $EncodedCredentials)
	    'Content-Type'  = 'application/json'
	}
	$URL		    = $Config.URL
	$URLv1              = $Config.URLv1
	$EmailAddress       = $Config.EmailAddress
    } catch {
	Write-Warning "Invalid configuration data in $ConfigFile."
	Write-Warning "Please fill out or correct $PSScriptRoot\$ConfigFile."
	Write-Verbose $_.Exception.Message
	Write-Verbose $_.InvocationInfo.ScriptName
	Write-Verbose $_.InvocationInfo.PositionMessage
    }
} else {
    @"
@{
    FreshAPIKeyFile = ""
    URL             = ""
    URLv1           = ""
    EmailAddress    = ""
}
"@ | Out-File -Encoding UTF8 -FilePath "$PSScriptRoot\$ConfigFile"
    Write-Warning "Generated $PSScriptRoot\$ConfigFile."
    Write-Warning "Please edit $ConfigFile and re-import module."
}
#endregion

#region set variables visible to the module and its functions only
# https://stackoverflow.com/a/46254549
$AllProtocols = [System.Net.SecurityProtocolType]'Ssl3,Tls,Tls11,Tls12'
[System.Net.ServicePointManager]::SecurityProtocol = $AllProtocols
#endregion

#region export Public functions ($Public.BaseName) for WIP modules
Export-ModuleMember -Function $Public.Basename
#endregion
