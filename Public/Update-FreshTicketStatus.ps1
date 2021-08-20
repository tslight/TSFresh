function Update-FreshTicketStatus {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,Position=0)]
	[int]$TicketId,
	[Parameter(Mandatory,Position=1)]
	[int]$Status
    )

    $Method	= "PUT"
    $Resource	= "/helpdesk/tickets/$TicketID.json"
    $json	= '{ "helpdesk_ticket": { "status":__STATUS__ }}'
    $json	= $json.Replace("__STATUS__", $Status)

    New-FreshRequest -Method $Method -Resource $Resource -json $json
}
