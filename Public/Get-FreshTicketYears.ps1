function Get-FreshTicketYears {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object[]]$Ticket,
	[object]$Years
    )

    process {
	Write-Verbose "Adding $($Ticket.Name)..."

	$Date		= $Ticket.StartDate
	$Year		= $Date.SubString(0,4)
	$Month		= Get-Date -Month $Date.SubString(5,2) -UFormat '%b'
	$Day		= $Date.SubString(8,2)
	$DayOfWeek	= $Ticket.StartDate | Get-Date -UFormat "%a"

	switch ([int]$Day) {
	    { $_ -gt  0 -and $_ -le  7 } {
		$Years.$Year.$Month.'Week 1'.$DayOfWeek += $Ticket
	    }
	    { $_ -gt 07 -and $_ -le 14 } {
		$Years.$Year.$Month.'Week 2'.$DayOfWeek += $Ticket
	    }
	    { $_ -gt 14 -and $_ -le 21 } {
		$Years.$Year.$Month.'Week 3'.$DayOfWeek += $Ticket
	    }
	    { $_ -gt 21 -and $_ -le 28 } {
		$Years.$Year.$Month.'Week 4'.$DayOfWeek += $Ticket
	    }
	    { $_ -gt 28 -and $_ -le 31 } {
		$Years.$Year.$Month.'Week 5'.$DayOfWeek += $Ticket
	    }
	}
    }

    end {
	return $Years
    }
}
