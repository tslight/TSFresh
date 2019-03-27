function Write-FreshStartersFinishedNote {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline,Position=0)]
	[array]$Tickets,
	[Parameter(Mandatory)]
	[System.IO.FileInfo]$LogFile
    )

    $Paws         = "&#x1F43E"
    $FreshLogPath = $LogFile.Replace("\","\\")
    $Url          = "https://media.giphy.com/media/HCTfYH2Xk5yw/giphy.gif"
    $Body         = "<img src=$Url><br>"
    $Body        += "<br>Changing ticket status to pending.<br><br>"
    $Body        += "Log available at $FreshLogPath<br>"
    $Body        += "<br><b>NEW STARTERS SCRIPT MUCH FINISHED. VERY WOW. $Paws<\/b>"

    foreach ($Ticket in $Tickets) {
	Update-FreshTicketNote $Ticket.Display_Id $Body -Private $True | Out-Null
	Write-Host "Updating Ticket $($Ticket.Display_id) status to pending."
	Update-FreshTicketStatus -TicketID $Ticket.Display_Id -status "3" | Out-Null
    }
}
