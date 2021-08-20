function ConvertFrom-FreshDate {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline,Position=0)]
	[string]$FreshDate,
	[Parameter()]
	[switch]$AD
    )

    process {
	$Year	= $FreshDate.Substring(0, 4)
	$Month	= $FreshDate.Substring(5, 2)
	$Day	= $FreshDate.Substring(8, 2)

	$DateArgs = @{
	    Year	= $Year
	    Month	= $Month
	    Day		= $Day
	    Hour	= 0
	    Minute	= 0
	    Second	= 0
	}

	if ($AD) {
	    $Date = Get-Date @DateArgs
	    $Date = $Date.AddDays(1)
	}

	return $Date
    }
}
