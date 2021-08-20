function Get-FreshTicketsByID {
    param (
	[Parameter(Mandatory)]
	[int]$ViewID
    )

    $HasContent = $True
    $PageNumber = 1
    $Tickets = @()

    while ($HasContent) {
	$Resource = "/helpdesk/tickets/view/$($ViewID)?format=json&page=$($PageNumber)"
	$Response = New-FreshRequest -Method "GET" -Resource $Resource
	if ($Response) {
	    foreach ($Ticket in $Response) {
		$Tickets += $Ticket
	    }
	    $PageNumber++
	} else {
	    $HasContent = $False
	}
    }

    return $Tickets
}
