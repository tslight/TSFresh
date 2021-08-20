function Update-FreshTicketNote {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,Position=0)]
	[int]$TicketID,
	[Parameter(Mandatory,Position=1)]
	[string]$Body,
	[Parameter(Mandatory,Position=2)]
	[boolean]$Private
    )

    $json = '{ "body":"__BODY__", "private":__PRIVATE__ }'.Replace("__BODY__", $Body)
    $json = $json.Replace("__PRIVATE__", $Private.ToString().ToLower())
    New-FreshRequest -Method "POST" -Resource "/api/v2/tickets/$ticketID/notes" -json $json
}
