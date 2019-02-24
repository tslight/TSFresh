function Update-FreshTicketWithPassword {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,Position=0)]
	[int]$TicketId,
	[Parameter(Mandatory,Position=1)]
	[string]$SamAccountName,
	[Parameter(Mandatory,Position=2)]
	[string]$Password
    )

    $Body = "Username: $SamAccountName\nPassword: $Password"

    try {
	Update-FreshTicketNote -TicketID $TicketId -Body $Body -Private $True
    } catch {
	Write-Output "Exception: $($_.Exception.Message) - Unable to update ticket with credentials."
    }
}
