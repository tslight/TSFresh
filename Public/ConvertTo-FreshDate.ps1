function ConvertTo-FreshDate {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[DateTime]$Date
    )

    Process {
	$Date | Get-Date -UFormat "%Y-%m-%dT%H:%M:%S+00:00"
    }
}
