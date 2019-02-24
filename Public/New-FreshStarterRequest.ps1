function New-FreshStarterRequest {
    [CmdletBinding(SupportsShouldProcess)]
    Param (
	[Parameter(Mandatory)]
	[string]$RequestId,
	[Parameter(Mandatory)]
	[string]$Title,
	[Parameter(Mandatory)]
	[string]$FirstName,
	[Parameter(Mandatory)]
	[string]$Surname,
	[Parameter(Mandatory)]
	[string]$JobTitle,
	[Parameter(Mandatory)]
	[string]$StartDate,
	[Parameter(Mandatory)]
	[string]$Department,
	[Parameter(Mandatory)]
	[string]$Location,
	[AllowEmptyString()]
	[AllowNull()]
	[string]$SubDepartment="",
	[Parameter(Mandatory)]
	[string]$LineManager,
	[Parameter(Mandatory)]
	[string]$FloorOffice,
	[Parameter(Mandatory)]
	[string]$Telephone,
	[Parameter(Mandatory)]
	[string]$PermTemp,
	[Parameter(Mandatory)]
	[string]$PositionType,
	[Parameter(Mandatory)]
	[AllowEmptyString()]
	[AllowNull()]
	[string]$EndDate="",
	[Parameter(Mandatory)]
	[string]$NewMachine,
	[AllowEmptyString()]
	[AllowNull()]
	[string]$MachineType="",
	[AllowEmptyString()]
	[AllowNull()]
	[string]$MachineModel="",
	[AllowEmptyString()]
	[AllowNull()]
	[string]$MachineMisc="",
	[AllowEmptyString()]
	[AllowNull()]
	[string]$AssetTag="",
	[string]$SpecialistSoftware="n/a",
	[string]$ServerFolderAccess="n/a",
	[AllowEmptyString()]
	[AllowNull()]
	[string]$AdditionalInformation=""
    )

    $CatalogItemId = ((Get-FreshServiceRequestDetails $RequestId).Catalog_Item).Id
    $DepartmentItemId = ((Get-FreshServiceRequestDetails $RequestId).Catalog_Item.Custom_Fields | ? { $_.name -like 'department_*' }).Id
    $MachineItemId = ((Get-FreshServiceRequestDetails $RequestId).Catalog_Item.Custom_Fields | ? { $_.name -like 'do_you_need_a_new_machine_*' }).Id

    $RequestedItems = [ordered]@{
	"requested_item_values" = [ordered]@{
	    $RequestId = [ordered]@{
		"item_id" = "$CatalogItemId"
		"requested_item_value_attributes" = [ordered]@{
		    "title_$CatalogItemId" = $Title
		    "first_name_$CatalogItemId" = $FirstName
		    "surname_$CatalogItemId" = $Surname
		    "job_title_$CatalogItemId" = $JobTitle
		    "start_date_$CatalogItemId" = $StartDate
		    "department_$CatalogItemId" = $Department
		    "location_$DepartmentItemId" = $Location
		    "sub_department_$DepartmentItemId" = $SubDepartment
		    "line_manager_$CatalogItemId" = $LineManager
		    "flooroffice_$CatalogItemId" = $FloorOffice
		    "telephone_extension_required_yes_or_no_$CatalogItemId" = $Telephone
		    "permanent___temp_$CatalogItemId" = $PermTemp
		    "replacement__new_position_$CatalogItemId" = $PositionType
		    "contract_end_date_$CatalogItemId" = $EndDate
		    "do_you_need_a_new_machine_$CatalogItemId" = $NewMachine
		    "options_$MachineItemId" = $MachineType
		    "model_$MachineItemId" = $MachineModel
		    "if_yes_you_will_need_to_order_a_machine_please_fill_in_the_new_computer_form_$CatalogItemId" = $MachineMisc
		    "if_no_what_is_the_asset_tag_and_where_is_the_machine_$CatalogItemId" = $AssetTag
		    "what_specialist_software_do_you_need_if_any_$CatalogItemId" = $SpecialistSoftware
		    "please_confirm_server_and_folder_access_or_anything_else_$CatalogItemId" = $ServerFolderAccess
		    "additional_information_$CatalogItemId" = $AdditionalInformation
		}
	    }
	}
    }

    $Uri = "/catalog/request_items/$RequestId/service_request.json"
    $json = ConvertTo-Json $RequestedItems -Depth 100

    try {
	New-FreshRequest -Method Post -Resource $Uri -json $json
    } catch {
	throw
    }
}
