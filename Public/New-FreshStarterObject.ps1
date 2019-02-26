function New-FreshStarterObject {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory,ValueFromPipeline)]
	[object[]]$Ticket
    )

    process {
	try {
	    $DisplayId	= $Ticket.Display_Id
	    $Requests	= (Get-FreshRequestedItems $DisplayId).requested_item.requested_item_values
	    $FirstName	= $Requests.'First name'
	    $Surname	= $Requests.Surname
	    $Asset      = Get-FreshTicketByID $DisplayId | Get-FreshNoteString -String "Dog Tag"
	    $Breed      = Get-FreshTicketByID $DisplayId | Get-FreshNoteString -String "Dog Breed"
	    $Status     = Get-FreshTicketByID $DisplayId | Get-FreshTicketStatus
	    $TicketUrl	= "$URLv1/helpdesk/tickets/$DisplayId"
	    $Properties		= [ordered]@{
		Department	= $Requests.Department
		SubDepartment	= $Requests.'Sub Department'
		Location	= $Requests.Location
		Name		= $FirstName + " " + $Surname
		StartDate	= $Requests.'Start date'.SubString(0,10)
		Manager		= $Requests.'Line Manager'
		Model		= $Requests.Model
		Breed           = $Breed
		Asset           = $Asset
		Status          = $Status
		URL             = $TicketUrl
	    }
	    New-Object PSObject -Property $Properties
	} catch {
	    Write-Warning $_.InvocationInfo.ScriptName
	    Write-Warning $_.InvocationInfo.Line
	    Write-Warning $_.Exception.Message
	}
    }
}
