function New-FreshRequest {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,Position=0)]
	[string]$Method,
	[Parameter(Mandatory,Position=1)]
	[string]$Resource,
	[Parameter(Position=2)]
	[string]$Json
    )

    $Uri = $Url + $Resource

    $InvokeArgs = @{
	Method			= $Method
	Uri			= $Uri
	Headers			= $HTTPHeaders
	UseDefaultCredentials	= $True
    }

    if ($Method -eq "PUT" -or $Method -eq "POST") {
	$InvokeArgs.Add("Body",$Json)
    }

    try {
	Invoke-RestMethod @InvokeArgs
    } catch {
	throw
    }
}
