Function Export-FreshTicketYears {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object]$Years,
	[Parameter(Mandatory)]
	[System.IO.FileInfo]$Path
    )

    begin {
	$YearsArr = $Years.PSObject.Properties.Name | ? { $_ -match '^\d{4}$' }
    }

    process {
	$YearsArr | Export-FreshTicketYear -Path $Path
    }
}
