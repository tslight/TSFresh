function Get-FreshTicketStatus {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object]$Ticket
    )

    process {
	$Statuses = @{
	    2	= "Open"
	    3	= "Pending"
	    4	= "Resolved"
	    5	= "Closed"
	    6	= "In Progress"
	    7	= "Awaiting Customer"
	    8	= "Awaiting Supplier"
	    9	= "Awaiting Colleague"
	    10	= "Awaiting Approval"
	}
	$Status = $Ticket.helpdesk_ticket.status
	$Statuses[$Status]
    }
}
