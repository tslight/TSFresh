function Test-FreshStarterRequest {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[string]$RequestId="77",
	[string]$FirstName=$(Read-Host "Enter a firstname"),
	[string]$Department=$(Read-Host "Enter a department"),
	[string]$Location=$(Read-Host "Enter a location"),
	[string]$SubDepartment=$(Read-Host "Enter a Sub-department"),
	[string]$PermTemp="Temp",
	[string]$PositionType="New Position"
    )

    $Form = @{
	RequestId		= $RequestId
	Title			= "Mr"
	FirstName		= $FirstName
	Surname			= "TobyNSTest"
	Department		= $Department
	Location		= $Location
	SubDepartment		= $SubDepartment
	JobTitle		= "TestJobTitle"
	StartDate		= (Get-Date).AddDays(30) | ConvertTo-FreshDate
	LineManager		= "TestManager"
	FloorOffice		= "na"
	Telephone		= "Yes"
	PermTemp		= $PermTemp
	PositionType		= $PositionType
	EndDate			= (Get-Date).AddDays(60) | ConvertTo-FreshDate
	NewMachine		= "Yes"
	MachineType             = "Apple Mac laptop"
	MachineMisc		= "Apple MacBook Pro 13-inch"
	AssetTag		= ""
	SpecialistSoftware	= "na"
	ServerFolderAccess	= "na"
	AdditionalInformation	= ""
    }

    $Name = $Form['FirstName'] + " " + $Form['Surname']
    try {
	New-FreshStarterRequest @Form | Out-Null
	Write-Host -Back Black -Fore Cyan "Successfully created ticket for $Name."
    } catch {
	Write-Warning "FAILED to created ticket for $Name."
	Write-Warning $_.Exception.Message
	Write-Warning $_.InvocationInfo.ScriptName
	Write-Warning $_.InvocationInfo.PositionMessage
    }
}
