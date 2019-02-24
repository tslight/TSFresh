function Get-FreshEquipmentRequest {
    param (
	[string]$EquipmentType,
	[string]$OtherInfo,
	[string]$for
    )

    $table = @{
	"requested_item_values" = @{
	    "35" = @{
		"item_id" = "25000000158"
		"requested_item_value_attributes" = @{
		    "machine_needed_25000000158" = ""
		    "further_info_25000000158" = $for
		}
	    }
	}
    }

    New-FreshServiceRequest -Body $table -ItemDisplayId 35
}
