function Get-FreshTicketsByFilter {
    param (
	[Parameter(Mandatory = $true, Position = 0)]
	[string]$Filter
    )

    $HasContent = $true
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
	    $HasContent = $false
	}
    }

    return $Tickets
}
