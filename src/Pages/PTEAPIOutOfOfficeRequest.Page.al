page 50105 "PTE API Out Of Office Request"
{
    APIGroup = 'apiGroupInsert';
    APIPublisher = 'publisherTest';
    APIVersion = 'v2.0', 'v1.0';
    ApplicationArea = All;
    Caption = 'pteAPIOutOfOfficeRequest';
    DelayedInsert = true;
    EntityName = 'request';
    EntitySetName = 'requests';
    PageType = API;
    ODataKeyFields = "Entry No.";
    SourceTable = "PTE Out of Office Request";
    InsertAllowed = true;
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field(entryNo;Rec."Entry No.")
                {
                    Caption = 'Entry No.';
                    Editable = false;
                }
                field(description; Rec.Description)
                {
                    Caption = 'Description';
                }
                field(employeeNo; Rec."Employee No.")
                {
                    Caption = 'Employee No.';
                }
                field(endDate; Rec."End Date")
                {
                    Caption = 'End Date';
                }
                field(endTime; Rec."End Time")
                {
                    Caption = 'End Time';
                }
                field(reasonCode; Rec."Reason Code")
                {
                    Caption = 'Reason Code';
                }
                field(startDate; Rec."Start Date")
                {
                    Caption = 'Start Date';
                }
                field(startTime; Rec."Start Time")
                {
                    Caption = 'Start Time';
                }
                field(status; Rec.Status)
                {
                    Caption = 'Status';
                    Editable = false;
                }
            }
        }
    }
}
