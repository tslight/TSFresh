function Get-FreshRequestedItems {
    param (
	[Parameter(Mandatory)]
	[int]$TicketID
    )

    $Resource = "/helpdesk/tickets/$TicketID/requested_items.json"
    $Method = "GET"

    New-FreshRequest -Method $Method -Resource $Resource
}
