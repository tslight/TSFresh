function Get-FreshTicketsByFilter {
    param (
	[Parameter(Mandatory)]
	[string]$Filter
    )

    $HasContent = $True
    $PageNumber = 1
    $Tickets = @()

    while ($HasContent) {
	$Resource = "/helpdesk/tickets/filter/$($Filter)?format=json&page=$($PageNumber)"
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
