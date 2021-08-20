function New-FreshTicket {
    param (
	[Parameter(Mandatory = $true, Position = 0)]
	[string]$json
    )

    $Uri =  "/helpdesk/tickets.json"
    $Method = "POST"
    New-FreshRequest -Method $Method -Resource $Uri -data $json
}
