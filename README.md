# POWERSHELL FRESHSERVICE MODULE

Powershell module for interacting with Freshservice via their API.

Provides the following commands for

| **Cmdlet Name**                  | **Params**              | **Param Description** | **Return Value**                                     |
|:---------------------------------|:------------------------|:----------------------|:-----------------------------------------------------|
| `ConvertFrom-FreshDate`          | `-FreshDate`            | *[string]*            | Convert from Fresh date format to AD friendly format |
|                                  | `-AD`                   | *[switch]*            | User records whose name matches string               |
| `ConvertTo-FreshDate`            | `-Date`                 | DateTime Object       | Date string that conforms to Fresh date formatting.  |
| `ConvertFrom-FreshDate`          | `FreshDate`             |                       |                                                      |
|                                  | `AD`                    |                       |                                                      |
| `ConvertTo-FreshDate`            | `Date`                  |                       |                                                      |
| `Get-FreshFailedStarterNotes`    | `Note`                  |                       |                                                      |
|                                  | `Html`                  |                       |                                                      |
|                                  | `Text`                  |                       |                                                      |
| `Get-FreshNoteString`            | `Ticket`                |                       |                                                      |
|                                  | `String`                |                       |                                                      |
| `Get-FreshRequestedItems`        | `TicketID`              |                       |                                                      |
| `Get-FreshServiceRequestDetails` | `RequestId`             |                       |                                                      |
| `Get-FreshStartersYears`         | `Ticket`                |                       |                                                      |
|                                  | `Years`                 |                       |                                                      |
| `Get-FreshTicketByID`            | `TicketId`              |                       |                                                      |
| `Get-FreshTicketNotes`           | `Ticket`                |                       |                                                      |
|                                  | `ShowDeleted`           |                       |                                                      |
| `Get-FreshTicketsByFilter`       | `Filter`                |                       |                                                      |
| `Get-FreshTicketsByID`           | `ViewID`                |                       |                                                      |
| `Get-FreshTicketStatus`          | `Ticket`                |                       |                                                      |
| `Get-FreshTxtTickets`            | `TicketId`              |                       |                                                      |
| `New-FreshNewStarterTicket`      | `FullName`              |                       |                                                      |
| `New-FreshServiceRequest`        | `Body`                  |                       |                                                      |
|                                  | `ItemDisplayId`         |                       |                                                      |
| `New-FreshStarterObject`         | `Ticket`                |                       |                                                      |
| `New-FreshStarterRequest`        | `RequestId`             |                       |                                                      |
|                                  | `Title`                 |                       |                                                      |
|                                  | `FirstName`             |                       |                                                      |
|                                  | `Surname`               |                       |                                                      |
|                                  | `JobTitle`              |                       |                                                      |
|                                  | `StartDate`             |                       |                                                      |
|                                  | `Department`            |                       |                                                      |
|                                  | `Location`              |                       |                                                      |
|                                  | `SubDepartment`         |                       |                                                      |
|                                  | `LineManager`           |                       |                                                      |
|                                  | `FloorOffice`           |                       |                                                      |
|                                  | `Telephone`             |                       |                                                      |
|                                  | `PermTemp`              |                       |                                                      |
|                                  | `PositionType`          |                       |                                                      |
|                                  | `EndDate`               |                       |                                                      |
|                                  | `NewMachine`            |                       |                                                      |
|                                  | `MachineType`           |                       |                                                      |
|                                  | `MachineModel`          |                       |                                                      |
|                                  | `MachineMisc`           |                       |                                                      |
|                                  | `AssetTag`              |                       |                                                      |
|                                  | `SpecialistSoftware`    |                       |                                                      |
|                                  | `ServerFolderAccess`    |                       |                                                      |
|                                  | `AdditionalInformation` |                       |                                                      |
| `New-FreshStartersReport`        | `Path`                  |                       |                                                      |
|                                  | `ViewId`                |                       |                                                      |
| `New-FreshTicket`                | `json`                  |                       |                                                      |
| `Test-FreshStarterRequest`       | `RequestId`             |                       |                                                      |
|                                  | `FirstName`             |                       |                                                      |
|                                  | `Department`            |                       |                                                      |
|                                  | `Location`              |                       |                                                      |
|                                  | `SubDepartment`         |                       |                                                      |
|                                  | `PermTemp`              |                       |                                                      |
|                                  | `PositionType`          |                       |                                                      |
| `Update-FreshTicket`             | `TicketID`              |                       |                                                      |
| `Update-FreshTicketNote`         | `TicketID`              |                       |                                                      |
|                                  | `Body`                  |                       |                                                      |
|                                  | `Private`               |                       |                                                      |
| `Update-FreshTicketStatus`       | `TicketId`              |                       |                                                      |
|                                  | `Status`                |                       |                                                      |
| `Update-FreshTicketWithPassword` | `TicketId`              |                       |                                                      |
|                                  | `SamAccountName`        |                       |                                                      |
|                                  | `Password`              |                       |                                                      |
