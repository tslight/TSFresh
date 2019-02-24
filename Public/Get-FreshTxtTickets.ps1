function Get-FreshTxtTickets {
    [CmdletBinding()]
    Param (
	[Parameter(Mandatory,Position=0)]
	[string]$TicketId
    )

    $Ticket = $TicketsDir + "\" + $TicketId + ".txt"

    if ($Ticket) {
	$Content = Get-Content $Ticket
	$Fields = @{}
	for ($i = 0; $i -lt $Content.Length; $i+=2) {
	    $Fields.Add($Content[$i], $Content[$i+1].Trim())
	}
	return $Fields
    } else {
	Write-Warning "$Ticket doesn't exist."
	return $Null
    }
}
