function Get-FreshRequestedItems {
    param (
	[Parameter(Mandatory = $true, Position = 0)]
	[Int32]$TicketID
    )

    $Resource = "/helpdesk/tickets/$TicketID/requested_items.json"

    [string]$method = "GET"
    return New-FreshRequest -method $method -resource $Resource
}
